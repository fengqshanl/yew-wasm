use crate::components::message::message;
use crate::components::table::{OwnTableComponent};
use crate::ownhttp::myhttp::request;
use gloo::console::debug;
use yew::prelude::*;
use yew::{html};
use yew_hooks::{use_async, use_effect_once};

use super::model::{DrugColumn, DrugData};

#[function_component(Drug)]
pub fn drug() -> Html {
    let case_info: UseStateHandle<Vec<DrugData>> = use_state(Vec::default);
    let columns = vec![
        DrugColumn {
            title: "序号".to_string(),
            data_index: "index".to_string(),
        },
        DrugColumn {
            title: "药品名称".to_string(),
            data_index: "name".to_string(),
        },
        DrugColumn {
            title: "数量".to_string(),
            data_index: "number".to_string(),
        },
        DrugColumn {
            title: "金额".to_string(),
            data_index: "money".to_string(),
        },
    ];
    let drug_info = use_async(async move {
        request::<(), Vec<DrugData>>(reqwest::Method::GET, "/sale".to_string(), ()).await
    });
    {
        let drug_info = drug_info.clone();
        use_effect_once(move || {
            drug_info.run();

            || message("获取销售列表错误".to_string())
        });
    }
    {
        let case_info = case_info.clone();
        use_effect_once(move || {
            let case_arr = vec![DrugData {
                index: 1,
                name: "name".to_string(),
                number: "number".to_string(),
                money: "money".to_string(),
            }];
            case_info.set(case_arr);
            || debug!("Running clean-up of effect on unmount")
        });
    }
    html! {
        <div class="drug-components"> 
            <div class="drug-buttons">
                <button class="button is-link drug-in-out-button" >{"扫码识别"}</button>
                <button class="button is-link drug-in-out-button" >{"添加"}</button>
            </div>
            <OwnTableComponent<DrugData, DrugColumn> data={(*case_info).clone()} columns={columns} />
        </div>
    }
}
