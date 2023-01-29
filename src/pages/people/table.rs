use crate::components::autofill::autofill::ForForm;
use crate::components::modal::OwnModalComponent;
use crate::components::table::{OwnTableComponent, ColumnTrait};
use crate::ownhttp::myhttp::request;
use serde::{Deserialize, Serialize};
use web_sys::HtmlInputElement;
use yew::prelude::*;
use yew::Callback;
use yew::{html, Properties};
use yew_hooks::{use_async, use_effect_once};
#[derive(Clone, Debug, Eq, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct PeopleData {
    pub drug_id: String,
    pub drug_number: i64,
    pub class_id: String,
    pub name: String,
    pub matters_need_attention: String,
    pub usage_dosage: String,
    pub a_b_classify: String,
}

impl ForForm for PeopleData {
    fn get_key(self: &PeopleData) -> &str{
        &self.drug_id
    }
    fn get_name(self: &PeopleData) -> &str{
        &self.name
    }
}

#[derive(Clone, PartialEq, Debug)]
pub struct PeopleColumn {
    title: String,
    data_index: String,
}

impl ColumnTrait<PeopleData> for PeopleColumn {
    fn render(&self, value: String, record: &PeopleData, index: usize, handler: Option<Callback<PeopleData>>) -> Html {
        match &value as &str {
            "index" => return html!{{index + 1}},
            "drug_name" => return html!{{&record.name}},
            "drug_kind" => return html!{{&record.a_b_classify}},
            "usage_dosage" => return html!{{&record.usage_dosage}}, 
            "matters_need_attention" => return html!{{&record.matters_need_attention}},
            "drug_price" => return html!{{"价格"}},
            "inventory" => return html!{{"库存"}},
            "shelf_life" => return html!{{"保质期"}},
            _ => html!{}
        }
    }
    fn title(&self) -> String{
        self.title.clone()
    }
    fn center(&self) -> String {
        "center".to_string()
    }
    fn data_index(&self) -> String {
        self.data_index.clone()
    }
}


#[function_component(DrugTable)]
pub fn drug_table() -> Html {
    let update_info: UseStateHandle<Vec<PeopleData>> = use_state(Vec::default);
    let add_info: UseStateHandle<PeopleData> = use_state(PeopleData::default);
    let columns = vec![
        PeopleColumn {
            title: "序号".to_string(),
            data_index: "index".to_string(),
        },
        PeopleColumn {
            title: "药品名称".to_string(),
            data_index: "drug_name".to_string(),
        },
        PeopleColumn {
            title: "分类".to_string(),
            data_index: "drug_kind".to_string(),
        },
        PeopleColumn {
            title: "用法用量".to_string(),
            data_index: "usage_dosage".to_string(),
        },
        PeopleColumn {
            title: "注意事项".to_string(),
            data_index: "matters_need_attention".to_string(),
        },
        PeopleColumn {
            title: "价格".to_string(),
            data_index: "drug_price".to_string(),
        },
        PeopleColumn {
            title: "库存".to_string(),
            data_index: "inventory".to_string(),
        },
        PeopleColumn {
            title: "保质期".to_string(),
            data_index: "shelf_life".to_string(),
        },
    ];
    let drug_info = use_async(async move {
        request::<(), Vec<PeopleData>>(reqwest::Method::GET, "/drug".to_string(), (), false).await
    });

    {
        let drug_info = drug_info.clone();
        use_effect_once(move || {
            drug_info.run();
            || log::info!("Running clean-up of effect on unmount")
        });
    }

    {
        let update_info = update_info.clone();
        let drug_info = drug_info.clone();
        use_effect_with_deps(
            move |drug_info| {
                if let Some(drug_info) = &drug_info.data {
                    update_info.set(
                        drug_info
                            .iter()
                            .map(move |drug_info| PeopleData {
                                drug_id: drug_info.drug_id.to_string(),
                                class_id: drug_info.class_id.to_string(),
                                name: drug_info.name.to_string(),
                                matters_need_attention: drug_info
                                    .matters_need_attention
                                    .to_string(),
                                a_b_classify: drug_info.a_b_classify.to_string(),
                                usage_dosage: drug_info.usage_dosage.to_string(),
                                drug_number: drug_info.drug_number,
                            })
                            .collect(),
                    )
                }
                || ()
            },
            drug_info,
        )
    }

    return html! {
        <div class="people-components">
            <OwnTableComponent<PeopleData, PeopleColumn> data={(*update_info).clone()} columns={columns} pagination={true} />
        </div>
    };
}
