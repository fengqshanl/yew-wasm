use pages::{
    drug::drug::Drug, home::index::Home, page_not_found::PageNotFound,
    people::index::People, setting::setting::Setting, purchase::purchase::Purchase,
    login::login::Login, sale::sale::Sale,
};
use yew::{html, Html};
use yew_router::prelude::*;

use crate::pages;

#[derive(Routable, PartialEq, Clone, Debug)]
pub enum Route {
    #[at("/")]
    Login,
    #[at("/sale")]
    Sale,
    #[at("/home")]
    Home,
    #[at("/list")]
    People,
    #[at("/out")]
    Drug,
    #[at("/stream")]
    Setting,
    #[at("/in")]
    Purchase,
    #[not_found]
    #[at("/404")]
    NotFound,
}

pub fn switch(routes: &Route) -> Html {
    match routes.clone() {
        Route::Login => return html!{ <Login /> },
        Route::Sale => return html!{ <Sale /> },
        Route::Home => return html! { <Home /> },
        Route::People => return html! { <People /> },
        Route::Purchase => return html! { <Purchase /> },
        Route::Drug => return html! { <Drug /> },
        Route::Setting => return html! { <Setting /> },
        Route::NotFound => return html! { <PageNotFound /> },
    }
}
