use crate::ownhttp::myhttp::request;
use gloo::console::externs::log;
use serde::{Deserialize, Serialize};
use crate::components::modal::OwnModalComponent;
use yew::prelude::*;
use yew::{html, Component, Html, Properties};
use crate::components::table::OwnTableComponent;
use yew::Callback;
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
    let columns: Vec<String> = vec!["序号","药品名称","分类","用法用量","注意事项"].iter().map(|c| c.to_string()).collect();;
    let visible: UseStateHandle<bool> = use_state(bool::default);
    let drug_info = use_async(async move {
        log::info!("request in");
        request::<(), Vec<DrugInfo>>(reqwest::Method::GET, "/drug".to_string(), ()).await
    });

    let onclick = {
        let visible = visible.clone();
        Callback::from(move |_| {
            visible.set(!*visible)
        })
    };

    let on_cancel = {
        let visible = visible.clone();
        Callback::from(move |_| {
            visible.set(!*visible)
        })
    };

    let on_save = {
        let visible = visible.clone();
        Callback::from(move |_| {
            visible.set(!*visible)
        })
    };

    log::info!("table");

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
        use_effect_with_deps(move |drug_info| {
            if let Some(drug_info) = &drug_info.data {
                update_info.set(
                    drug_info
                        .iter()
                        .map(move |drug_info| DrugInfo {
                            drug_id: drug_info.drug_id.to_string(),
                            class_id: drug_info.class_id.to_string(),
                            name: drug_info.name.to_string(),
                            matters_need_attention: drug_info.matters_need_attention.to_string(),
                            a_b_classify: drug_info.a_b_classify.to_string(),
                            usage_dosage: drug_info.usage_dosage.to_string(),
                            drug_number: drug_info.drug_number,
                        })
                        .collect()
                )
            }
            || ()
        }, drug_info)
    }

    return html! {
        <div class="people-components">
        <button class="button is-link drug-in-out-button" {onclick}>{"药品入库登记"}</button>
        <OwnTableComponent data={update_info.clone()} columns={columns} />
        { if *visible {
            html!{
               <OwnModalComponent
                    name={"药品名称".to_string()}
                    save={on_save.clone()}
                    cancel={on_cancel.clone()}
                >
                    <div>{"children"}</div>
                </OwnModalComponent>
            }
        } else {
            html!{}
        }}
        </div>
        };
}