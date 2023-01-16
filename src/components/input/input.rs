use std::{fmt::{Debug}};
use yew::prelude::*;

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct InputProps {
    #[prop_or_default]
    pub name: String,
    pub placeholder: String, 
}

#[function_component(Input)]
pub fn input(props: &InputProps) -> Html {
     
    let visible = use_state(|| false);
    let show_autocomplete = {
        let visible = visible.clone();
        Callback::from(move|_|{
            visible.set(true);
        })
    };
    let hidden_autocomplete = {
        let visible = visible.clone();
        Callback::from(move|_|{
            visible.set(false);
        })
    };
    let input = {
        Callback::from(move|e: InputEvent|{
            log::info!("input data:{:?}",e.data());
        })
    };
    html!{
        <div onblur={hidden_autocomplete} onfocus={show_autocomplete}>
            <input type="text" class="input"  placeholder={props.placeholder.clone()} oninput={input} />
            {
                if *visible {
                    html!{
                        <div class="input-auto-complete">
                            {"自动填充的显示框"}
                        </div>
                    }
                }else{
                    html!{}
                }
            }
        </div>
    }
}