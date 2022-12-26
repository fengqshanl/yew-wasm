use std::fmt::{Debug};
use stylist::yew::styled_component;
use yew::prelude::*;

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct TableProps<
    D: Properties + Clone + PartialEq + Debug, 
    C: Clone + PartialEq + Debug + ColumnTrait<D>
> {
    #[prop_or_default]
    pub data: Vec<D>,
    pub columns: Vec<C>,
    pub pagination: bool,
}
pub trait ColumnTrait<R> {
    fn render(&self, value: String, record: &R, index: usize) -> Html;
    fn title(&self) -> String;
    fn center(&self) -> String {
        "center".to_string()
    }
    fn data_index(&self) -> String;
}

#[styled_component(OwnTableComponent)]
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
                let mut data_li = (*data_list).clone();
                for (index, row) in data_info.clone().iter().enumerate() {
                        let html = html! {
                            <tr>
                                {
                                    for columns.clone().iter().map(|col|{
                                        let mut style = css!("text-align: left;");
                                        if col.center() == "center".to_string() {
                                            style = css!("text-align: center;");
                                        }
                                        html!{
                                            <th class={style}>
                                                {col.clone().render(col.clone().data_index(), row, index)}
                                            </th>
                                        }
                                    })
                                }
                            </tr>
                          };
                          data_li.push(html);
                };
                data_list.set(data_li);
                || log::info!("table component render error!")
            },
            data_info,
        );
    }
    html! {
        <div>
            <table class="table is-hoverable is-fullwidth">
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
            { if props.pagination.clone() {
                html!{
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
                }
            } else {
                html!{ }
            } }
        </div>
      }
}
