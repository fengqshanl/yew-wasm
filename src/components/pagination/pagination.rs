use std::{fmt::{Debug}, array};
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
    if props.length > 0 {
        // 根据 长度的大小决定央视展示 
        let pa_len = props.length / props.config.size;
        let mut arr = vec![];
        for i in 1..=pa_len {
            arr.push(i)
        }
        let props = props.clone();
        log::info!("pagination length: {:?}", pa_len); 
        html!{
            <nav class="pagination is-centered" role="navigation" aria-label="pagination">
                <a class="pagination-previous">{"上一页"}</a>
                <a class="pagination-next">{"下一页"}</a>
                <ul class="pagination-list">
                    {
                        for arr.iter().map(|index| {
                            let page_change = {
                                    Callback::from(|_|{
                                        props.page_change.emit(*index);
                                    })
                            };
                            html!{
                                <li>
                                    <a class="pagination-link" onclick={page_change} 
                                        aria-label={format!("Goto page {:?}",index)}>
                                        { format!("{:?}",index) }
                                    </a>
                                </li>
                            }
                        })
                    }
                </ul>
            </nav>
        }
    } else {
        html!{}
    }
}