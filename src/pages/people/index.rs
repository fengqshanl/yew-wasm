use yew::prelude::*;
use super::table::DrugTable;

#[derive(Clone, Debug, Eq, PartialEq, Properties)]
pub struct PeopleProps {
    
}

pub struct People {
    
}
impl Component for People {
    type Message = ();
    type Properties = PeopleProps;

    fn create(ctx: &Context<Self>) -> Self {
        Self {
            
        }
    }

    fn changed(&mut self, ctx: &Context<Self>) -> bool {
        true
    }

    fn view(&self, _ctx: &Context<Self>) -> Html {

        html! {
            <div>
                <DrugTable />
            </div>
        }
    }
}