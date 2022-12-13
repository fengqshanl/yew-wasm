use web_sys::{FocusEvent};
use std::fmt::{Debug};
use yew::prelude::*;
use yew::{ Callback};

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct FormProps<F: Properties + Clone + PartialEq + Debug> {
    #[prop_or_default]
    pub children: Children,
    pub form: UseStateHandle<F>,
}

#[function_component(Form)]
pub fn form<F: Properties + Clone + PartialEq + Debug>(props: &FormProps<F>) -> Html {
    let submit = Callback::from(|e: FocusEvent| {
        println!("{:?}",e.target()
                            .expect("null")
                            .value_of()
                        );
        e.prevent_default();
    });
    html!{
        <form onsubmit={submit}>
            {props.children.clone()}
        </form>
    }
}