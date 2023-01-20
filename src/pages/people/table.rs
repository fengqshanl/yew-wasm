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
    let visible: UseStateHandle<bool> = use_state(bool::default);
    let drug_info = use_async(async move {
        request::<(), Vec<PeopleData>>(reqwest::Method::GET, "/drug".to_string(), (), false).await
    });

    let onclick = {
        let visible = visible.clone();
        Callback::from(move |_| visible.set(!*visible))
    };

    let on_cancel = {
        let visible = visible.clone();
        Callback::from(move |_| visible.set(!*visible))
    };

    let on_save = {
        let visible = visible.clone();
        Callback::from(move |_| visible.set(!*visible))
    };

    let oninput_name = {
        let add_info = add_info.clone();
        Callback::from(move |e: InputEvent| {
            let input: HtmlInputElement = e.target_unchecked_into();
            let mut info = (*add_info).clone();
            info.name = input.value();
            add_info.set(info);
        })
    };

    let oninput_usage_dosage = {
        let add_info = add_info.clone();
        Callback::from(move |e: InputEvent| {
            let input: HtmlInputElement = e.target_unchecked_into();
            let mut info = (*add_info).clone();
            info.usage_dosage = input.value();
            add_info.set(info);
        })
    };

    let oninput_matters_need_attention = {
        let add_info = add_info.clone();
        Callback::from(move |e: InputEvent| {
            let input: HtmlInputElement = e.target_unchecked_into();
            let mut info = (*add_info).clone();
            info.matters_need_attention = input.value();
            add_info.set(info);
        })
    };

    {
        let drug_info = drug_info.clone();
        // let update_info = update_info.clone();
        use_effect_once(move || {
            drug_info.run();
            // let mut arr:Vec<PeopleData> = vec![];
            // for index in 0..100 {
            //     arr.push(PeopleData{
            //        drug_id: "".to_string(),
            //        class_id: "".to_string(),
            //        name: "".to_string(),
            //        matters_need_attention: "".to_string(),
            //        a_b_classify: "".to_string(),
            //        usage_dosage: "".to_string(),
            //        drug_number: index 
            //     })
            // }
            // update_info.set(arr);
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
            <button class="button is-link drug-in-out-button" {onclick}>
                {"药品入库登记"}
            </button>
            <OwnTableComponent<PeopleData, PeopleColumn> data={(*update_info).clone()} columns={columns} pagination={true} />
            { if *visible {
                html!{
                    <OwnModalComponent
                        name={"药品名称".to_string()}
                        save={on_save.clone()}
                        cancel={on_cancel.clone()}
                    >
                        <div class="columns is-2">
                            <div class="column">
                                <input class="input" type="text" required={true} name="name" id="name" placeholder="药品名称"
                                    value={add_info.name.clone()}  oninput={oninput_name} />
                            </div>
                            <div class="column">
                                <div class="file is-primary">
                                    <label class="file-label">
                                        <span class="file-cta">
                                            <span class="file-icon">
                                                <i class="fas fa-upload" />
                                            </span>
                                            <span class="file-label">
                                                {"扫码入库"}
                                            </span>
                                        </span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="columns is-2">
                            <div class="column">
                                <input class="input" type="number"  name="usage_dosage" id="usage_dosage" placeholder="入库数量"
                                    value={add_info.usage_dosage.clone()}  oninput={oninput_usage_dosage}  />
                            </div>
                        </div>
                        <div class="columns is-2">
                            <div class="column">
                                <input class="input" type="text"  name="matters_need_attention" id="matters_need_attention" placeholder="入库价格"
                                    value={add_info.matters_need_attention.clone()}  oninput={oninput_matters_need_attention}  />
                            </div>
                        </div>
                    </OwnModalComponent>
                }
            } else {
                html!{}
            }}
        </div>
    };
}
