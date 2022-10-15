use crate::components::modal::OwnModalComponent;
use crate::components::table::{ColumnPropType, OwnTableComponent};
use crate::ownhttp::myhttp::request;
use serde::{Deserialize, Serialize};
use web_sys::HtmlInputElement;
use yew::prelude::*;
use yew::Callback;
use yew::{html, Properties};
use yew_hooks::{use_async, use_effect_once};

#[derive(Clone, Debug, Eq, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct DrugInfo {
    pub drug_id: String,
    pub drug_number: i64,
    pub class_id: String,
    pub name: String,
    // pub adverse_reaction: String,
    // pub character: String,
    // pub approval_number: String,
    // pub expiry_date: i64,
    // pub ingredient: String,
    // pub major_function: String,
    // pub manufacturing_enterprise: String,
    pub matters_need_attention: String,
    // pub produced_time: String,
    // pub specification: String,
    // pub store_up: String,
    // pub taboo: String,
    pub usage_dosage: String,
    pub a_b_classify: String,
}

#[function_component(DrugTable)]
pub fn drug_table() -> Html {
    let update_info: UseStateHandle<Vec<DrugInfo>> = use_state(Vec::default);
    let add_info: UseStateHandle<DrugInfo> = use_state(DrugInfo::default);
    let columns: Vec<ColumnPropType> = vec![
        ColumnPropType {
            title: "序号".to_string(),
            data_index: "index".to_string(),
        },
        ColumnPropType {
            title: "药品名称".to_string(),
            data_index: "drug_name".to_string(),
        },
        ColumnPropType {
            title: "分类".to_string(),
            data_index: "drug_kind".to_string(),
        },
        ColumnPropType {
            title: "用法用量".to_string(),
            data_index: "usage_dosage".to_string(),
        },
        ColumnPropType {
            title: "注意事项".to_string(),
            data_index: "matters_need_attention".to_string(),
        },
        ColumnPropType {
            title: "价格".to_string(),
            data_index: "drug_price".to_string(),
        },
        ColumnPropType {
            title: "库存".to_string(),
            data_index: "inventory".to_string(),
        },
        ColumnPropType {
            title: "保质期".to_string(),
            data_index: "shelf_life".to_string(),
        },
    ];
    let visible: UseStateHandle<bool> = use_state(bool::default);
    let drug_info = use_async(async move {
        log::info!("request in");
        request::<(), Vec<DrugInfo>>(reqwest::Method::GET, "/drug".to_string(), ()).await
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
                            .map(move |drug_info| DrugInfo {
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
    <button class="button is-link drug-in-out-button" {onclick}>{"药品入库登记"}</button>
    <OwnTableComponent<DrugInfo> data={(*update_info).clone()} columns={columns} />
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
                      <input class="file-input" type="file" name="resume" />
                      <span class="file-cta">
                        <span class="file-icon">
                          <i class="fas fa-upload" />
                        </span>
                        <span class="file-label">
                          {"请选择图片"}
                        </span>
                      </span>
                    </label>
                  </div>
                    </div>
                </div>
            <div class="columns is-2">
                    <div class="column">
                        <input class="input" type="text"  name="usage_dosage" id="usage_dosage" placeholder="用法用量"
                        value={add_info.usage_dosage.clone()}  oninput={oninput_usage_dosage}  />
                    </div>
                </div>
                <div class="columns is-2">
                    <div class="column">
                        <input class="input" type="text"  name="matters_need_attention" id="matters_need_attention" placeholder="注意事项"
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
