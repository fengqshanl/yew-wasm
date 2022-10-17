use yew::prelude::*;
use yew::{html};

#[function_component(Home)]
pub fn home() -> Html {
    html! {
        <div class="case-components">
            <button class="button is-link drug-in-out-button" >{"扫码识别"}</button>
        </div>
    }
}
