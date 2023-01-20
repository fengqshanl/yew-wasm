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
    pub component_type: &'static ComponentType,
    #[prop_or_default]
    pub placeholder: String, 
}

#[function_component(Input)]
pub fn input(props: &InputProps) -> Html {
    let input = {
        Callback::from(move|e: InputEvent|{
            log::info!("input data:{:?}",e.data());
        })
    };
    match props.component_type {
        ComponentType::Autofill => {
            html!{
                <AutoFill name={props.name.clone()} placeholder={""} options={props.auto_options.clone()} />    
            }
        },
        ComponentType::Input => {
            html!{
                <div>
                    <input type="text" class="input" name={props.name.clone()} placeholder={props.placeholder.clone()} oninput={input} />
                </div>
            }
        },
        ComponentType::Submit => {
            log::info!("props{:?}", props);
            html!{
                <div>
                    <button class="button is-success" type={"submit"}>{props.name.clone()}</button>
                </div>
            }
        }
    }
}