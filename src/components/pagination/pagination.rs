use std::{fmt::{Debug}, ops::RangeInclusive};
use yew::prelude::*;

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct PaginationProps {
    pub length: usize,
    pub config: UseStateHandle<PC>,
    pub page_change: Callback<usize>
}

// pagination configure struct
#[derive(Default, Properties, PartialEq, Debug, Clone, Copy)]
pub struct PC {
    pub size: usize,
    pub page: usize,
    pub offset: usize,
} 

#[function_component(Pagination)]
pub fn pagination(props: &PaginationProps) -> Html {
    // 根据 长度的大小决定样式展示 
    let pa_len: &'static usize = &(props.length / props.config.size);
    let page_change = {
            let page_change = props.page_change.clone();
            Callback::from(move |index|{
                page_change.emit(index);
            })
        }; 
        html!{
            <nav class="pagination is-centered" role="navigation" aria-label="pagination">
                <a class="pagination-previous">{"上一页"}</a>
                <a class="pagination-next">{"下一页"}</a>
                <ul class="pagination-list">
                    {
                        for [1..=*pa_len].iter().map(|index: &RangeInclusive<usize>| {
                            html!{
                                <li>
                                    <a class="pagination-link" onclick={|_| page_change.emit(index)}
                                        aria-label={format!("Goto page {:?}",index)}>
                                        { format!("{:?}",index) }
                                    </a>
                                </li>
                            }
                        })
                    }
                </ul>
            </nav>
}}