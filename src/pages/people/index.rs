use yew::prelude::*;
use yew_hooks::prelude::*;
use super::table::DrugTable;

#[function_component(People)]
pub fn people() -> Html {

    html! {
        <div>
            <DrugTable />
        </div>
    }
}