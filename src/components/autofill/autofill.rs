use std::{fmt::{Debug, Display, self}};
use wasm_bindgen::JsCast;
use sp_yew::uuid::Uuid;
use web_sys::{HtmlBodyElement, HtmlInputElement, HtmlDivElement};
use yew::{prelude::*};
use yew_hooks::{use_async};

use crate::{ownhttp::myhttp::request, pages::{people::table::PeopleData, drug}};

#[derive(Clone, PartialEq, Debug)]
pub struct AutoFillOptions {
    pub label: String,
    pub key: String,
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
    pub id: Option<UseStateHandle<String>>,
    pub placeholder: String, 
    pub options: Vec<AutoFillOptions>,
}

pub trait ForForm {
    fn get_key(&self) -> &str;
    fn get_name(&self) -> &str;
}

// TODO 虚拟列表
#[function_component(AutoFill)]
pub fn autofill(props: &AutoFillProps) -> Html {
    let visible = use_state(|| false);
    let id = use_state(String::default);
    let fill_list: UseStateHandle<Vec<AutoFillOptions>> = use_state(Vec::default);
    let input_value = use_state(String::default);
    let get_data = {
        let input_value = input_value.clone();
        use_async(async move {
            request::<String, Vec<PeopleData>>(reqwest::Method::PUT, "/search_drug_name".to_string(), (*input_value).clone(), true).await
        })
    };
    {
        let get_data = get_data.clone();
        let fill_list = fill_list.clone();
        use_effect_with_deps(move|data|{
            if let Some(list) = &data.data {
                fill_list.set(
                    list
                        .iter()
                        .map(move |drug| AutoFillOptions {
                            label: drug.name.clone(),
                            key: drug.drug_id.clone(),
                            options: Box::new(None)
                        })
                        .collect()
                )
            } || ()
        }, get_data)
    }
    let input = {
        let input_value = input_value.clone();
        let id = id.clone();
        let visible = visible.clone();
        Callback::from(move|e: InputEvent|{
            let input: HtmlInputElement = e.target_unchecked_into();
            input_value.set(input.value());
            id.set(String::default());
            get_data.run();
            if *visible == false {
                visible.set(true);
            }
        })
    };
    html!{
        <div>
            <input type="text" class="input" name={props.name.clone()} placeholder={props.placeholder.clone()} oninput={input} value={(*input_value).clone()}  />
            {
                if *visible {
                    let hidden_autocomplete_inner = {
                        let visible = visible.clone();
                        Callback::from(move|_|{
                            visible.set(false);
                        })
                    };
                    html!{
                        <div class="autofill-auto-complete" onblur={hidden_autocomplete_inner}>
                            {
                                for (*fill_list).clone().iter().map(|value|{
                                    let chose_element = {
                                        let input_value = input_value.clone();
                                        let prop = props.clone();
                                        let value = value.clone();
                                        let visible = visible.clone();
                                        Callback::from(move|e: MouseEvent|{
                                            let target = e.target();
                                            match target {
                                                Some(target) => {
                                                    let target: HtmlDivElement = target.unchecked_into::<HtmlDivElement>();
                                                    input_value.set(target.inner_text());
                                                    match prop.clone().id {
                                                        Some(id) => id.set(value.clone().key),
                                                        None => {}
                                                    }
                                                },
                                                _ => {}
                                            };
                                            visible.set(false)
                                        })
                                    };
                                    html!{
                                        <div class="autofill-auto-complete-row" onclick={chose_element}>
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