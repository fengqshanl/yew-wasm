use super::table::DrugTable;
use yew::prelude::*;
use yew_hooks::prelude::*;

#[function_component(People)]
pub fn people() -> Html {
    html! {
        <div>
            <DrugTable />
        </div>
    }
}
