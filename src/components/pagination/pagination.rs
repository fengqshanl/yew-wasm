use std::{fmt::{Debug}};
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
    let pre = {
        let props = props.clone();
        Callback::from(move|_|{
            log::info!("pre click{:?}",props.config.page);
            if props.config.page > 1 {
                props.config.set(PC{
                    size: props.config.size,
                    offset: props.config.offset - props.config.size,
                    page: props.config.page - 1
                });
                props.page_change.emit(props.config.page - 1)
            }
        })
    };
    let after = {
        let props = props.clone();
        let whole_len = props.length / props.config.size;
        Callback::from(move|_|{
            log::info!("pre click:{:?};whole:{:?}",props.config.page, whole_len);
            if props.config.page < whole_len {
                props.config.set(PC{
                    size: props.config.size,
                    offset: props.config.size + props.config.offset,
                    page: props.config.page + 1
                });
                props.page_change.emit(props.config.page + 1)
            }
        })
    };
    let ht = {
        let pa = props.length / props.config.size;
        let mut arr = vec![];
        for index in 1..=pa {
            arr.push(html!{
                <li>
                    <a class="pagination-link" aria-label={format!("Goto page {:?}",index)}>
                        { format!("{:?}",index) }
                    </a>
                </li>
            })
        }
        arr
    };
        html!{
            <nav class="pagination is-centered" role="navigation" aria-label="pagination">
                <a class="pagination-previous" onclick={pre}>{"上一页"}</a>
                <a class="pagination-next" onclick={after}>{"下一页"}</a>
                <ul class="pagination-list">
                    {
                        for ht
                    }
                </ul>
            </nav>
}}