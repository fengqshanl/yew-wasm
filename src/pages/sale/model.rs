use serde::{Deserialize, Serialize};
use yew::{Properties, html, Callback, Html};

use crate::components::table::ColumnTrait;

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct DrugDetail {
    pub drug_id: String,
    pub name: String,
    pub sale_money: f64,
    pub spec: String,
    pub manu_name: String,
    pub code: String,
    pub number: i64,
}

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct DrugDetailColumn {
    pub title: String,
    pub data_index: String,
}

impl ColumnTrait<DrugDetail> for DrugDetailColumn {
    fn render(&self, value: String, record: &DrugDetail, index: usize, handler: Option<Callback<DrugDetail>>) -> Html {
            match &value as &str {
                "index" => return html! {{index + 1}},
                "name" => return html! {{&record.name}},
                "spec" => return html! {{&record.spec}},
                "manu_name" => return html! {{&record.manu_name}},
                "number" => return html!{{&record.number}},
                "sale_money" => return html!{{&record.sale_money}},
                "total" => return html!{{&(record.sale_money * record.number as f64)}},
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
                    html!{<button class="button is-danger is-light is-small" onclick={delete}>{"删除"}</button>}
                },
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

#[derive(Debug, Deserialize, Clone, Serialize, Default, PartialEq)]
pub struct DrugOrigin {
    pub purchase: String,
    pub drug_id: String,
    pub code: String, // 条形码
    pub name: String, // 商品名称
    pub sale_money: f64,
    pub manu_address: String,
    pub spec: String, // 规格
}

// {
//     "purchase": "b56bcda4-0466-4403-875e-f92e468ba2bb",
//     "code": "6915010140629",
//     "sale_money": 13,
//     "name": "特非那定片（敏迪）",
//     "manu_address": "江苏联环药业股份有限公司",
//     "spec": "60mg×12片/盒"
// }


#[derive(Debug, Deserialize, Clone, Serialize, Default, PartialEq)]
pub struct SaleOrigin {
    pub drug_id: String, // 药品 id
    pub code: String, // 条形码
    pub name: String, // 商品名称
    pub sale_money: f64, // 售价
    pub spec: String, // 规格
    pub manu_address: String, // 厂家
    pub number: i64, // 售出的数量
    pub total: f64, // 总价
}

#[derive(Debug, Deserialize, Clone, Serialize, Default, PartialEq)]
pub struct SaleAdd{
    pub drug_id: String, // 药品 id
    pub code: String, // 条形码
    pub name: String, // 商品名称
    pub sale_money: f64, // 售价
    pub spec: String, // 规格
    pub manu_name: String, // 厂家
    pub number: i64, // 售出的数量
    pub total: f64, // 总价
}