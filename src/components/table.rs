use std::fmt::{Debug};

use yew::prelude::*;

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct TableProps<
    D: Properties + Clone + PartialEq + Debug, 
    C: Clone + PartialEq + Debug + ColumnTrait<D>
> {
    #[prop_or_default]
    pub data: Vec<D>,
    pub columns: Vec<C>,
}
pub trait ColumnTrait<R> {
    fn render(&self, value: String, record: &R, index: usize) -> Html;
    fn title(&self) -> String;
    fn data_index(&self) -> String;
}

#[function_component(OwnTableComponent)]
pub fn table<D,C>(props: &TableProps<D,C>) -> Html
where
    D: Properties + Clone + PartialEq + Debug + Default + 'static,
    C: Clone + PartialEq + Debug + ColumnTrait<D> + 'static
{
    let data_list: UseStateHandle<Vec<Html>> = use_state(Vec::default);

    {
        let data_list = data_list.clone();
        let data_info = props.data.clone();
        let columns = props.columns.clone();
        use_effect_with_deps(
            move |data_info| {
                for (index, row) in data_info.clone().iter().enumerate() {
                        let html = html! {
                            <tr>
                                {
                                    for columns.clone().iter().map(|col|{
                                        html!{<th>{col.clone().render(col.clone().data_index(), row, index)}</th>}
                                    })
                                }
                            </tr>
                          };
                          let mut data_li = (*data_list).clone();
                          data_li.push(html);
                          data_list.set(data_li);
                }
                || ()
            },
            data_info,
        );
    }
    html! {
        <div>
            <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                <thead>
                    <tr>
                        {
                            for props.columns.clone().iter().map(|c|{
                                html! {
                                    <th class="table-header-col">{c.clone().title()}</th>
                                }
                            })
                        }
                    </tr>
                </thead>
                <tbody>
                    {
                        for (*data_list).clone()
                    }
                </tbody>
            </table>
            <nav class="pagination is-centered" role="navigation" aria-label="pagination">
                <a class="pagination-previous">{"上一页"}</a>
                <a class="pagination-next">{"下一页"}</a>
                <ul class="pagination-list">
                    <li><a class="pagination-link" aria-label="Goto page 1">{"1"}</a></li>
                    <li><span class="pagination-ellipsis">{"……"}</span></li>
                    <li><a class="pagination-link" aria-label="Goto page 45">{"45"}</a></li>
                    <li><a class="pagination-link is-current" aria-label="Page 46" aria-current="page">{"46"}</a></li>
                    <li><a class="pagination-link" aria-label="Goto page 47">{"47"}</a></li>
                    <li><span class="pagination-ellipsis">{"……"}</span></li>
                    <li><a class="pagination-link" aria-label="Goto page 86">{"86"}</a></li>
                </ul>
            </nav>
        </div>
      }
}
