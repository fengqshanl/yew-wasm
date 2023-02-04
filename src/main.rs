extern crate yew;
extern crate validator_derive;
use chrono::prelude::*;
use route::{switch, Route};
use yew::prelude::*;
use yew_router::prelude::*;
mod components;
mod dropdown;
mod error;
mod ownhttp;
mod pages;
mod route;
mod back;

#[function_component(Model)]
pub fn model() -> Html {
    return html!{
        <BrowserRouter>
            <div class="layout">
                <div class="system-content">
                        <div class="system-content-left">
                            <aside class="menu">
                                <p class="menu-label">
                                    {"药品出入库"}
                                </p>
                                <ul class="menu-list">
                                    <li>
                                        <Link<Route> classes={"is-ghost"} to={Route::Home}>
                                            {"首页"}
                                        </Link<Route>>
                                    </li>
                                    <li>
                                        <Link<Route> classes={"is-ghost"} to={Route::Sale}>
                                            {"销售页"}
                                        </Link<Route>>
                                    </li>
                                    <li>
                                        <Link<Route> classes={"is-ghost"} to={Route::Purchase}>
                                            {"药品入库"}
                                        </Link<Route>>
                                    </li>
                                    <li>
                                        <Link<Route> classes={"is-ghost"} to={Route::Drug}>
                                            {"药品出库"}
                                        </Link<Route>>
                                    </li>
                                    <li>
                                        <Link<Route> classes={"is-ghost"} to={Route::People}>
                                            {"库存清单"}
                                        </Link<Route>>
                                    </li>
                                    <li>
                                        <Link<Route> classes={"is-ghost"} to={Route::Setting}>
                                            {"流水"}
                                        </Link<Route>>
                                    </li>
                                </ul>
                            </aside>
                        </div>
                        <div class="system-content-right">
                            <Switch<Route> render={Switch::render(switch)} />
                        </div>
                </div>
            </div>
        </BrowserRouter>
    }
}

fn main() {
    wasm_logger::init(wasm_logger::Config::default());
    yew::start_app::<Model>();
}