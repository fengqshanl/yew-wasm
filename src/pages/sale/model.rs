use serde::{Deserialize, Serialize};
use yew::{Properties, html, Callback, Html};

use crate::components::table::ColumnTrait;

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct DrugDetail {
    pub name: String,
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
    pub code: String, // 条形码
    pub sptm_img: String, // 条码图片
    pub img: String, // 图片
    pub goods_type: String, // 商品分类
    pub trademark: String, // 品牌 
    pub goods_name: String, // 商品名称
    pub spec: String, // 规格
    pub note: String, // 备注信息
    pub price: String, // 参考价格(单位:元)
    pub ycg: String, // 原产地(可能无此参数信息)
    pub manu_name: String, // 厂商
    pub manu_address: String, //  厂商地址
    pub qs: String,//生产许可证号
    pub nw: String,//净重
    pub description: String,//形态描述
    pub gw: String,//毛重
    pub width: String,//宽
    pub height: String,//高
    pub depth: String,//深
    pub gpc: String,//gpc分类代码
    pub gpc_type: String,//gpc分类名称    
    pub keyword: String,//关键词
    pub img_list: String // 条码中心图片列表
}