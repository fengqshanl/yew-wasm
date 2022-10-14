use std::fmt::{Debug, Display};

use yew::prelude::*;

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct TableProps<D: Properties + Clone + PartialEq + Debug> {
    #[prop_or_default]
    pub data: Vec<D>,
    pub columns: Vec<ColumnPropType>,
}

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct ColumnPropType {
    pub title: String,
    pub dataIndex: String
}

impl ColumnPropType {
  fn render<V: Display, R>(&self, value: V, record: R ) -> Html{
    html!{{value}}
  }
}

#[function_component(OwnTableComponent)]
pub fn table<D: Properties + Clone + PartialEq + Debug + Default>(props: &TableProps<D>) -> Html {
    let data_list: UseStateHandle<Vec<Html>> = use_state(Vec::default);
  
  {
        let data_list = data_list.clone();
        let data_info = props.data.clone();
        let columns = props.columns.clone();
        use_effect_with_deps(move |data| {
          for (index, row) in data.iter().enumerate() {
            columns.iter().map(|column|{
              let html = html!{
                <th>{column.render(column.dataIndex, index)}</th>
              };
              let data_li = *data_list.clone();
              data_li.push(html);
              data_list.set(data_li);
            });
          } || ()
        }, data_info)
    }
    html! {
            <div>
                <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                    <thead>
                        <tr>
                {
                    for props.columns.clone().iter().map(|c| {
                        html! {
                            <th class="table-header-col">{c.title}</th>
                        }
                })}
            </tr>
          </thead>
          <tbody>
                {
                    for *data_list.clone()
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
        }
}
