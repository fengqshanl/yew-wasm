use yew::prelude::*;

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct TableProps<T> {
    pub data: UseStateHandle<Vec<T>>,
    pub columns: Vec<String>,
}

#[function_component(OwnTableComponent)]
pub fn table<T>(props: &TableProps<T>) -> Html {
    return html! {
            <div>
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
            // <nav class="pagination" role="navigation" aria-label="pagination">
      <ul class="pagination-list">
        <li>
          <a class="pagination-link" aria-label="Goto page 1">{"1"}</a>
        </li>
        <li>
          <span class="pagination-ellipsis">{"······"}</span>
        </li>
        <li>
          <a class="pagination-link" aria-label="Goto page 45">{"45"}</a>
        </li>
        <li>
          <a class="pagination-link is-current" aria-label="Page 46" aria-current="page">{"46"}</a>
        </li>
        <li>
          <a class="pagination-link" aria-label="Goto page 47">{"47"}</a>
        </li>
        <li>
          <span class="pagination-ellipsis">{"······"}</span>
        </li>
        <li>
          <a class="pagination-link" aria-label="Goto page 86">{"86"}</a>
        </li>
      </ul>
    // </nav>
            </div>
        };
}
