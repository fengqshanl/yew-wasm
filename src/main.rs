#[macro_use]
extern crate yew;
use yew::prelude::*;
use yew::html::Scope;
use yew_router::prelude::*;
use route::{Route, switch};
mod ownhttp;
mod dropdown;
mod pages;
mod route;
mod error;

struct Msg {
    
}

struct Model {
    value: i64,
    persons: Vec<String>,
    drop_list: Vec<String>,
}

impl Model {
    fn button_view(&self, link: &Scope<Self>) -> Html{
        html!{
            <aside class="menu">
  <p class="menu-label">
    {"药品出入库"}
  </p>
  <ul class="menu-list">
    <li>
        <Link<Route> classes={"is-ghost"} to={Route::People}>
            {"库存清单"}
        </Link<Route>>
    </li>
    <li>
        <Link<Route> classes={"is-ghost"} to={Route::Guest}>
            {"药品入库"}
        </Link<Route>>
    </li>
    <li>
        <Link<Route> classes={"is-ghost"} to={Route::Drug}>
        {"药品出库"}
        </Link<Route>>
    </li>
    <li>
        <Link<Route> classes={"is-ghost"} to={Route::Case}>
            {"药品出入库记录"}
        </Link<Route>>
    </li>
    <li>
        <Link<Route> classes={"is-ghost"} to={Route::Setting}>
            {"出入库流水"}
        </Link<Route>>
    </li>
  </ul>
</aside>
            // <nav class="navbar" role="navigation" aria-label="main navigation">
            // <div class="navbar-menu">
            // <div class="navbar-start">
            //     <Link<Route> classes={classes!("navbar-item","is-ghost")} to={Route::People}>
            //         { "人员" }
            //     </Link<Route>>
            //     <Link<Route> classes={classes!("navbar-item","is-ghost")} to={Route::Guest}>
            //         {"客户"}
            //     </Link<Route>>
            //     <Link<Route> classes={classes!("navbar-item")} to={Route::Drug}>
            //         {"药品"}
            //     </Link<Route>>
            //     <Link<Route> classes={classes!("navbar-item")} to={Route::Case}>
            //         {"病例"}
            //     </Link<Route>>
            //     <Link<Route> classes={classes!("navbar-item")} to={Route::Setting}>
            //         {"设置"}
            //     </Link<Route>>
            //     </div>
            // </div>
            // </nav>
        }
    }
    fn login_view(&self, link:&Scope<Self>) -> Html {
        html! {
            <div class="top-info">
                <div>
                    {"name"}
                </div>
                <div>
                    {"profile photo"}
                </div>
            </div>
        }
    }
    fn logo_view(&self, link: &Scope<Self>) -> Html {
        html!{
            <div class="top-logo">
                {"logo"}
            </div>
        }
    }
    
}

impl Component for Model {
    type Message = Msg;
    type Properties = ();

    fn create(_ctx: &Context<Self>) -> Self {
        Self {
            value: 0,
            persons: Vec::with_capacity(5),
            drop_list: Vec::with_capacity(5),
        }
    }

    fn update(&mut self, _ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            _ => false
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        // This gives us a component's "`Scope`" which allows us to send messages, etc to the component.
        let link = ctx.link();
        html! {
            <BrowserRouter>
                <div class="layout">
                    <div class="top">
                        {self.logo_view(link)}
                        <div>
                            {"药品出入库管理平台"}
                        </div>
                        {self.login_view(link)}
                    </div>
                    <div class="content">
                            <div class="content-left">
                                {self.button_view(link)}
                            </div>
                            <div class="content-right">
                                <Switch<Route> render={Switch::render(switch)} />
                            </div>
                    </div>
                </div>
            </BrowserRouter>
        }
    }

    fn changed(&mut self, ctx: &Context<Self>) -> bool {
        true
    }

    fn rendered(&mut self, ctx: &Context<Self>, first_render: bool) {}

    fn destroy(&mut self, ctx: &Context<Self>) {}
}

fn main() {
    wasm_logger::init(wasm_logger::Config::default());
    yew::start_app::<Model>();
}