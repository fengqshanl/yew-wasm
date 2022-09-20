use gloo::console::externs::log;
use yew::{html, Component, Context, Html, Properties};
use yew::prelude::*;
use yew_hooks::{use_async, use_effect_once};
use serde::{Serialize, Deserialize};
use crate::ownhttp::myhttp::request;

#[derive(Clone, Debug, Eq, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct DrugInfo {
    pub drug_id: String,
    pub drug_number: i64,
    pub name: String,
    pub adverse_reaction: String,
    pub character: String,
    pub approval_number: String,
    pub expiry_date: String,
    pub ingredient: String,
    pub major_function: String,
    pub manufacturing_enterprise: String,
    pub matters_need_attention: String,
    pub produced_time: String,
    pub specification: String,
    pub store_up: String,
    pub taboo: String,
    pub usage_dosage: String,
}

#[function_component(DrugTable)]
pub fn drug_table() -> Html {
    let update_info :UseStateHandle<Vec<DrugInfo>> = use_state(Vec::default);
    let drug_info = use_async(async move {
        log::info!("request in");
        request::<(), Vec<DrugInfo>>(reqwest::Method::GET, "/drug".to_string(), ()).await
    });

    log::info!("table");

    {
        let drug_info = drug_info.clone();
        use_effect_once(move|| {
        drug_info.run();

        || log::info!("Running clean-up of effect on unmount")
    });
    };

    {
        let update_info = update_info.clone();
        let drug_info = drug_info.clone();
        use_effect_with_deps(move| drug_info | {
            log::info!("out");
                if let Some(drug_info) = &drug_info.data {
                    log::info!("in");
                    let drug: Vec<DrugInfo> = drug_info.iter().map(|drug_info|{
                        DrugInfo{
                        drug_id: drug_info.drug_id.to_string(),
                        drug_number: drug_info.drug_number,
                        name: drug_info.name.to_string(),
                        adverse_reaction: drug_info.adverse_reaction.to_string(),
                        character: drug_info.character.to_string(),
                        approval_number: drug_info.approval_number.to_string(),
                        expiry_date: drug_info.expiry_date.to_string(),
                        ingredient: drug_info.ingredient.to_string(),
                        major_function: drug_info.major_function.to_string(),
                        manufacturing_enterprise: drug_info.manufacturing_enterprise.to_string(),
                        matters_need_attention: drug_info.matters_need_attention.to_string(),
                        produced_time: drug_info.produced_time.to_string(),
                        specification: drug_info.specification.to_string(),
                        store_up: drug_info.store_up.to_string(),
                        taboo: drug_info.taboo.to_string(),
                        usage_dosage: drug_info.usage_dosage.to_string()
                    } }).collect();
                    log::info!("drug info: {:?}", drug);
                };
            || ()
            }, drug_info);
    };

    html! {
 <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
  <thead>
    <tr>
      <th>{"序号"}</th>
      <th>{"药品名称"}</th>
      <th>{"商标"}</th>
      <th>{"规格"}</th>
      <th>{"关键字"}</th>
      <th>{"上市时间"}</th>
      <th>{"地址"}</th>
      <th>{"公司名称"}</th>
      <th>{"企业名称"}</th>
      <th>{"物品编码"}</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>{"1"}</th>
      <td>{"Leicester City"}<strong>{"(C)"}</strong>
      </td>
      <td>{"38"}</td>
      <td>{"23"}</td>
      <td>{"12"}</td>
      <td>{"3"}</td>
      <td>{"68"}</td>
      <td>{"36"}</td>
      <td>{"+32"}</td>
      <td>{"81"}</td>
    </tr>
  </tbody>
</table>
    }
}