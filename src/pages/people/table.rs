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
            <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
  <thead>
    <tr>
      <th>{"序号"}</th>
      <th>{"药品名称"}</th>
      <th>{"商标"}</th>
      <th>{"规格"}</th>
      <th>{"关键字"}</th>
      <th>{"上市时间"}</th>
      <th>{"地址"}</th>
      <th>{"公司名称"}</th>
      <th>{"企业名称"}</th>
      <th>{"物品编码"}</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>{"1"}</th>
      <td>{"Leicester City"}<strong>{"(C)"}</strong>
      </td>
      <td>{"38"}</td>
      <td>{"23"}</td>
      <td>{"12"}</td>
      <td>{"3"}</td>
      <td>{"68"}</td>
      <td>{"36"}</td>
      <td>{"+32"}</td>
      <td>{"81"}</td>
    </tr>
  </tbody>
</table>
        }
    }
}