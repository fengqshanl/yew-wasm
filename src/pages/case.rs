use yew::prelude::*;

#[derive(Clone, Debug, Eq, PartialEq, Properties)]
pub struct CaseProps {
    
}

pub struct Case {
    
}
impl Component for Case {
    type Message = ();
    type Properties = CaseProps;

    fn create(ctx: &Context<Self>) -> Self {
        Self {
            
        }
    }

    fn changed(&mut self, ctx: &Context<Self>) -> bool {
        false
    }

    fn view(&self, _ctx: &Context<Self>) -> Html {

        html! {
            <div>
                {"Case"}
            </div>
        }
    }
}