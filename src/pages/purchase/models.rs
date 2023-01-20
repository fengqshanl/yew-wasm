use serde::{Deserialize, Serialize};
use yew::{Properties, Html, html};

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
    pub data_index: String
}

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct PurchaseType {
    pub name: String,
    pub self_money: f64,
    pub sale_money: f64,
    pub number: f64,
}

impl ColumnTrait<PurchaseType> for PurchaseInColumn {
    fn render(&self, value: String, record: &PurchaseType, index: usize) -> Html {
        match &value as &str {
            "index" => return html!{{index + 1}},
            "name" => return html!{{&record.name}},
            "self_money" => return html!{{&record.self_money}},
            "sale_money" => return html!{{&record.sale_money}},
            "number" => return html!{{&record.number}},
            "detail" => return html!{<button class="button is-link is-outlined">{"详情"}</button>},
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

impl FormTypes for PurchaseType {
    fn try_set(&mut self, name: &str, value: wasm_bindgen::JsValue) -> Result<(), std::io::Error>{
        log::info!("value: {:?}", value);
         match name {
            "name" => self.name = value.as_string().expect("name types convert JsValue to String error"),
            "sale_money" => self.sale_money = value.as_string().expect("money convert error").parse::<f64>().unwrap(),
            "self_money" => self.self_money = value.as_string().expect("money convert error").parse::<f64>().unwrap(),
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