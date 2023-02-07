use gloo_utils::document;
use wasm_bindgen::prelude::Closure;
use yew::prelude::*;
use super::model::{DrugDetail, DrugOrigin, DrugDetailColumn};
use wasm_bindgen::JsCast;
use crate::ownhttp::myhttp::request;
use crate::components::table::{OwnTableComponent};
use yew::{function_component, html};
use yew_hooks::{use_async, use_effect_once};

#[function_component(Sale)]
pub fn sale() -> Html {
    let id = use_state(String::default);
    let drug_value = use_state(Vec::default);
    let get_detail_by_id = {
        let id = id.clone();
        // TODO 优化 url 格式化
        use_async(async move {
            request::<(), DrugOrigin>(reqwest::Method::GET, format!("/drug?id={}", (*id).clone()), (), false).await
    })};
    let search_add = {
        let id = id.clone();
        let drug_value = drug_value.clone();
        let get_detail = get_detail_by_id.clone();
        Callback::from(move|current_id: String|{
            if (current_id.chars().count() == 13) || (current_id.chars().count() == 14) {
                let tar = (*drug_value).clone()
                            .into_iter()
                            .filter(|drug: &DrugDetail| drug.code == current_id.clone()).collect::<Vec<DrugDetail>>();
                // 重复扫码 数量叠加 并移到首位
                if tar.len() == 1 {
                    let mut tar = tar[0].clone();
                    tar.number += 1;
                    let mut target = (*drug_value).clone()
                            .into_iter()
                            .filter(|drug: &DrugDetail| drug.code != current_id.clone()).collect::<Vec<DrugDetail>>();
                    target.insert(0, tar);
                    drug_value.set(target);
                }else if tar.len() == 0 {
                    id.set(current_id.clone());
                    get_detail.run();
                }
            }
        })
    };
    let columns = vec![
            DrugDetailColumn{
                title: "序号".to_string(),
                data_index: "index".to_string()
            },
            DrugDetailColumn{
                title: "名称".to_string(),
                data_index: "name".to_string()
            },
            DrugDetailColumn{
                title: "规格".to_string(),
                data_index: "spec".to_string()
            },
            DrugDetailColumn{
                title: "厂家".to_string(),
                data_index: "manu_name".to_string()
            },
            DrugDetailColumn{
                title: "数量".to_string(),
                data_index: "number".to_string()
            },
            DrugDetailColumn{
                title: "零售价".to_string(),
                data_index: "number".to_string()
            },
            DrugDetailColumn{
                title: "操作".to_string(),
                data_index: "detail".to_string()
            },
        ];
    {
        let get_detail = get_detail_by_id.clone();
        let id = id.clone();
        let drug_value = drug_value.clone();
        use_effect_with_deps(move|detail|{
            if let Some(detail) = &detail.data {
                let mut tips = (*drug_value).clone();
                let tar = (*drug_value).clone()
                            .into_iter()
                            .filter(|drug: &DrugDetail| drug.code == (*id).clone()).collect::<Vec<DrugDetail>>();
                // 重复扫码 数量叠加 并移到首位
                if tar.len() == 1 {
                    let mut tar = tar[0].clone();
                    tar.number += 1;
                    let mut target = (*drug_value).clone()
                            .into_iter()
                            .filter(|drug: &DrugDetail| drug.code != (*id).clone()).collect::<Vec<DrugDetail>>();
                    target.insert(0, tar);
                    drug_value.set(target);
                }else if tar.len() == 0 {
                    tips.insert(0, DrugDetail { name: detail.goods_name.clone(), code: detail.code.clone(), spec: detail.spec.clone(), manu_name: detail.manu_name.clone(), number: 1 });
                    drug_value.set(tips.to_vec());
                }
                id.set("".to_string());
            }
            || ()
        }, get_detail)
    }
    let tip_handler = {
        let drug_value = drug_value.clone();
        Callback::from(move|record: DrugDetail|{
            let target = (*drug_value).clone()
                    .into_iter()
                    .filter(|drug: &DrugDetail| drug.code != record.code).collect::<Vec<DrugDetail>>();
            drug_value.set(target);
        })
    };
    let mut current_id: String = String::default();
    let even = Closure::<dyn FnMut(KeyboardEvent)>::wrap(
        Box::new(move |e: KeyboardEvent| {
            let num: u32 = 13; 
            if e.char_code() != num {
                current_id += &e.key();
            } else {
                if (current_id.chars().count() == 13) || (current_id.chars().count() == 14) {
                    search_add.emit(current_id.clone());
                }
                current_id = "".to_string();
            }
        })
    );
    {
        use_effect_once(move||{
            document().add_event_listener_with_callback("keypress", even.as_ref().unchecked_ref()).expect("msg");
            || even.forget()
        });
    }
    html! {
        <div class="drug-components"> 
            <nav class="navbar is-transparent">
                <div class="navbar-brand drug-in-components-nav-bar">
                    {"销售"}
                </div>
            </nav>
            <div class="drug-in-components-content">
                <OwnTableComponent<DrugDetail, DrugDetailColumn> data={(*drug_value).clone()} columns={columns} pagination={false} handler={tip_handler} />
            </div>
        </div>
    }
}