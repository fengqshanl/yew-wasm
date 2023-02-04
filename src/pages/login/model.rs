use serde::{Deserialize, Serialize};
use yew::prelude::*;
use sp_yew::uuid::Uuid;
use yew::{html, Properties};
use chrono::prelude::*;
use crate::pages::purchase::models::DrugInData;
use crate::components::{table::ColumnTrait, form::form::FormTypes};

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct DrugData {
    pub index: usize,
    pub name: String,
    pub number: String,
    pub money: String,
}

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct Sale {
    pub sale_id: String,
    pub drug_id: String,
    pub drug_name: String,
    pub sale_number: f64,
    pub money: f64,
    pub total: f64,
    pub sale_time: String,
}

impl FormTypes for Sale {
    fn try_set(&mut self, name: &str, value: wasm_bindgen::JsValue) -> Result<(), std::io::Error>{
        match name {
            "sale_id" => self.sale_id = value.as_string().expect("name types convert JsValue to String error"),
            "drug_id" => self.drug_id = value.as_string().expect("money convert error"),
            "drug_name" => self.drug_name = value.as_string().expect("number convert error"),
            "sale_number" => self.sale_number = value.as_string().expect("money convert error").parse::<f64>().unwrap(),
            "money" => self.money = value.as_string().expect("money convert error").parse::<f64>().unwrap(),
            "total" => self.total = value.as_string().expect("money convert error").parse::<f64>().unwrap(),
            "sale_time" => self.sale_time = value.as_string().expect("sale convert error"),
            _ => log::info!("匹配错误，无法找到对应元素")
        }
        Ok(()) 
    }
}

#[derive(Clone, PartialEq, Debug)]
pub struct DrugColumn {
    pub title: String,
    pub data_index: String,
}

impl ColumnTrait<Sale> for DrugColumn {
    fn render(&self, value: String, record: &Sale, index: usize, handler: Option<Callback<Sale>>) -> Html {
            match &value as &str {
                "index" => return html! {{index + 1}},
                "name" => return html! {{&record.drug_name}},
                "number" => return html! {{&record.sale_number}},
                "money" => return html! {{&record.money}},
                "total" => return html!{{&record.total}},
                "time" => return html!{{NaiveDateTime::parse_from_str(record.sale_time.as_str(), "%Y-%m-%d %H:%M:%S%.f").expect("msg").format("%Y-%m-%d %H:%M:%S").to_string()}},
                _ => html! {},
            }
    }
    fn title(&self) -> String {
        self.title.clone()
    }
    fn center(&self) -> String {
        "center".to_string()
    }
    fn data_index(&self) -> String {
        self.data_index.clone()
    }
}

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct Tip {
    pub id: Uuid,
    pub drug_id: String,
    pub name: String,
    pub money: f64,
    pub number: f64,
    pub sale: f64,
}

impl FormTypes for Tip {
    fn try_set(&mut self, name: &str, value: wasm_bindgen::JsValue) -> Result<(), std::io::Error>{
        match name {
            "name" => self.name = value.as_string().expect("name types convert JsValue to String error"),
            "money" => self.money = value.as_string().expect("money convert error").parse::<f64>().unwrap(),
            "number" => self.number = value.as_string().expect("number convert error").parse::<f64>().unwrap(),
            "sale" => self.sale = value.as_string().expect("sale convert error").parse::<f64>().unwrap(),
            _ => log::info!("匹配错误，无法找到对应元素")
        }
        Ok(()) 
    }
}

#[derive(Clone, PartialEq, Debug)]
pub struct TipColumn {
    pub title: String,
    pub data_index: String,
}

impl ColumnTrait<Tip> for TipColumn {
    fn render(&self, value: String, record: &Tip, index: usize, handler: Option<Callback<Tip>>) -> Html {
        match &value as &str {
            "index" => return html! {{index + 1}},
            "name" => return html! {{&record.name}},
            "number" => return html! {{&record.number}},
            "money" => return html! {{&record.money}},
            "sale" => return html!{{&record.sale}},
            "detail" => return {
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
                html!{<button class="button is-danger is-light is-small" onclick={delete}>{"删除"}</button>}},
            _ => html! {},
        }
    }
    fn title(&self) -> String {
        self.title.clone()
    }
    fn center(&self) -> String {
        "center".to_string()
    }
    fn data_index(&self) -> String {
        self.data_index.clone()
    }
}