use crate::pages::people::table::DrugTable;
use yew::prelude::*;
use yew_hooks::prelude::*;

#[function_component(People)]
pub fn people() -> Html {
    return html! {
        <div>
            <DrugTable />
        </div>
    }
}
