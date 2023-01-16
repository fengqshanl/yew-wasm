use std::{fmt::{Debug}};
use serde::Deserialize;
use yew::prelude::*;
use yew_hooks::{use_async, use_effect_once};

use crate::ownhttp::myhttp::request;

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct AutoFillProps {
    #[prop_or_default]
    pub name: String,
    pub placeholder: String, 
    pub url: String,
}

pub trait ForForm {
    fn for_form(&self) -> Self;
    fn get_key(&self) -> &str;
    fn get_name(&self) -> &str;
}

#[function_component(AutoFill)]
pub fn autofill<T: for<'a> Deserialize<'a> + Debug + Clone + ForForm + PartialEq + 'static>(props: &AutoFillProps) -> Html {
    let fill_list = use_state(Vec::default);
    let visible = use_state(|| false);
    let get_fill_list = {
        let props = props.clone();
        use_async(async move {
        request::<(), Vec<T>>(reqwest::Method::GET, props.url.clone(), ()).await
    })};
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
    {
        let get_fill_list = get_fill_list.clone();
        use_effect_once(move || {
            get_fill_list.run();
            || log::info!("Running clean-up of effect on unmount")
        });
    }
    {
        let fill_list = fill_list.clone();
        let get_fill_list = get_fill_list.clone();
        use_effect_with_deps(
            move |get_fill_list| {
                if let Some(list_data) = &get_fill_list.data {
                    fill_list.set(
                        list_data
                            .iter()
                            .map(move |info| info.for_form())
                            .collect(),
                    )
                }
                || ()
            },
            get_fill_list,
        )
    }
    html!{
        <div onblur={hidden_autocomplete} onfocus={show_autocomplete}>
            <input type="text" class="autofill"  placeholder={props.placeholder.clone()} oninput={input} />
            {
                if *visible {
                    html!{
                        <div class="input-auto-complete">
                            {for fill_list.iter().map(|value|{
                                return html!{
                                    <div class="autofill-row" key={value.get_key()}>
                                        {value.get_name()}
                                    </div>
                                }
                            })}
                        </div>
                    }
                }else{
                    html!{}
                }
            }
        </div>
    }
}