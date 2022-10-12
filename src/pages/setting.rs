use yew::prelude::*;
use serde::{Deserialize, Serialize};

#[derive(Clone, Debug, Eq, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct RunningWater {
    pub drug_id: String,
    pub drug_number: i64,
    pub class_id: String,
    pub name: String,
    pub matters_need_attention: String,
    pub usage_dosage: String,
    pub a_b_classify: String,
}

#[function_component(Setting)]
pub fn setting() -> Html {
    // let water_info: UseStateHandle<Vec<RunningWater>> = use_state(Vec::default);
    let columns = vec!["序号","出入库药品","出入库时间","价格"].iter().map(|value|value.to_string()).collect();
    return html! {
            <div>
                // <OwnTableComponent data={water_info.clone()} columns={columns} />
            </div>
        };
}
