use crate::components::table::{OwnTableComponent, ColumnTrait};
use serde::{Deserialize, Serialize};
use yew::prelude::*;
use yew::{html, Properties};

#[derive(Clone, Debug, Eq, PartialEq, Properties, Default, Deserialize, Serialize, Copy)]
pub struct CaseData {
    name: &'static str,
    kind: &'static str,
    out_time: &'static str
}
#[derive(Clone, PartialEq, Debug)]
pub struct CaseColumn {
    title: String,
    data_index: String
}

impl ColumnTrait<CaseData> for CaseColumn {
    fn render(&self, value: String, record: &CaseData, index: usize) -> Html {
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

#[function_component(Case)]
pub fn case() -> Html {
    let case_info: UseStateHandle<Vec<CaseData>> = use_state(Vec::default);
    let columns = vec![
        CaseColumn {
            title: "序号".to_string(),
            data_index: "index".to_string(),
        },
        CaseColumn {
            title: "药品名称".to_string(),
            data_index: "name".to_string(),
        },
        CaseColumn {
            title: "药品分类".to_string(),
            data_index: "kind".to_string(),
        },
        CaseColumn {
            title: "出库时间".to_string(),
            data_index: "out_time".to_string(),
        },
    ];
    html! {
        <div class="case-components">
            <button class="button is-link drug-in-out-button" >{"扫码识别"}</button>
            <OwnTableComponent<CaseData,CaseColumn> data={(*case_info).clone()} columns={columns} pagination={false} />
        </div>
    }
}
