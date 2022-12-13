use yew::prelude::*;

#[derive(Properties, Clone, PartialEq, Debug)]
pub struct FormItemProps {
    #[prop_or_default]
    pub children: Children,
    pub name: String,
    pub label: String,
    pub require: bool,
}

#[function_component(FormItem)]
pub fn form_item(props: &FormItemProps) -> Html {
    html!{
       <div class="modal is-active">
           
        </div>
    }
}