use std::rc::Rc;
use yew::html::ChildrenWithProps;
use yew::{prelude::*};

use crate::components::input::input::Input;

#[derive(PartialEq, Properties)]
pub struct ChildProps {
    name: String
}

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct FormItemProps {
    #[prop_or_default]
    pub children: ChildrenWithProps<Input>,
    #[prop_or_default]
    pub name: String,
    #[prop_or_default]
    pub label: String,
    #[prop_or_default]
    pub require: bool,
    #[prop_or_default]
    pub message: String,
}

#[function_component(FormItem)]
pub fn form_item(props: &FormItemProps) -> Html {
    html!{
        <div class="field">
            <label class="label">{props.label.clone()}</label>
            {for props.children.iter().map(|mut item| {
                let mut child_props = Rc::make_mut(&mut item.props);
                child_props.name = props.name.clone();
                item
            })}
            // <p class="help is-success">{props.message.clone()}</p>
        </div>
    }
}