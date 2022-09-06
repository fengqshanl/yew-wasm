use yew::{html, Component, Context, Html, Properties};

#[derive(Debug, Eq, PartialEq, Properties)]
pub struct DrugTableProps {
    
}

pub struct DrugTable;

impl Component for DrugTable {
    type Message = ();
    type Properties = DrugTableProps;

    fn create(_ctx: &Context<Self>) -> Self {
        Self
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        html! {
            <table class="table">
            <thead>
              <tr>
                <th><abbr title="Position">{"序号"}</abbr></th>
                <th>{"商品"}</th>
                <th><abbr title="Played">{"商标"}</abbr></th>
                <th><abbr title="Won">{"规格"}</abbr></th>
                <th><abbr title="Drawn">{"关键字"}</abbr></th>
                <th><abbr title="Lost">{"上市时间"}</abbr></th>
                <th><abbr title="Goals for">{"地址"}</abbr></th>
                <th><abbr title="Goals against">{"企业名称"}</abbr></th>
                <th><abbr title="Goal difference">{"物品编码"}</abbr></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th>{"1"}</th>
                <td><a href="https://en.wikipedia.org/wiki/Leicester_City_F.C." title="Leicester City F.C.">{"Leicester City"}</a> 
                </td>
                <td>{"38"}</td>
                <td>{"23"}</td>
                <td>{"12"}</td>
                <td>{"3"}</td>
                <td>{"68"}</td>
                <td>{"36"}</td>
                <td>{"+32"}</td>
              </tr>
            </tbody>
          </table>
        }
    }
}