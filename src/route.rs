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
            html! { <People /> }
        }
        Route::Guest => {
            html! { <Guest /> }
        }
        Route::Drug => {
            html! { <Drug /> }
        }
        Route::Case => {
            html! { <Case /> }
        }
        Route::Setting => {
            html! { <Setting /> }
        }
        Route::NotFound => {
            html! { <PageNotFound /> }
        }
    }
}
