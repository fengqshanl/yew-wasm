use std::{fmt::{Debug, Display, self}};
use yew::{prelude::*};

#[derive(Clone, PartialEq, Debug)]
pub struct AutoFillOptions {
    pub label: String,
    pub options: Box<Option<Vec<AutoFillOptions>>>
}

impl Display for AutoFillOptions {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "Display: {} + {:?}i", self.label, self.options)
    }
}

#[derive(Clone, PartialEq, Debug, Properties)]
pub struct AutoFillProps {
    #[prop_or_default]
    pub name: String,
    pub placeholder: String, 
    pub options: Vec<AutoFillOptions>,
}

pub trait ForForm {
    fn get_key(&self) -> &str;
    fn get_name(&self) -> &str;
}

#[function_component(AutoFill)]
pub fn autofill(props: &AutoFillProps) -> Html {
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
    log::info!("value: {:?}", props.options);

    html!{
        <div onblur={hidden_autocomplete} onfocus={show_autocomplete}>
            <input type="text" class="input"  placeholder={props.placeholder.clone()} oninput={input} />
            {
                if *visible {
                    let chose = {
                        Callback::from(move|e: MouseEvent|{
                            log::info!("click target {:?}", e.current_target());
                        })
                    };
                    html!{
                        <div class="autofill-auto-complete" onclick={chose}>
                            {
                                for props.options.iter().map(|value|{
                                    html!{
                                        <div class="autofill-auto-complete-row">
                                            {value.label.clone()}
                                        </div>
                                    }
                                })
                            }
                        </div>
                    }
                }else{
                    html!{}
                }
            }
        </div>
    }
}