use yew::prelude::*;

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct FormItemProps {
    #[prop_or_default]
    pub children: Children,
    pub name: String,
    pub label: String,
    pub require: bool,
    pub message: String,
}

#[function_component(FormItem)]
pub fn form_item(props: &FormItemProps) -> Html {
    html!{
        <div class="field">
            <label class="label">{props.label.clone()}</label>
            {props.children.clone()}
            <p class="help is-success">{props.message.clone()}</p>
        </div>
    }
}