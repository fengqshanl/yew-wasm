extern crate yew;
extern crate validator_derive;

use route::{switch, Route};
use yew::prelude::*;
use yew_router::prelude::*;

mod components;
mod dropdown;
mod error;
mod ownhttp;
mod pages;
mod route;

struct Msg {}

struct Model {}

impl Model {
    fn button_view(&self) -> Html {
        html! {
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
                        <Link<Route> classes={"is-ghost"} to={Route::DrugIn}>
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
                        <Link<Route> classes={"is-ghost"} to={Route::Case}>
                            {"出入库记录"}
                        </Link<Route>>
                    </li>
                    <li>
                        <Link<Route> classes={"is-ghost"} to={Route::Setting}>
                            {"流水"}
                        </Link<Route>>
                    </li>
                </ul>
            </aside>
        }
    }
}

impl Component for Model {
    type Message = Msg;
    type Properties = ();

    fn create(_ctx: &Context<Self>) -> Self {
        Self {}
    }

    fn update(&mut self, _ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            _ => false,
        }
    }

    fn view(&self, _ctx: &Context<Self>) -> Html {
        html! {
            <BrowserRouter>
                <div class="layout">
                    <div class="system-content">
                            <div class="system-content-left">
                                {self.button_view()}
                            </div>
                            <div class="system-content-right">
                                <Switch<Route> render={Switch::render(switch)} />
                            </div>
                    </div>
                </div>
            </BrowserRouter>
        }
    }

    fn changed(&mut self, _ctx: &Context<Self>) -> bool {
        true
    }

    fn rendered(&mut self, _ctx: &Context<Self>, _first_render: bool) {}

    fn destroy(&mut self, _ctx: &Context<Self>) {}
}

fn main() {
    wasm_logger::init(wasm_logger::Config::default());
    yew::start_app::<Model>();
}
