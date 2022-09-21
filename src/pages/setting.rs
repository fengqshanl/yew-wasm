use yew::prelude::*;

#[derive(Clone, Debug, Eq, PartialEq, Properties)]
pub struct SettingProps {}

pub struct Setting {}
impl Component for Setting {
    type Message = ();
    type Properties = SettingProps;

    fn create(ctx: &Context<Self>) -> Self {
        Self {}
    }

    fn changed(&mut self, ctx: &Context<Self>) -> bool {
        false
    }

    fn view(&self, _ctx: &Context<Self>) -> Html {
        html! {
            <div>
                {"setting"}
            </div>
        }
    }
}
