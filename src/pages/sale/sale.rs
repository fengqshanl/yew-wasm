use crate::components::table::{OwnTableComponent};
use crate::components::form::{form::Form, formitem::FormItem};
use crate::components::input::input::{Input, ComponentType};
use serde::{Deserialize, Serialize};
use web_sys::{FocusEvent, HtmlFormElement};
use yew::prelude::*;
use sp_yew::uuid::Uuid;
use chrono::Local;
use super::model::DrugDetail;
use wasm_bindgen::JsCast;
use crate::ownhttp::myhttp::request;
use crate::components::modal::OwnModalComponent;
use yew::{function_component, html};
use yew_hooks::use_async;
use yew_hooks::{use_effect_once};

#[function_component(Sale)]
pub fn sale() -> Html {
    let id = use_state(String::default);
    let get_detail_by_id = {
        let id = id.clone();
        use_async(async move {
            request::<String, Vec<DrugDetail>>(reqwest::Method::GET, "/drug_tail".to_string(), (*id).clone(), false).await
    })};
    let submit = {
        let id = id.clone();
        let get_detail = get_detail_by_id.clone();
        Callback::from(move |e: FocusEvent| {
            e.prevent_default();
            let form = web_sys::FormData::new_with_form(
                &e.target().and_then(|t| t.dyn_into::<HtmlFormElement>().ok()).expect("msg")
            ).expect("create FormData failed");

            id.set(form.get("id").as_string().expect("msg"));
            log::info!("value: {:?}", form.get("id").as_string().expect("msg"));
            get_detail.run();
        })
    };
    html! {
        <div class="drug-components"> 
            <div class="drug-components-top">
                <div class="drug-buttons">
                    {"添加商品"}
                    <form onsubmit={submit}>
                        <input name={"id"} />
                    </form>
                    <button class="button is-link drug-in-out-button" >{"扫码识别"}</button>
                </div>
            </div>
        </div>
    }
}