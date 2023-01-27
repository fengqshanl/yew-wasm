use crate::components::table::{OwnTableComponent};
use crate::components::form::{form::Form, formitem::FormItem};
use crate::components::input::input::{Input, ComponentType};
use serde::{Deserialize, Serialize};
use yew::prelude::*;
use sp_yew::uuid::Uuid;
use crate::ownhttp::myhttp::request;
use crate::components::modal::OwnModalComponent;
use super::model::{DrugColumn, DrugData, Tip, Sale, TipColumn};
use yew::{function_component, html};
use yew_hooks::use_async;
use yew_hooks::{use_effect_once};

#[function_component(Drug)]
pub fn drug() -> Html {
    let case_info: UseStateHandle<Vec<Sale>> = use_state(Vec::default);
    let visible = use_state(|| false);
    let tip_list: UseStateHandle<Vec<Tip>> = use_state(Vec::default);
    let columns = vec![
        DrugColumn {
            title: "序号".to_string(),
            data_index: "index".to_string(),
        },
        DrugColumn {
            title: "药品名称".to_string(),
            data_index: "name".to_string(),
        },
        DrugColumn {
            title: "数量".to_string(),
            data_index: "number".to_string(),
        },
        DrugColumn {
            title: "单价".to_string(),
            data_index: "money".to_string(),
        },
        DrugColumn {
            title: "总销售".to_string(),
            data_index: "total".to_string(),
        },
        DrugColumn {
            title: "时间".to_string(),
            data_index: "time".to_string(),
        },
    ];
    let drug_info = use_async(async move {
        request::<(), Vec<Sale>>(reqwest::Method::GET, "/sale".to_string(), (), false).await
    });
    {
        let drug_info = drug_info.clone();
        use_effect_once(move || {
            // 查询今日的销售情况
            drug_info.run();
            || log::info!("获取销售列表错误")
        });
    }
    let save_one_tip = {
        let tip_list = tip_list.clone();
        Callback::from(move |mut sale: Tip| {
            let mut tips = (*tip_list).clone();
            sale.id = Uuid::new_v4();
            tips.push(sale);
            tip_list.set(tips.to_vec());
        })
    };
    let save_tip = {
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
    {
        let case_info = case_info.clone();
        let drug_info = drug_info.clone();
        use_effect_with_deps(move |sale_list| {
            if let Some(sale) = &sale_list.data {
                case_info.set(
                    sale
                        .iter()
                        .map(move |sale_info| Sale {
                            sale_id: sale_info.sale_id.to_string(),
                            drug_id: sale_info.drug_id.to_string(),
                            drug_name: sale_info.drug_name.to_string(),
                            sale_number: sale_info.sale_number.to_string(),
                            money: sale_info.money.to_string(),
                            total: sale_info.total.to_string(),
                            sale_time: sale_info.sale_time.to_string(),
                        })
                        .collect(),
                )
            }
            || ()
        },drug_info);
    }
    let on_save = {
        let save_tip = save_tip.clone();
        Callback::from(move|da|{
            save_tip.run();
        })
    };
    let on_cancel = {
        let visible = visible.clone();
        Callback::from(move |da| {
            visible.set(false)
        })
    };
    let add_sale = {
        let visible = visible.clone();
        Callback::from(move|_|{
            visible.set(true);
        })
    };
    let tip_columns = vec![
        TipColumn{ title: "药品名称".to_string(), data_index: "name".to_string() },
        TipColumn{ title: "数量".to_string(), data_index: "number".to_string() },
        TipColumn{ title: "总价".to_string(), data_index: "sale".to_string()},
        TipColumn{ title: "操作".to_string(), data_index: "detail".to_string()},
    ];
    let tip_handler = {
        let tip_list = tip_list.clone();
        Callback::from(move|tip: Tip|{
            let tar = (*tip_list).clone()
                        .into_iter()
                        .filter(|da| da.id != tip.id).collect::<Vec<Tip>>();
            tip_list.set(tar);
        })
    };
    html! {
        <div class="drug-components"> 
            <div class="drug-components-top">
                <div class="drug-buttons">
                    {"搜索往期销售情况"}
                    <input type="date" />
                    <button class="button is-link drug-in-out-button" >{"扫码识别"}</button>
                    <button class="button is-link drug-in-out-button" onclick={add_sale} >{"添加"}</button>
                </div>
                <OwnTableComponent<Sale, DrugColumn> data={(*case_info).clone()} columns={columns} pagination={false} />
            </div>
            { if *visible {
                html!{
                    <OwnModalComponent
                        name={"添加销售记录".to_string()}
                        save={on_save.clone()}
                        cancel={on_cancel.clone()}
                    >
                        <div class="card drug-card-bottom">
                            <div class="card-content">
                                <div class="content drug-card-content">
                                    <div class="columns">
                                        <div class="column drug-content-left">
                                            {"本次交易列表"}
                                            <OwnTableComponent<Tip, TipColumn> data={(*tip_list).clone()} columns={tip_columns} pagination={false} handler={tip_handler} />   
                                        </div>
                                        <div class="column is-half">
                                            <Form<Tip> form={save_one_tip}>
                                                <FormItem label={"药品名称"} name={"name"} require={true} message={"require name!"}>
                                                    <Input component_type={&ComponentType::Autofill} placeholder="药品名称" />
                                                </FormItem>
                                                <FormItem label={"药品数量"} name={"number"} require={true} message={"require number!"}>
                                                    <Input component_type={&ComponentType::Input} placeholder="药品数量" />
                                                </FormItem>
                                                <FormItem label={"药品单价"} name={"money"} require={true} message={"require money!"}>
                                                    <Input component_type={&ComponentType::Input} placeholder="药品单价" />
                                                </FormItem>
                                                <FormItem label={"药品总价"} name={"sale"} require={true} message={"require sale!"}>
                                                    <Input component_type={&ComponentType::Input} placeholder="药品总价" />
                                                </FormItem>
                                                <FormItem  name={"药品入单"}>
                                                    <Input component_type={&ComponentType::Submit} />
                                                </FormItem>
                                            </Form<Tip>>
                                        </div>
                                    </div>
                                </div>
                            </div>                    
                        </div>
                    </ OwnModalComponent>
            }}else{html!{}}}
        </div>
    }
}
