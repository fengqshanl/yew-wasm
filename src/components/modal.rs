use web_sys::MouseEvent;
use yew::prelude::*;
use yew::{ Callback};

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct ModalProps {
    pub name: String,
    #[prop_or_default]
    pub children: Children,
    pub save: Callback<MouseEvent>,
    pub cancel: Callback<MouseEvent>,
}

#[function_component(OwnModalComponent)]
pub fn modal(props: &ModalProps) -> Html {
    return html!{
       <div class="modal is-active">
            <div class="modal-background"></div>
            <div class="modal-card">
                <header class="modal-card-head">
                    <p class="modal-card-title">{props.name.clone()}</p>
                </header>
                <section class="modal-card-body">
                    {props.children.clone()}
                </section>
                <footer class="modal-card-foot">
                    <button class="button is-success"  onclick={props.save.clone()}>{"确定"}</button>
                    <button class="button" onclick={props.cancel.clone()}>{"取消"}</button>
                </footer>
            </div>
        </div>
    }
}