use std::fmt::{Debug};
use yew::prelude::*;

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct PaginationProps {
    pub length: usize,
    pub config: UseStateHandle<PC>
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
    // 根据 长度的大小决定央视展示 
    let pa_len = props.length / props.config.size;
    log::info!("{:?}", pa_len); 
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
}