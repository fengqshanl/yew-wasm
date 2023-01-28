use std::{fmt::{Debug}};
use yew::prelude::*;

use crate::components::autofill::autofill::{AutoFill, AutoFillOptions};

#[derive(Clone, PartialEq, Debug)]
pub enum ComponentType {
    Autofill, Input, Submit
}

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct InputProps {
    #[prop_or_default]
    pub name: String,
    #[prop_or_default]
    pub auto_options: Vec<AutoFillOptions>,
    pub handler: Option<UseStateHandle<String>>,
    pub component_type: &'static ComponentType,
    #[prop_or_default]
    pub placeholder: String, 
}

#[function_component(Input)]
pub fn input(props: &InputProps) -> Html {
    match props.component_type {
        ComponentType::Autofill => {
            html!{
                <AutoFill name={props.name.clone()} id={props.handler.clone()} placeholder={""} options={props.auto_options.clone()} />    
            }
        },
        ComponentType::Input => {
            html!{
                <div>
                    <input type="text" class="input" name={props.name.clone()} placeholder={props.placeholder.clone()} />
                </div>
            }
        },
        ComponentType::Submit => {
            html!{
                <div>
                    <button class="button is-success" type={"submit"}>{props.name.clone()}</button>
                </div>
            }
        }
    }
}