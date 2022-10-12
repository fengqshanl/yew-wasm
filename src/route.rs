use pages::{
    case::Case, drug::Drug, guest::Guest, page_not_found::PageNotFound, people::index::People,
    setting::Setting,
};
use yew::{html, Html};
use yew_router::prelude::*;

use crate::pages;

#[derive(Routable, PartialEq, Clone, Debug)]
pub enum Route {
    #[at("/people")]
    People,
    #[at("/guest")]
    Guest,
    #[at("/drug")]
    Drug,
    #[at("/case")]
    Case,
    #[at("/setting")]
    Setting,
    #[not_found]
    #[at("/404")]
    NotFound,
}

pub fn switch(routes: &Route) -> Html {
    match routes.clone() {
        Route::People => {
            return html! { <People /> }
        }
        Route::Guest => {
           return html! { <Guest /> }
        }
        Route::Drug => {
           return html! { <Drug /> }
        }
        Route::Case => {
           return html! { <Case /> }
        }
        Route::Setting => {
           return html! { <Setting /> }
        }
        Route::NotFound => {
           return html! { <PageNotFound /> }
        }
    }
}
