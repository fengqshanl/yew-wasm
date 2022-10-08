use crate::ownhttp::myhttp::request;
use gloo::console::externs::log;
use serde::{Deserialize, Serialize};
use serde::de::Unexpected::Bool;
use yew::prelude::*;
use yew::{html, Component, Context, Html, Properties};
use yew::Callback::Callback;
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
pub fn drug_table() -> HTML {
    let update_info: UseStateHandle<Vec<DrugInfo>> = use_state(Vec::default);
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
        Callback::from {move |_| {
            visible.set(!*visible)
        }}
    };

    let on_save = {
        let visible = visible.clone();
        Callback::from {move |_| {
            visible.set(!*visible)
        }}
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
            log::info!("out {:?}", drug_info.data);
            if let Some(drug_info) = &drug_info.data {
                log::info!("in");
                update_info.set(
                    drug_info
                        .iter()
                        .map(|drug_info| DrugInfo {
                            drug_id: drug_info.drug_id.to_string(),
                            class_id: drug_info.class_id.to_string(),
                            name: drug_info.name.to_string(),
                            matters_need_attention: drug_info.matters_need_attention.to_string(),
                            a_b_classify: drug_info.a_b_classify.to_string(),
                            usage_dosage: drug_info.usage_dosage.to_string(),
                            drug_number: drug_info.drug_number,
                        })
                        .collect()
                );
            }
            || ()
        }, drug_info)
    }

    html! {
        <>
        <button class="button is-link" {onclick}>{"药品入库登记"}</button>
     <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <tr>
          <th class="table-index">{"序号"}</th>
          <th class="table-drug-name">{"药品名称"}</th>
          <th class="table-drug-classify">{"分类"}</th>
          <th class="table-drug-usage-dosage">{"用法用量"}</th>
          <th class="table-matters-attention">{"注意事项"}</th>
        </tr>
      </thead>
      <tbody>
            {
                for update_info.clone().iter().map(|info|{
                log::info!("info: {:?}", info);
                        html!{
                            <tr>
                                <th>{"1"}</th>
                                <td>{&info.name}</td>
                                <td>{&info.a_b_classify}</td>
                                <td>{&info.usage_dosage}</td>
                                <td>{&info.drug_number}</td>
                                <td>{&info.matters_need_attention}</td>
                            </tr>
                        }
                    })
            }
      </tbody>
    </table>
        { if *visible {
            html!{<div class="modal is-active">
  <div class="modal-background"></div>
  <div class="modal-card">
    <header class="modal-card-head">
      <p class="modal-card-title">{"Modal title"}</p>
      <button class="delete" aria-label="close"></button>
    </header>
    <section class="modal-card-body">
      {"content"}
    </section>
    <footer class="modal-card-foot">
      <button class="button is-success"  onclick={on_save}>{"Save changes"}</button>
      <button class="button" onclick={on_cancel}>{"Cancel"}</button>
    </footer>
  </div>
</div>}} else {
            html!{}
        }}
        </>
        }
}