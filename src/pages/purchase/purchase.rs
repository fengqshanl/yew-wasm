use crate::components::table::{OwnTableComponent, ColumnTrait};
use serde::{Deserialize, Serialize};
use yew::prelude::*;
use yew::{html, Properties};
use crate::components::{
    form::{form::{Form, FormTypes},formitem::FormItem},
    modal::OwnModalComponent,
    input::input::Input,
};

#[derive(Clone, Debug, Eq, PartialEq, Properties, Default, Deserialize, Serialize, Copy)]
pub struct DrugInData {
    pub name: &'static str,
    pub kind: &'static str,
    pub out_time: &'static str
}
#[derive(Clone, PartialEq, Debug, Deserialize)]
pub struct DrugInColumn {
    pub title: String,
    pub data_index: String
}

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct Purchase {
    pub name: String,
    pub money: f64,
    pub number: f64,
}

impl FormTypes for Purchase {
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
            "name" => return html!{{&record.name}},
            "kind" => return html!{{&record.kind}},
            "out_time" => return html!{{&record.out_time}},
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

#[function_component(DrugIn)]
pub fn drug_in() -> Html {
    let drug_in_info: UseStateHandle<Vec<DrugInData>> = use_state(Vec::default);
    let drug_list: UseStateHandle<Vec<Purchase>> = use_state(Vec::default);
    let visible = use_state(|| false);
    let columns = vec![
        DrugInColumn {
            title: "序号".to_string(),
            data_index: "index".to_string(),
        },
        DrugInColumn {
            title: "药品名称".to_string(),
            data_index: "name".to_string(),
        },
        DrugInColumn {
            title: "药品分类".to_string(),
            data_index: "kind".to_string(),
        },
        DrugInColumn {
            title: "出库时间".to_string(),
            data_index: "out_time".to_string(),
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
        let tip_list = drug_list.clone();
        Callback::from(move |sale: Purchase| {
            let mut tips = (*tip_list).clone();
            tips.push(sale);
            tip_list.set(tips.to_vec());
        })
    };
    html! {    
        <div class="drug-in-components">
            <nav class="navbar is-transparent">
                <div class="navbar-brand">
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
            <OwnTableComponent<DrugInData,DrugInColumn> data={(*drug_in_info).clone()} columns={columns} pagination={false} />
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
                                    for drug_list.clone().iter().map(|c|{
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
                                <Form<Purchase> form={save_one_purchase}>
                                    <FormItem label={"名称"} name={"name"} require={true} message={"require name!"}>
                                        <Input name={"name".to_string()} placeholder={"药品名称".to_string()} />
                                    </FormItem>
                                    <FormItem label={"数量"} name={"kind"} require={true} message={"require number!"}>
                                        <input class="input" name={"number"} type="text" placeholder="进货数量" />
                                    </FormItem>
                                    <FormItem label={"单价"} name={"money"} require={true} message={"require number!"}>
                                        <input class="input" name={"number"} type="text" placeholder="药品单价" />
                                    </FormItem>
                                </Form<Purchase>>
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
