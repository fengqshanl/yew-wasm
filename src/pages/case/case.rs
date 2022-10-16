use crate::components::table::{ColumnPropType, OwnTableComponent};
use serde::{Deserialize, Serialize};
use yew::prelude::*;
use yew::{html, Properties};

#[derive(Clone, Debug, Eq, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct CaseInfo {}

#[function_component(Case)]
pub fn case() -> Html {
    let case_info: UseStateHandle<Vec<CaseInfo>> = use_state(Vec::default);
    let columns = vec![
        ColumnPropType {
            title: "序号".to_string(),
            data_index: "index".to_string(),
        },
        ColumnPropType {
            title: "药品名称".to_string(),
            data_index: "name".to_string(),
        },
        ColumnPropType {
            title: "药品分类".to_string(),
            data_index: "kind".to_string(),
        },
        ColumnPropType {
            title: "出库时间".to_string(),
            data_index: "out_time".to_string(),
        },
    ];
    html! {
        <div class="case-components">
            <button class="button is-link drug-in-out-button" >{"扫码识别"}</button>
            <OwnTableComponent<CaseInfo> data={(*case_info).clone()} columns={columns} />
        </div>
    }
}
