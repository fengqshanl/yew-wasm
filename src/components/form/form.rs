use web_sys::{FocusEvent};
use std::fmt::{Debug};
use yew::prelude::*;
use yew::{ Callback};

use super::formitem::FormItem;

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct FormProps<F: Properties + Clone + PartialEq + Debug> {
    #[prop_or_default]
    pub children: ChildrenWithProps<FormItem>,
    pub form: UseStateHandle<F>,
}

#[function_component(Form)]
pub fn form<F: Properties + Clone + PartialEq + Debug>(props: &FormProps<F>) -> Html {
    let submit = {
        let props = props.clone();
        Callback::from(move |e: FocusEvent| {
            log::info!("{:?}",e.target().expect("null").value_of());
            for component in  props.children.iter() {
                log::info!("{:?}", component.props.require);
            };
            e.prevent_default();
        })
    };
    html!{
        <form onsubmit={submit}>
            { for props.children.iter() }
        </form>
    }
}