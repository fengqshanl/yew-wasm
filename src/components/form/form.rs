use serde::Deserialize;
use wasm_bindgen::JsCast;
use web_sys::{FocusEvent, HtmlFormElement};
use std::fmt::{Debug};
use yew::prelude::*;
use yew::{ Callback};

use super::formitem::FormItem;

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct FormProps<F: Properties + Clone + PartialEq + Debug + for<'de> Deserialize<'de> + FormTypes> {
    #[prop_or_default]
    pub children: ChildrenWithProps<FormItem>,
    pub form: Callback<F>,
}

pub trait FormTypes {
    fn try_set(&mut self, name: &str, value: wasm_bindgen::JsValue) -> Result<(), std::io::Error>;
}

#[function_component(Form)]
pub fn form<F: Properties + Clone + Default + PartialEq + Debug + for<'de> Deserialize<'de> + FormTypes + 'static>(props: &FormProps<F>) -> Html {
    let submit = {
        let props = props.clone();
        Callback::from(move |e: FocusEvent| {
            log::info!("submit");
            e.prevent_default();
            let mut form_data: F = F::default();
            // 通过 FormData 获得 form 表单的值
            let form = web_sys::FormData::new_with_form(
                &e.target().and_then(|t| t.dyn_into::<HtmlFormElement>().ok()).expect("msg")
            ).expect("create FormData failed");
            // 通过 props 获得传入的校验规则
            for component in  props.children.iter() {
                log::info!("name:{:?}", component);
                // 对输入的值进行校验
                form_data.try_set(&component.props.name, form.get(&component.props.name)).expect("set err");
            };
            props.form.emit(form_data)
        })
    };
    html!{
        <form onsubmit={submit}>
            { for props.children.iter() }
        </form>
    }
}