use web_sys::MouseEvent;
use yew::prelude::*;
use yew_router::prelude::*;
use yew::{Html, Callback};
use crate::pages::people::table::DrugInfo;

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct TableProps {
    pub data: UseStateHandle<Vec<DrugInfo>>,
    pub columns: Vec<String>,
}

#[function_component(OwnTableComponent)]
pub fn table(props: &TableProps) -> Html {
    return html! {
       <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <tr>
            {
                for props.columns.clone().iter().map(|c| {
                    html! {
                        <th class="table-header-col">{c}</th>
                    }
            })}
        </tr>
      </thead>
      <tbody>
            {
                for props.data.clone().iter().map(|info|{
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
    };
}