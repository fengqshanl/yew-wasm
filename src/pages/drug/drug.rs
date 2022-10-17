use crate::components::table::{OwnTableComponent, ColumnTrait};
use gloo::console::debug;
use yew::prelude::*;
use yew::{html, Properties};
use yew_hooks::use_effect_once;

#[derive(Clone, Debug, PartialEq, Properties, Default)]
pub struct DrugData {
    pub index: usize,
    pub name: String,
    pub number: String,
    pub money: String
}

#[derive(Clone, PartialEq, Debug)]
pub struct DrugColumn {
    title: String,
    data_index: String
}

impl ColumnTrait<DrugData> for DrugColumn {
    fn render(&self, value: String, record: &DrugData, index: usize) -> Html {
        match &value as &str {
            "index" => return html!{{index}},
            "name" => return html!{{&record.name}},
            "kind" => return html!{{&record.number}},
            "out_time" => return html!{{&record.money}},
            _ => html!{}
        }
    }
    fn title(&self) -> String{
        self.title.clone()
    }
}

#[function_component(Drug)]
pub fn drug() -> Html {
    let case_info: UseStateHandle<Vec<DrugData>> = use_state(Vec::default);
    let columns = vec![
        DrugColumn {
            title: "序号".to_string(),
            data_index: "index".to_string(),
        },
        DrugColumn{
            title: "药品名称".to_string(),
            data_index: "name".to_string(),
        },
        DrugColumn{
            title: "数量".to_string(),
            data_index: "number".to_string(),
        },
        DrugColumn{
            title: "金额".to_string(),
            data_index: "money".to_string(),
        },
    ];
    {
        let case_info = case_info.clone();
        use_effect_once(move ||{
            let case_arr = vec![
                DrugData{
                    index: 1,
                    name: "name".to_string(),
                    number: "number".to_string(),
                    money: "money".to_string(),
                }
            ];
            case_info.set(case_arr);
        || debug!("Running clean-up of effect on unmount")
        });
    }
    html! {
        <div class="setting-components">
            <button class="button is-link drug-in-out-button" >{"扫码识别"}</button>
            <OwnTableComponent<DrugData, DrugColumn> data={(*case_info).clone()} columns={columns} />
        </div>
    }
}

