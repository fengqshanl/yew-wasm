use crate::ownhttp::myhttp::request;
use gloo::console::externs::log;
use serde::{ Deserialize, Serialize };
use yew::prelude::*;
use yew::{ html, Component, Context, Html, Properties };
use yew_hooks::{ use_async, use_effect_once };

#[derive(Clone, Debug, Eq, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct DrugInfo {
    pub drug_id: String,
    // pub drug_number: String,
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
    let drug_info = use_async(async move {
        log::info!("request in");
        request::<(), Vec<DrugInfo>>(reqwest::Method::GET, "/drug".to_string(), ()).await
    });

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
                            // drug_number: drug_info.drug_number.to_string(),
                            class_id: drug_info.class_id.to_string(),
                            name: drug_info.name.to_string(),
                            // adverse_reaction: drug_info.adverse_reaction.to_string(),
                            // character: drug_info.character.to_string(),
                            // approval_number: drug_info.approval_number.to_string(),
                            // expiry_date: drug_info.expiry_date,
                            // ingredient: drug_info.ingredient.to_string(),
                            // major_function: drug_info.major_function.to_string(),
                            // manufacturing_enterprise: drug_info.manufacturing_enterprise.to_string(),
                            matters_need_attention: drug_info.matters_need_attention.to_string(),
                            // produced_time: drug_info.produced_time.to_string(),
                            // specification: drug_info.specification.to_string(),
                            // store_up: drug_info.store_up.to_string(),
                            // taboo: drug_info.taboo.to_string(),
                            a_b_classify: drug_info.a_b_classify.to_string(),
                            usage_dosage: drug_info.usage_dosage.to_string(),
                        })
                        .collect()
                );
            }
            || ()
        }, drug_info);
    }

    html! {
     <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <tr>
          <th>{"序号"}</th>
          <th>{"药品名称"}</th>
          <th>{"分类"}</th>
          <th>{"用法用量"}</th>
            <th>{"注意事项"}</th>
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
                                <td>{&info.matters_need_attention}</td>
                            </tr>
                        }
                    })
            }
      </tbody>
    </table>
        }
}