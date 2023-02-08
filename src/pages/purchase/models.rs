use std::{time::SystemTime, fmt::Debug};
use chrono::prelude::*;
use sp_yew::uuid::Uuid;

use serde::{Deserialize, Serialize};
use yew::{Properties, Html, html, Callback};

use crate::components::{table::ColumnTrait, form::form::FormTypes};

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

#[derive(Clone, PartialEq, Debug, Deserialize)]
pub struct PurchaseInColumn {
    pub title: String,
    pub data_index: String,
}

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct PurchaseType {
    pub code: String,
    pub name: String,
    pub self_money: String,
    pub sale_money: String,
    pub manu_address: String,
    pub spec: String,
    pub number: String,
}

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct PurchaseTypeOrigin {
    pub code: String,
    pub name: String,
    pub self_money: f32,
    pub sale_money: f32,
    pub manu_address: String,
    pub spec: String,
    pub number: f32,
}

impl ColumnTrait<PurchaseType> for PurchaseInColumn {
    fn render(&self, value: String, record: &PurchaseType, index: usize, handler: Option<Callback<PurchaseType>>) -> Html {
        match &value as &str {
            "index" => return html!{{index + 1}},
            "name" => return html!{{&record.name}},
            "self_money" => return html!{{&record.self_money}},
            "sale_money" => return html!{{&record.sale_money}},
            "manu_address" => return html!{{&record.manu_address}},
            "spec" => return html!{{&record.spec}},
            "number" => return html!{{&record.number}},
            "detail" => {
                let delete = {
                    let record = record.clone();
                    Callback::from(move|_|{
                        match handler.clone() {
                            Some(handler) => {
                                handler.emit(record.clone());
                            },
                            _ => {}
                        };
                    })
                };  
                return html!{<button class="button is-danger is-light is-small" onclick={delete}>{"删除"}</button>}
            },
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

// impl FormTypes for PurchaseType {
//     fn try_set(&mut self, name: &str, value: wasm_bindgen::JsValue) -> Result<(), std::io::Error>{
//          match name {
//             "name" => self.name = value.as_string().expect("name types convert JsValue to String error"),
//             "sale_money" => self.sale_money = value.as_string().expect("money convert error").parse::<f32>().unwrap(),
//             "self_money" => self.self_money = value.as_string().expect("money convert error").parse::<f32>().unwrap(),
//             "number" => self.number = value.as_string().expect("number convert error").parse::<f32>().unwrap(),
//             _ => log::info!("匹配错误，无法找到对应元素")
//         }
//         Ok(()) 
//     }
// }

impl ColumnTrait<DrugInData> for DrugInColumn {
    fn render(&self, value: String, record: &DrugInData, index: usize, handler: Option<Callback<DrugInData>>) -> Html {
        match &value as &str {
            "index" => return html!{{index + 1}},
            "money" => return html!{{&record.money}},
            "kind" => return html!{{&record.kind}},
            "in_time" => return html!{{NaiveDateTime::parse_from_str(record.in_time.as_str(), "%Y-%m-%d %H:%M:%S%.f").expect("msg").format("%Y-%m-%d %H:%M:%S").to_string()}},
            "detail" => {
                let detail = {
                    let record = record.clone();
                    Callback::from(move|_|{
                        match handler.clone() {
                            Some(handler) => {
                                handler.emit(record.clone());
                            },
                            _ => {}
                        };
                    })
                };  
                return html!{<button class="button is-link is-outlined is-small" onclick={detail}>{"采购详情"}</button>}
            },
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