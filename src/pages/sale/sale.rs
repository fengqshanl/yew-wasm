use web_sys::HtmlFormElement;
use yew::prelude::*;
use super::model::{DrugDetail, DrugOrigin, DrugDetailColumn, SaleOrigin};
use wasm_bindgen::JsCast;
use crate::ownhttp::myhttp::request;
use crate::components::table::{OwnTableComponent};
use crate::pages::sale::model::SaleAdd;
use yew::{function_component, html};
use yew_hooks::{use_async};

#[function_component(Sale)]
pub fn sale() -> Html {
    let id = use_state(String::default);
    let drug_value = use_state(Vec::default);
    let sale_need_do = use_state(SaleAdd::default);
    let put_sale = {
        let sale_need = sale_need_do.clone();
        use_async(async move {
            request::<SaleAdd, Vec<DrugDetail>>(reqwest::Method::POST, "/sale".to_string(), (*sale_need).clone(), false).await
        })
    };
    let add_sale = {
        let sale_need = sale_need_do.clone();
        use_async(async move {
            request::<SaleAdd, Vec<DrugDetail>>(reqwest::Method::PUT, "/sale".to_string(), (*sale_need).clone(), false).await
        })
    };
    let get_detail_by_id = {
        let put_sale = put_sale.clone();
        let add_sale = add_sale.clone();
        let sale_need = sale_need_do.clone();
        let drug_value = drug_value.clone();
        let id = id.clone();
        // TODO 优化 url 格式化
        use_async(async move {
            request::<(), DrugOrigin>(reqwest::Method::GET, format!("/purchase_sale_detail?id={}", (*id).clone()), (), false).await.and_then(move|detail|{
                let mut tips = (*drug_value).clone();
                let tar = (*drug_value).clone()
                            .into_iter()
                            .filter(|drug: &DrugDetail| drug.code == (*id).clone()).collect::<Vec<DrugDetail>>();
                // 重复扫码 数量叠加 并移到首位
                if tar.len() == 1 {
                    // 修改操作
                    log::info!("tar: == 1 deps{:?}", tar);
                    let mut tar = tar[0].clone();
                    tar.number += 1;
                    let mut target = (*drug_value).clone()
                            .into_iter()
                            .filter(|drug: &DrugDetail| drug.code != (*id).clone()).collect::<Vec<DrugDetail>>();
                    sale_need.set(SaleAdd{
                        sale_id: tar.sale_id.clone(),
                        drug_id: tar.drug_id.clone(),
                        code: tar.code.clone(),
                        name: tar.name.clone(),
                        sale_money: tar.sale_money.clone(),
                        spec: tar.spec.clone(),
                        manu_name: tar.manu_name.clone(),
                        number: tar.number.clone(),
                        total:  tar.sale_money * tar.number as f64
                    });
                    target.insert(0, tar);
                    drug_value.set(target);
                    put_sale.run();
                }else if tar.len() == 0 {
                    // 添加操作
                    log::info!("tar: == 0 deps{:?}, detail:{:?}, id:{:?}, drug_value: {:?}", tar, detail, (*id).clone(), (*drug_value).clone());
                    let tar = DrugDetail { sale_id: None,
                        drug_id: detail.drug_id,name: detail.name.clone(), code: detail.code.clone(), spec: detail.spec.clone(), 
                        manu_name: detail.manu_address.clone(), number: 1, sale_money: detail.sale_money.clone() 
                    };
                    tips.insert(0, tar.clone());
                    sale_need.set(SaleAdd{
                        sale_id: None,
                        drug_id: tar.drug_id.clone(),
                        code: tar.code.clone(),
                        name: tar.name.clone(),
                        sale_money: tar.sale_money.clone(),
                        spec: tar.spec.clone(),
                        manu_name: tar.manu_name.clone(),
                        number: tar.number.clone(),
                        total:  tar.sale_money * tar.number as f64
                    });
                    drug_value.set(tips.to_vec());
                }
                add_sale.run();
                Ok(())
            })
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
                // log::info!("tar: {:?}", tar);
                if tar.len() == 1 {
                    log::info!("tar == 1: {:?}", tar);
                    let mut tar = tar[0].clone();
                    tar.number += 1;
                    let mut target = (*drug_value).clone()
                            .into_iter()
                            .filter(|drug: &DrugDetail| drug.code != current_id.clone()).collect::<Vec<DrugDetail>>();
                    target.insert(0, tar);
                    drug_value.set(target);
                }else if tar.len() == 0 {
                    log::info!("tar == 0: {:?}", tar);
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
                data_index: "sale_money".to_string()
            },
            DrugDetailColumn{
                title: "总价".to_string(),
                data_index: "total".to_string()
            },
            DrugDetailColumn{
                title: "操作".to_string(),
                data_index: "detail".to_string()
            },
        ];
    let tip_handler = {
        let drug_value = drug_value.clone();
        Callback::from(move|record: DrugDetail|{
            let target = (*drug_value).clone()
                    .into_iter()
                    .filter(|drug: &DrugDetail| drug.code != record.code).collect::<Vec<DrugDetail>>();
            drug_value.set(target);
        })
    };
    // let mut current_id: String = String::default();
    // let even = Closure::<dyn FnMut(KeyboardEvent)>::wrap(
    //     Box::new(move |e: KeyboardEvent| {
    //         let num: u32 = 13; 
    //         if e.char_code() != num {
    //             current_id += &e.key();
    //         } else {
    //             if (current_id.chars().count() == 13) || (current_id.chars().count() == 14) {
    //                 search_add.emit(current_id.clone());
    //             }
    //             current_id = "".to_string();
    //         }
    //     })
    // );
    // {
    //     use_effect_once(move||{
    //         document().add_event_listener_with_callback("keypress", even.as_ref().unchecked_ref()).expect("msg");
    //         || even.forget()
    //     });
    // }
    let tem_function = {
        let drug = search_add.clone();
        Callback::from(move |e: FocusEvent| {
            e.prevent_default();
            let form = web_sys::FormData::new_with_form(
                &e.target().and_then(|t| t.dyn_into::<HtmlFormElement>().ok()).expect("msg")
            ).expect("create FormData failed");
            let code = form.get("tem").as_string().expect("msg");
            if code.chars().count() >= 13 {
                log::info!("code: {:?}", code.clone());
                drug.emit(code.clone());
            }
        })
    };
    html! {
        <div class="drug-components"> 
            <nav class="navbar is-transparent">
                <div class="navbar-brand drug-in-components-nav-bar">
                    {"销售"}
                </div>
            </nav>
            <div class="drug-in-components-content">
                <form onsubmit={tem_function}>
                    <input name={"tem"} />
                    <button type="submit">{"submit"}</button>
                </form>
                <OwnTableComponent<DrugDetail, DrugDetailColumn> data={(*drug_value).clone()} columns={columns} pagination={false} handler={tip_handler} />
            </div>
        </div>
    }
}