use crate::back::purchase::BKPurchase;
use crate::components::autofill::autofill::AutoFillOptions;
use crate::components::input::input::ComponentType;
use crate::components::table::{OwnTableComponent};
use chrono::Local;
use sp_yew::uuid::Uuid;
use yew::prelude::*;
use yew::{html};
use crate::ownhttp::myhttp::request;
use yew_hooks::{use_async, use_effect_once};
use crate::components::{
    form::{form::{Form},formitem::FormItem},
    modal::OwnModalComponent,
    input::input::Input,
};

use super::models::{DrugInData, PurchaseType, DrugInColumn, PurchaseInColumn};

#[function_component(Purchase)]
pub fn purchase() -> Html {
    let name_options: UseStateHandle<Vec<AutoFillOptions>> = use_state(Vec::default);
    let drug_info: UseStateHandle<Vec<DrugInData>> = use_state(Vec::default);
    let loading = use_state(|| false);
    let purchase_list: UseStateHandle<Vec<PurchaseType>> = use_state(Vec::default);
    let visible = use_state(|| false);
    let get_drug_in_data = use_async(async move {
        request::<(), Vec<DrugInData>>(reqwest::Method::GET, "/purchase".to_string(), (), false).await
    });
    let save_purchase = {
        let purchase_list = purchase_list.clone();
        use_async(async move {
            let mut money: f32 = 0.0;
            for row in (*purchase_list).iter() {
                money = money + row.self_money;
            }; 
            let fmt = "%Y年%m月%d日 %H:%M:%S";
            let now = Local::now().format(fmt);
            let tar = BKPurchase{
                per_id: Uuid::new_v4().to_string(),
                kind: (*purchase_list).len().try_into().expect("msg"),
                money: money.into(),
                detail: (*purchase_list).clone(),
                in_time: now.to_string()
            };
            request::<BKPurchase, Vec<DrugInData>>(reqwest::Method::POST, "/purchase".to_string(), tar, false).await
    })};
    let columns = vec![
        DrugInColumn {
            title: "序号".to_string(),
            data_index: "index".to_string(),
        },
        DrugInColumn {
            title: "进货总额".to_string(),
            data_index: "money".to_string(),
        },
        DrugInColumn {
            title: "药品种类".to_string(),
            data_index: "kind".to_string(),
        },
        DrugInColumn {
            title: "入库时间".to_string(),
            data_index: "in_time".to_string(),
        },
        DrugInColumn {
            title: "采购详情".to_string(),
            data_index: "detail".to_string(),
        },
    ];
    let purchase_columns = vec![
        PurchaseInColumn{ 
            title: "序号".to_string(), 
            data_index: "index".to_string(),
        },
        PurchaseInColumn{ 
            title: "药品名称".to_string(), 
            data_index: "name".to_string() ,
        },
        PurchaseInColumn{ 
            title: "售价".to_string(), 
            data_index: "sale_money".to_string(),
        },
        PurchaseInColumn{ 
            title: "进价".to_string(), 
            data_index: "self_money".to_string() ,
        },
        PurchaseInColumn{ 
            title: "数量".to_string(), 
            data_index: "number".to_string() ,
        },
        PurchaseInColumn{ 
            title: "操作".to_string(), 
            data_index: "detail".to_string(),
        },
    ];
    let on_save = {
        Callback::from(move |_|{
            save_purchase.run();
        })
    };
    let on_cancel = {
        let visible = visible.clone();
        Callback::from(move |_|{
            visible.set(false);
        })
    };
    let open_modal = {
        let visible = visible.clone();
        Callback::from(move |_|{
            visible.set(true);
        })
    };
    let save_one_purchase = {
        let tip_list = purchase_list.clone();
        Callback::from(move |mut sale: PurchaseType| {
            sale.id = Uuid::new_v4();
            let mut tips = (*tip_list).clone();
            tips.push(sale);
            tip_list.set(tips.to_vec());
        })
    };
    let purchase_handler = {
        let purchase_list = purchase_list.clone();
        Callback::from(move|purchase: PurchaseType|{
            let tar = (*purchase_list).clone()
                                                         .into_iter()
                                                         .filter(|da| da.id != purchase.id).collect::<Vec<PurchaseType>>();
            purchase_list.set(tar);
        })
    };
    let click_row = {
        Callback::from(move|purchase|{
            // TODO 点击某一行时需要内容回填 进行修改操作
        })
    };
    {
        let get_drug_in_data = get_drug_in_data.clone();
        use_effect_once(move || {
            get_drug_in_data.run();
            || log::info!("Running clean-up of effect on unmount")
        });
    }
    {
        let drug_info = drug_info.clone();
        let get_drug_in_data = get_drug_in_data.clone();
        use_effect_with_deps(
            move |get_drug_in_data| {
                if let Some(drug_in_data) = &get_drug_in_data.data {
                    drug_info.set(
                        drug_in_data
                            .iter()
                            .map(move |drug_info| DrugInData {
                                per_id: drug_info.per_id.to_string(),
                                money: drug_info.money,
                                kind: drug_info.kind,
                                in_time: drug_info.in_time.to_string()
                            })
                            .collect(),
                    )
                }
                || ()
            },
            get_drug_in_data,
        )
    }
    html! {
        <div class="drug-in-components">
            <nav class="navbar is-transparent">
                <div class="navbar-brand drug-in-components-nav-bar">
                    {"药品入库"}
                </div>
                <div id="navbarExampleTransparentExample" class="navbar-menu">
                    <div class="navbar-end">
                    <div class="navbar-item">
                        <div class="field is-grouped">
                            <button class="button is-link drug-in-out-button is-small" onclick={open_modal} >{"添加入库记录"}</button>
                        </div>
                    </div>
                    </div>
                </div>
            </nav>
            <div class="drug-in-components-content">
                <OwnTableComponent<DrugInData,DrugInColumn> data={(*drug_info).clone()} columns={columns} pagination={false} />
            </div>
            { if *visible {
                html!{
                    <OwnModalComponent
                        name={"添加入库记录".to_string()}
                        save={on_save.clone()}
                        cancel={on_cancel.clone()}
                    >
                        <div class="columns">
                            <div class="column drug-content-left">
                                {"入库药品清单"}
                                <OwnTableComponent<PurchaseType,PurchaseInColumn> data={(*purchase_list).clone()}
                                    columns={purchase_columns} pagination={false} handler={purchase_handler}
                                    row_click={click_row}
                                    />
                            </div>
                            <div class="column is-half">
                                <Form<PurchaseType> form={save_one_purchase}>
                                    <FormItem label={"名称"} name={"name"} require={true} message={"require name!"}>
                                        <Input component_type={&ComponentType::Autofill} auto_options={(*name_options).clone()} 
                                               placeholder={"药品名称".to_string()} />
                                    </FormItem>
                                    <FormItem label={"数量"} name={"number"} require={true} message={"require number!"}>
                                        <Input component_type={&ComponentType::Input} placeholder="进货数量" />
                                    </FormItem>
                                    <FormItem label={"进价"} name={"self_money"} require={true} message={"require number!"}>
                                        <Input component_type={&ComponentType::Input} placeholder="药品进价" />
                                    </FormItem>
                                    <FormItem label={"售价"} name={"sale_money"} require={true} message={"require number!"}>
                                        <Input component_type={&ComponentType::Input} placeholder="药品售价" />
                                    </FormItem>
                                    <FormItem name={"药品入单"}>
                                        <Input component_type={&ComponentType::Submit} />
                                    </FormItem>
                                </Form<PurchaseType>>
                            </div>
                        </div>
                    </OwnModalComponent>
                }
            } else {
                html!{}
            }}
        </div>
    }
}