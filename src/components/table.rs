use std::{fmt::{Debug}, cell::RefCell, rc::Rc};
use stylist::yew::styled_component;
use yew::prelude::*;
use super::pagination::pagination::{PC, Pagination};

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
    let whole_list: Rc<RefCell<Vec<D>>> = use_mut_ref(Vec::default);
    let p_c = use_state( || PC{ size: 20, page: 1, offset: 0});
    {
        let data_list = data_list.clone();
        let data_info = props.data.clone();
        let columns = props.columns.clone();
        let pagination = props.pagination.clone();
        let whole_list = whole_list.clone();
        let p_c = p_c.clone();
        use_effect_with_deps(
            move |data_info| {
                let mut data_li = (*data_list).clone();
                *whole_list.borrow_mut() = data_info.clone();
                let mut size = data_info.len();
                if pagination && (size > p_c.size) {
                    size = p_c.clone().size;
                }
                if data_info.len() > 0 {
                    for (index, row) in (data_info.clone()[0..size]).iter().enumerate() {
                            let html = html! {
                                <tr>
                                    {
                                        for columns.clone().iter().map(|col|{
                                            html!{
                                                <th>
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
                }
                || log::info!("table component render error!")
            },
            data_info,
        );
    };
    let page_change = {
        let data_list = data_list.clone();
        let columns = props.columns.clone();
        let whole_list = whole_list.clone();
        let p_c = p_c.clone();
        Callback::from(move |index: usize|{
            let left = (index - 1) * p_c.size;
            let right = index * p_c.size;
            let mut data_li = vec![];
            for (index, row) in (whole_list.borrow_mut()[left..right]).iter().enumerate() {
                let html = html! {
                    <tr>
                        {
                            for columns.clone().iter().map(|col|{
                                html!{
                                    <th>
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
            ()
        })
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
            {if props.pagination.clone() {
                    let list = &*whole_list.borrow_mut();
                    html!{
                        <Pagination page_change={page_change} length={list.len()} config={p_c.clone()} />
                    }
                } else {
                    html!{ }
            }}
        </div>
      }
}
