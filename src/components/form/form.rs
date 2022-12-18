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
    let submit = Callback::from(|e: FocusEvent| {
        println!("{:?}",e.target().expect("null").value_of());
        props.children.clone().iter().map(|component|{
            println!("{:?}", component.clone().props.clone());
        });
        e.prevent_default();
    });
    html!{
        <form onsubmit={submit}>
            { for props.children.iter() }
        </form>
    }
}