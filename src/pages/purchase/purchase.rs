use crate::components::autofill::autofill::AutoFillOptions;
use crate::components::input::input::ComponentType;
use crate::components::table::{OwnTableComponent, ColumnTrait};
use crate::pages::people::table::PeopleData;
use serde::{Deserialize, Serialize};
use yew::prelude::*;
use yew::{html, Properties};
use crate::ownhttp::myhttp::request;
use yew_hooks::{use_async, use_effect_once};
use crate::components::{
    form::{form::{Form, FormTypes},formitem::FormItem},
    modal::OwnModalComponent,
    input::input::Input,
};

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct DrugInData {
    pub per_id: String,
    pub money: f32,
    pub kind: i32,
    pub in_time: String
}

#[derive(Clone, PartialEq, Debug, Deserialize)]
pub struct DrugInColumn {
    pub title: String,
    pub data_index: String
}

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct PurchaseType {
    pub name: String,
    pub money: f64,
    pub number: f64,
}

impl FormTypes for PurchaseType {
    fn try_set(&mut self, name: &str, value: wasm_bindgen::JsValue) -> Result<(), std::io::Error>{
         match name {
            "name" => self.name = value.as_string().expect("name types convert JsValue to String error"),
            "money" => self.money = value.as_string().expect("money convert error").parse::<f64>().unwrap(),
            "number" => self.number = value.as_string().expect("number convert error").parse::<f64>().unwrap(),
            _ => log::info!("匹配错误，无法找到对应元素")
        }
        Ok(()) 
    }
}

impl ColumnTrait<DrugInData> for DrugInColumn {
    fn render(&self, value: String, record: &DrugInData, index: usize) -> Html {
        match &value as &str {
            "index" => return html!{{index + 1}},
            "money" => return html!{{&record.money}},
            "kind" => return html!{{&record.kind}},
            "in_time" => return html!{{&record.in_time}},
            "detail" => return html!{<button class="button is-link is-outlined">{"采购详情"}</button>},
            _ => html!{}
        }
    }
    fn title(&self) -> String{
        self.title.clone()
    }
    fn data_index(&self) -> String {
        self.data_index.clone()
    }
}

#[function_component(Purchase)]
pub fn purchase() -> Html {
    let name_options: UseStateHandle<Vec<AutoFillOptions>> = use_state(Vec::default);
    let drug_info: UseStateHandle<Vec<DrugInData>> = use_state(Vec::default);
    let purchase_list: UseStateHandle<Vec<PurchaseType>> = use_state(Vec::default);
    let visible = use_state(|| false);
    let get_drug_in_data = use_async(async move {
        request::<(), Vec<DrugInData>>(reqwest::Method::GET, "/purchase".to_string(), ()).await
    });
    let get_drug_list = use_async(async move {
        request::<(), Vec<PeopleData>>(reqwest::Method::GET, "/drug".to_string(), ()).await
    });
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
    let on_save = {
        Callback::from(move |_|{
            log::info!("save");
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
        let tip_list = purchase_list.clone();
        Callback::from(move |sale: PurchaseType| {
            let mut tips = (*tip_list).clone();
            tips.push(sale);
            tip_list.set(tips.to_vec());
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
    
    {
        let get_drug_list = get_drug_list.clone();
        use_effect_once(move || {
            get_drug_list.run();
            || log::info!("Running clean-up of effect on unmount")
        });
    }

    {
        let name_options = name_options.clone();
        let get_drug_list = get_drug_list.clone();
        use_effect_with_deps(
            move |get_drug_list| {
                if let Some(drug_list) = &get_drug_list.data {
                    name_options.set(
                        drug_list
                            .iter()
                            .map(move |drug| AutoFillOptions {
                                label: drug.name.clone(),
                                options: Box::new(None)
                            })
                            .collect(),
                    )
                }
                || ()
            },
            get_drug_list,
        )
    }
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
                            <button class="button is-link drug-in-out-button" onclick={open_modal} >{"添加入库记录"}</button>
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
                                {
                                    for purchase_list.clone().iter().map(|c|{
                                        html!{
                                            <div class="drug-sale-list-item">
                                                <div class="drug-sale-list-item-name">
                                                    {c.name.clone()}
                                                </div>
                                                <div class="drug-sale-list-item-money">
                                                    {c.money.clone()}
                                                </div>
                                            </div>
                                        }
                                    })
                                }
                            </div>
                            <div class="column is-three-quarters">
                                <Form<PurchaseType> form={save_one_purchase}>
                                    <FormItem label={"名称"} name={"name"} require={true} message={"require name!"}>
                                        <Input component_type={&ComponentType::Autofill} auto_options={(*name_options).clone()} 
                                               placeholder={"药品名称".to_string()} />
                                    </FormItem>
                                    <FormItem label={"数量"} name={"kind"} require={true} message={"require number!"}>
                                        <Input component_type={&ComponentType::Input} placeholder="进货数量" />
                                    </FormItem>
                                    <FormItem label={"单价"} name={"money"} require={true} message={"require number!"}>
                                        <Input component_type={&ComponentType::Input} placeholder="药品单价" />
                                    </FormItem>
                                </Form<PurchaseType>>
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