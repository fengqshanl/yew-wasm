use yew::{html, Component, Context, Html, Properties};
use yew::prelude::*;
use yew_hooks::{use_async, use_effect_once};
use crate::ownhttp::myhttp::request;

#[derive(Clone, Debug, Eq, PartialEq, Properties, Default)]
pub struct DrugInfo {
  pub title: String,
    pub description: String,
    pub body: String,
    pub tag_list: Option<Vec<String>>,
}

#[function_component(DrugTable)]
pub fn drug_table() -> Html {
    let update_info = use_state(DrugInfo::default);
    let drug_info = use_async(async move {
        log::info!("request in");
        request::<(), ()>(reqwest::Method::GET, "/".to_string(), ()).await
    });

    log::info!("table");

    {
        let drug_info = drug_info.clone();
        use_effect_once(move|| {
        drug_info.run();

        || log::info!("Running clean-up of effect on unmount")
    });
    }



    {
        let drug_info = drug_info.clone();
        use_effect_with_deps(move| drug_info | {
                if let Some(drug_info) = &drug_info.data {
                    println!("{:?}", drug_info);
                }
                || ()
            },
            drug_info
        );
    }


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