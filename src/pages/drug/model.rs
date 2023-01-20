use crate::components::table::{ColumnTrait};
use serde::{Deserialize, Serialize};
use yew::prelude::*;
use yew::{html, Properties};

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct DrugData {
    pub index: usize,
    pub name: String,
    pub number: String,
    pub money: String,
}

#[derive(Clone, PartialEq, Debug)]
pub struct DrugColumn {
    pub title: String,
    pub data_index: String,
}

impl ColumnTrait<DrugData> for DrugColumn {
    fn render(&self, value: String, record: &DrugData, index: usize, handler: Option<Callback<DrugData>>) -> Html {
        if index == 0 {
            match &value as &str {
                "index" => return html! {{index + 1}},
                "name" => {
                    return html! {<input class="input" type="text" name="name" id="name" placeholder="药品名称" />}
                }
                "number" => {
                    return html! {<input class="input" type="text" name="number" id="number" placeholder="药品数量" />}
                }
                "money" => {
                    return html! {<input class="input" type="text" name="money" id="money" placeholder="金额" />}
                }
                _ => html! {},
            }
        } else {
            match &value as &str {
                "index" => return html! {{index + 1}},
                "name" => {
                    return html! {{record.name.clone()}}
                }
                "number" => {
                    return html! {{record.number.clone()}}
                }
                "money" => {
                    return html! {{record.money.clone()}}
                }
                _ => html! {},
            }
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