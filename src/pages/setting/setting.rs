use crate::components::table::{OwnTableComponent, ColumnTrait};
use serde::{Deserialize, Serialize};
use yew::prelude::*;
use yew::{html, Properties};

#[derive(Clone, Debug, Eq, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct SetData {}

#[derive(Clone, PartialEq, Debug)]
pub struct SetColumn {
    title: String,
    data_index: String
}

impl ColumnTrait<SetData> for SetColumn {
    fn render(&self, value: String, _record: &SetData, index: usize) -> Html {
        match &value as &str {
            "index" => return html!{{index}},
            "name" => return html!{{"药品名称"}},
            "kind" => return html!{{"操作"}},
            "number" => return html!{{"药品数量"}}, 
            "money" => return html!{{"价格"}},
            "out_time" => return html!{{"出入库时间"}},
            _ => html!{}
        }
    }
    fn title(&self) -> String{
        self.title.clone()
    }
}

#[function_component(Setting)]
pub fn setting() -> Html {
    let case_info: UseStateHandle<Vec<SetData>> = use_state(Vec::default);
    let columns = vec![
        SetColumn {
            title: "序号".to_string(),
            data_index: "index".to_string(),
        },
        SetColumn {
            title: "药品名称".to_string(),
            data_index: "name".to_string(),
        },
        SetColumn {
            title: "操作".to_string(),
            data_index: "kind".to_string(),
        },
        SetColumn {
            title: "数量".to_string(),
            data_index: "number".to_string(),
        },
        SetColumn {
            title: "金额".to_string(),
            data_index: "money".to_string(),
        },
        SetColumn {
            title: "出（入）库时间".to_string(),
            data_index: "out_time".to_string(),
        },
    ];
    html! {
        <div class="setting-components">
            <div class="select">
                <select>
                    <option>
                        {"全部"}
                    </option>
                    <option>
                        {"出账"}
                    </option>
                    <option>
                        {"入账"}
                    </option>
                </select>
            </div>
            <button class="button is-link drug-in-out-button" >{"扫码识别"}</button>
            <OwnTableComponent<SetData, SetColumn> data={(*case_info).clone()} columns={columns} />
        </div>
    }
}
