use serde::Deserialize;
use wasm_bindgen::JsCast;
use web_sys::{FocusEvent, HtmlFormElement};
use std::fmt::{Debug};
use yew::prelude::*;
use yew::{ Callback};
use super::formitem::FormItem;

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct FormProps<F: Properties + Clone + PartialEq + Debug + for<'de> Deserialize<'de>> {
    #[prop_or_default]
    pub children: ChildrenWithProps<FormItem>,
    pub form: UseStateHandle<F>,
}

pub trait FormTypes {
    fn try_set(&self, name:String){
        self[name]
    }
}

#[function_component(Form)]
pub fn form<F: Properties + Clone + PartialEq + Debug + for<'de> Deserialize<'de>>(props: &FormProps<F>) -> Html {
    let submit = {
        let props = props.clone();
        Callback::from(move |e: FocusEvent| {
            e.prevent_default();
            let form_data: F;
            // 通过 FormData 获得 form 表单的值
            let form = web_sys::FormData::new_with_form(
                &e.target().and_then(|t| t.dyn_into::<HtmlFormElement>().ok()).expect("msg")
            ).expect("create FormData failed");
            // 通过 props 获得传入的校验规则
            for component in  props.children.iter() {
                // 对输入的值进行校验
                log::info!("form string: {:?}", form.get(&component.props.name));
                form_data[component.props.name] = form.get(&component.props.name);
            };
        })
    };
    html!{
        <form onsubmit={submit}>
            { for props.children.iter() }
        </form>
    }
}