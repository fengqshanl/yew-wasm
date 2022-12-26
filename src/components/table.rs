use std::{fmt::{Debug}, cell::RefCell, rc::Rc};
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
    pub pagination: &'static bool,
}
pub trait ColumnTrait<R> {
    fn render(&self, value: String, record: &R, index: usize) -> Html;
    fn title(&self) -> String;
    fn center(&self) -> String {
        "center".to_string()
    }
    fn data_index(&self) -> String;
}

#[derive(Default)]
// pagination configure struct
pub struct PC {
    size: usize,
    page: usize,
    offset: usize,
} 

#[styled_component(OwnTableComponent)]
pub fn table<D,C>(props: &TableProps<D,C>) -> Html
where
    D: Properties + Clone + PartialEq + Debug + Default + 'static,
    C: Clone + PartialEq + Debug + ColumnTrait<D> + 'static
{
    let data_list: UseStateHandle<Vec<Html>> = use_state(Vec::default);
    let whole_list: Rc<RefCell<Vec<D>>> = use_mut_ref(Vec::default);
    let p_c = use_state( || PC{ size: 20, page: 1, offset: 0});
    {
        let data_list = data_list.clone();
        let data_info = props.data.clone();
        let columns = props.columns.clone();
        use_effect_with_deps(
            move |data_info| {
                let mut data_li = (*data_list).clone();
                *whole_list.borrow_mut() = data_info.clone();
                let mut size = data_info.len();
                if props.pagination.clone() {
                    size = p_c.clone().size;
                }
                for (index, row) in (&data_info.clone()[0..size]).iter().enumerate() {
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
    };
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
                let page_all = data_info.len() / p_c.size;
                html!{
                    <nav class="pagination is-centered" role="navigation" aria-label="pagination">
                        <a class="pagination-previous">{"上一页"}</a>
                        <a class="pagination-next">{"下一页"}</a>
                        <ul class="pagination-list">
                            {
                                match p_c.page {
                                    1 => html!{}
                                }
                            }
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
