use crate::components::message::message;
use crate::components::table::{ColumnTrait, OwnTableComponent};
use crate::ownhttp::myhttp::request;
use gloo::console::debug;
use serde::{Deserialize, Serialize};
use yew::prelude::*;
use yew::{html, Properties};
use yew_hooks::{use_async, use_effect_once};

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct DrugData {
    pub index: usize,
    pub name: String,
    pub number: String,
    pub money: String,
}

#[derive(Clone, PartialEq, Debug)]
pub struct DrugColumn {
    title: String,
    data_index: String,
}

impl ColumnTrait<DrugData> for DrugColumn {
    fn render(&self, value: String, record: &DrugData, index: usize) -> Html {
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
    }
    fn title(&self) -> String {
        self.title.clone()
    }
    fn data_index(&self) -> String {
        self.data_index.clone()
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
        <div class="setting-components">
            <button class="button is-link drug-in-out-button" >{"扫码识别"}</button>
            <OwnTableComponent<DrugData, DrugColumn> data={(*case_info).clone()} columns={columns} />
        </div>
    }
}
