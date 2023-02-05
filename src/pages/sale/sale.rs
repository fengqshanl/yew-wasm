use reqwest::Url;
use web_sys::{FocusEvent, HtmlFormElement};
use yew::prelude::*;
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
    let drug_value = use_state(DrugDetail::default);
    let visible = use_state(|| false);
    let get_detail_by_id = {
        let id = id.clone();
        // TODO 优化 url 格式化
        use_async(async move {
            request::<(), Vec<DrugDetail>>(reqwest::Method::GET, format!("/drug?id={}", (*id).clone()), (), false).await
    })};
    let submit = {
        let id = id.clone();
        let get_detail = get_detail_by_id.clone();
        let visible = visible.clone();
        Callback::from(move |e: FocusEvent| {
            e.prevent_default();
            let form = web_sys::FormData::new_with_form(
                &e.target().and_then(|t| t.dyn_into::<HtmlFormElement>().ok()).expect("msg")
            ).expect("create FormData failed");

            id.set(form.get("id").as_string().expect("msg"));
            log::info!("value: {:?}", form.get("id").as_string().expect("msg"));
            get_detail.run();
            visible.set(true);
        })
    };
    let on_save = {
        Callback::from(move|e|{

        })
    };
    let on_cancel = {
        let visible = visible.clone();
        Callback::from(move|e|{
            visible.set(false);
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
            { if *visible {
                html!{
                    <OwnModalComponent
                        name={"添加".to_string()}
                        save={on_save.clone()}
                        cancel={on_cancel.clone()}
                    >
                        <div class="card drug-card-bottom">
                            <div class="card-content">
                                <div class="content drug-card-content">
                                    <div class="columns">
                                        <div class="column is-half">
                                            <input readonly={true} value={drug_value.name.clone()} placeholder="名称" />
                                            <input readonly={true} value={drug_value.number.clone()} placeholder="规格" />
                                            <input readonly={true} value={drug_value.money.clone()} placeholder="单价" />
                                            <input placeholder="数量" />
                                        </div>
                                    </div>
                                </div>
                            </div>                    
                        </div>
                    </ OwnModalComponent>
            }}else{html!{}}}
        </div>
    }
}