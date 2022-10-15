use yew::prelude::*;

#[derive(Clone, Debug, Eq, PartialEq, Properties)]
pub struct DrugProps {}

pub struct Drug {}
impl Component for Drug {
    type Message = ();
    type Properties = DrugProps;

    fn create(_ctx: &Context<Self>) -> Self {
        Self {}
    }

    fn changed(&mut self, _ctx: &Context<Self>) -> bool {
        false
    }

    fn view(&self, _ctx: &Context<Self>) -> Html {
        html! {
            <div>
                {"Drug"}
            </div>
        }
    }
}
