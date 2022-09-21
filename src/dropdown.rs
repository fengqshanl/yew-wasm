use yew::{html, Component, Context, Html, Properties};

#[derive(Debug, Eq, PartialEq, Properties)]
pub struct DropDownProps {
    pub drop_list: Vec<String>,
    pub title: String,
}

pub struct DropDown;

impl Component for DropDown {
    type Message = ();
    type Properties = DropDownProps;

    fn create(_ctx: &Context<Self>) -> Self {
        Self
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        html! {
            <div class="drop-menu">
                <div class="drop-menu-title">{ctx.props().title.clone()}</div>
                <div class="drop-menu-list">
                { for ctx.props().drop_list.iter().map(|p|
                    html! {
                        <div class="dropdown-menu">
                            {p}
                            <div class="dropdown-menu-list">
                                {"list"}
                            </div>
                        </div>
                    }
                )}
                </div>
            </div>
        }
    }
}
