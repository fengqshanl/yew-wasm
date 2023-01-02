use pages::{
    case::case::Case, drug::drug::Drug, home::index::Home, page_not_found::PageNotFound,
    people::index::People, setting::setting::Setting, purchase::purchase::Purchase
};
use yew::{html, Html};
use yew_router::prelude::*;

use crate::pages;

#[derive(Routable, PartialEq, Clone, Debug)]
pub enum Route {
    #[at("/home")]
    Home,
    #[at("/people")]
    People,
    #[at("/drug")]
    Drug,
    #[at("/case")]
    Case,
    #[at("/setting")]
    Setting,
    #[at("/purchase")]
    Purchase,
    #[not_found]
    #[at("/404")]
    NotFound,
}

pub fn switch(routes: &Route) -> Html {
    match routes.clone() {
        Route::Home => return html! { <Home /> },
        Route::People => return html! { <People /> },
        Route::Purchase => return html! { <Purchase /> },
        Route::Drug => return html! { <Drug /> },
        Route::Case => return html! { <Case /> },
        Route::Setting => return html! { <Setting /> },
        Route::NotFound => return html! { <PageNotFound /> },
    }
}
