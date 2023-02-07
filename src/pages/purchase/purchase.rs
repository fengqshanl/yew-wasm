use crate::back::purchase::BKPurchase;
use crate::components::table::{OwnTableComponent};
use crate::pages::sale::model::DrugOrigin;
use chrono::Local;
use sp_yew::uuid::Uuid;
use wasm_bindgen::JsCast;
use web_sys::{HtmlInputElement, HtmlFormElement};
use yew::prelude::*;
use yew::{html};
use crate::ownhttp::myhttp::request;
use yew_hooks::{use_async, use_effect_once};
use crate::components::{
    modal::OwnModalComponent,
};

use super::models::{DrugInData, PurchaseType, DrugInColumn, PurchaseInColumn};

#[function_component(Purchase)]
pub fn purchase() -> Html {
    let drug_info: UseStateHandle<Vec<DrugInData>> = use_state(Vec::default);
    let drug_detail = use_state(PurchaseType::default);
    let purchase_list: UseStateHandle<Vec<PurchaseType>> = use_state(Vec::default);
    let visible = use_state(|| false);
    let get_drug_in_data = use_async(async move {
        request::<(), Vec<DrugInData>>(reqwest::Method::GET, "/purchase".to_string(), (), false).await
    });
    let get_detail_by_id = {
        let detail = drug_detail.clone();
        // TODO 优化 url 格式化
        use_async(async move {
            request::<(), DrugOrigin>(reqwest::Method::GET, format!("/drug?id={}", (*detail).clone().code), (), false).await
    })};
    let save_purchase = {
        let purchase_list = purchase_list.clone();
        use_async(async move {
            let mut money: f32 = 0.0;
            for row in (*purchase_list).iter() {
                money = money + row.self_money.parse::<f32>().expect("msg");
            }; 
            let fmt = "%Y年%m月%d日 %H:%M:%S";
            let now = Local::now().format(fmt);
            let tar = BKPurchase{
                per_id: Uuid::new_v4().to_string(),
                kind: (*purchase_list).len().try_into().expect("msg"),
                money: money.into(),
                detail: (*purchase_list).clone(),
                in_time: now.to_string()
            };
            request::<BKPurchase, Vec<DrugInData>>(reqwest::Method::POST, "/purchase".to_string(), tar, false).await
    })};
    let columns = vec![
        DrugInColumn {
            title: "序号".to_string(),
            data_index: "index".to_string(),
        },
        DrugInColumn {
            title: "进货总额".to_string(),
            data_index: "money".to_string(),
        },
        DrugInColumn {
            title: "药品种类".to_string(),
            data_index: "kind".to_string(),
        },
        DrugInColumn {
            title: "入库时间".to_string(),
            data_index: "in_time".to_string(),
        },
        DrugInColumn {
            title: "采购详情".to_string(),
            data_index: "detail".to_string(),
        },
    ];
    let purchase_columns = vec![
        PurchaseInColumn{ 
            title: "序号".to_string(), 
            data_index: "index".to_string(),
        },
        PurchaseInColumn{ 
            title: "药品名称".to_string(), 
            data_index: "name".to_string() ,
        },
        PurchaseInColumn{ 
            title: "售价".to_string(), 
            data_index: "sale_money".to_string(),
        },
        PurchaseInColumn{ 
            title: "进价".to_string(), 
            data_index: "self_money".to_string() ,
        },
        PurchaseInColumn{ 
            title: "数量".to_string(), 
            data_index: "number".to_string() ,
        },
        PurchaseInColumn{ 
            title: "操作".to_string(), 
            data_index: "detail".to_string(),
        },
    ];
    {
        let get_detail = get_detail_by_id.clone();
        let drug = drug_detail.clone();
        use_effect_with_deps(move|detail|{
            if let Some(detail) = &detail.data {
                let pur = PurchaseType { 
                    name: detail.goods_name.clone(), 
                    code: detail.code.clone(),
                    spec: detail.spec.clone(), 
                    self_money: "".to_string(),
                    sale_money: "".to_string(),
                    manu_address: detail.manu_name.clone(), 
                    number: 1.to_string() 
                };
                drug.set(pur);
            }
            
            || ()
        }, get_detail)
    }
    let on_save = {
        let save_purchase = save_purchase.clone();
        let visible = visible.clone();
        let get_drug = get_drug_in_data.clone();
        Callback::from(move |_|{
            save_purchase.run();
            visible.set(false);
            get_drug.run();
        })
    };
    let on_cancel = {
        let visible = visible.clone();
        Callback::from(move |_|{
            visible.set(false);
        })
    };
    let open_modal = {
        let visible = visible.clone();
        Callback::from(move |_|{
            visible.set(true);
        })
    };
    let save_one_purchase = {
        let drug = drug_detail.clone();
        let get_detail = get_detail_by_id.clone();
        Callback::from(move |e: FocusEvent| {
            e.prevent_default();
            let form = web_sys::FormData::new_with_form(
                &e.target().and_then(|t| t.dyn_into::<HtmlFormElement>().ok()).expect("msg")
            ).expect("create FormData failed");
            let code = form.get("code").as_string().expect("msg");
            if code.chars().count() >= 13 {
                let mut info = (*drug).clone();
                info.code = code.clone();
                drug.set(info);
                get_detail.run();
            }
        })
    };
    let purchase_handler = {
        let purchase_list = purchase_list.clone();
        Callback::from(move|purchase: PurchaseType|{
            let tar = (*purchase_list).clone()
                .into_iter()
                .filter(|da| da.code != purchase.code).collect::<Vec<PurchaseType>>();
            purchase_list.set(tar);
        })
    };
    {
        let get_drug_in_data = get_drug_in_data.clone();
        use_effect_once(move || {
            get_drug_in_data.run();
            || log::info!("Running clean-up of effect on unmount")
        });
    }
    {
        let drug_info = drug_info.clone();
        let get_drug_in_data = get_drug_in_data.clone();
        use_effect_with_deps(
            move |get_drug_in_data| {
                if let Some(drug_in_data) = &get_drug_in_data.data {
                    drug_info.set(
                        drug_in_data
                            .iter()
                            .map(move |drug_info| DrugInData {
                                per_id: drug_info.per_id.to_string(),
                                money: drug_info.money,
                                kind: drug_info.kind,
                                in_time: drug_info.in_time.to_string()
                            })
                            .collect(),
                    )
                }
                || ()
            },
            get_drug_in_data,
        )
    }
    let purchase_in = {
        let drug = drug_detail.clone();
        let purchase = purchase_list.clone();
        Callback::from(move|_e|{
            let mut purchase_l = (*purchase).clone();
            let drug = (*drug).clone();
            let tar = purchase_l.clone()
                            .into_iter()
                            .filter(|drug_d: &PurchaseType| drug_d.code == drug.code.clone()).collect::<Vec<PurchaseType>>();
            if tar.len() > 0 {
                let mut tar_out = purchase_l.clone()
                            .into_iter()
                            .filter(|drug_d: &PurchaseType| drug_d.code != drug.code.clone()).collect::<Vec<PurchaseType>>();
                let mut tar = tar[0].clone();
                tar.number = (tar.number.parse::<f32>().expect("msg") + 1.0).to_string();
                tar_out.push(tar.clone());
                purchase.set(tar_out);
            }else{
                purchase_l.push(drug);
                purchase.set(purchase_l);
            }
        })  
    };
    let input_name = {
        let drug = drug_detail.clone();
        Callback::from(move|e: InputEvent|{
            let input: HtmlInputElement = e.target_unchecked_into();
            let mut info = (*drug).clone();
            info.name = input.value();
            drug.set(info);
        })
    };
    let input_code = {
        let drug = drug_detail.clone();
        Callback::from(move|e: InputEvent|{
            let input: HtmlInputElement = e.target_unchecked_into();
            let mut info = (*drug).clone();
            info.code = input.value();
            drug.set(info);
        })
    };
    let input_number = {
        let drug = drug_detail.clone();
        Callback::from(move|e: InputEvent|{
            let input: HtmlInputElement = e.target_unchecked_into();
            let mut info = (*drug).clone();
            info.number = input.value();
            drug.set(info);
        })
    };
    let input_self = {
        let drug = drug_detail.clone();
        Callback::from(move|e: InputEvent|{
            let input: HtmlInputElement = e.target_unchecked_into();
            let mut info = (*drug).clone();
            info.self_money = input.value();
            drug.set(info);
        })
    };
    let input_sale = {
        let drug = drug_detail.clone();
        Callback::from(move|e: InputEvent|{
            let input: HtmlInputElement = e.target_unchecked_into();
            let mut info = (*drug).clone();
            info.sale_money = input.value();
            drug.set(info);
        })
    };
    let input_spec = {
          let drug = drug_detail.clone();
        Callback::from(move|e: InputEvent|{
            let input: HtmlInputElement = e.target_unchecked_into();
            let mut info = (*drug).clone();
            info.spec = input.value();
            drug.set(info);
        })
    };
    let input_address = {
        let drug = drug_detail.clone();
        Callback::from(move|e: InputEvent|{
            let input: HtmlInputElement = e.target_unchecked_into();
            let mut info = (*drug).clone();
            info.manu_address = input.value();
            drug.set(info);
        })
    };
    html! {
        <div class="drug-in-components">
            <nav class="navbar is-transparent">
                <div class="navbar-brand drug-in-components-nav-bar">
                    {"药品入库"}
                </div>
                <div id="navbarExampleTransparentExample" class="navbar-menu">
                    <div class="navbar-end">
                    <div class="navbar-item">
                        <div class="field is-grouped">
                            <button class="button is-link drug-in-out-button is-small" onclick={open_modal} >{"添加入库记录"}</button>
                        </div>
                    </div>
                    </div>
                </div>
            </nav>
            <div class="drug-in-components-content">
                <OwnTableComponent<DrugInData,DrugInColumn> data={(*drug_info).clone()} columns={columns} pagination={false} />
            </div>
            { if *visible {
                html!{
                    <OwnModalComponent
                        name={"添加入库记录".to_string()}
                        save={on_save.clone()}
                        cancel={on_cancel.clone()}
                    >
                        <div class="columns">
                            <div class="column drug-content-left">
                                {"入库药品清单"}
                                <OwnTableComponent<PurchaseType,PurchaseInColumn> data={(*purchase_list).clone()}
                                    columns={purchase_columns} pagination={false} handler={purchase_handler}
                                />
                            </div>
                            <div class="column is-half">
                                <form onsubmit={save_one_purchase}>
                                    <div class="field">
                                        <label class="label">{"编号"}</label>
                                        <input class="input" value={drug_detail.code.clone()} name={"code"} oninput={input_code} placeholder={"药品编号"} />
                                    </div>
                                    <button type="submit">{
                                        "触发提交"
                                    }</button>
                                </form>
                                <div class="field">
                                    <label class="label">{"名称"}</label>
                                    <input class="input" value={drug_detail.name.clone()}  oninput={input_name} placeholder={"药品名称"} />
                                </div>
                                <div class="field">
                                    <label class="label">{"厂家"}</label>
                                    <input class="input" value={drug_detail.manu_address.clone()}  oninput={input_address} placeholder={"生产厂家"} />
                                </div>
                                <div class="field">
                                    <label class="label">{"规格"}</label>
                                    <input class="input" value={drug_detail.spec.clone()} oninput={input_spec} placeholder={"药品规格"} />
                                </div>
                                <div class="field">
                                    <label class="label">{"数量"}</label>
                                    <input class="input" value={drug_detail.number.clone()} oninput={input_number} type="number" placeholder={"药品数量"} />
                                </div>
                                <div class="field">
                                    <label class="label">{"进价"}</label>
                                    <input class="input" value={drug_detail.self_money.clone()} oninput={input_self} type="number" placeholder={"药品进价"} />
                                </div>
                                <div class="field">
                                    <label class="label">{"售价"}</label>
                                    <input class="input" value={drug_detail.sale_money.clone()} oninput={input_sale} type="number" placeholder={"药品售价"} />
                                </div>
                                <div>
                                    <button class="button is-success" onclick={purchase_in}>{"药品入单"}</button>
                                </div>
                            </div>
                        </div>
                    </OwnModalComponent>
                }
            } else {
                html!{}
            }}
        </div>
    }
}