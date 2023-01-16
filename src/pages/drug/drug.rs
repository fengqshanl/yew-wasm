use crate::components::form::form::FormTypes;
use crate::components::table::{ColumnTrait, OwnTableComponent};
use gloo::console::{debug};
use crate::components::form::{form::Form, formitem::FormItem};
use crate::components::input::input::Input;
use serde::{Deserialize, Serialize};
use yew::prelude::*;
use yew::{function_component, html};
use yew_hooks::{use_effect_once};

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize, Copy)]
pub struct DrugData {
    pub index: usize,
    pub name: &'static str,
    pub number: &'static str,
    pub money: &'static str,
}

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct Tip {
    pub name: String,
    pub money: f64,
    pub number: f64,
    pub sale: f64,
}

impl FormTypes for Tip {
    fn try_set(&mut self, name: &str, value: wasm_bindgen::JsValue) -> Result<(), std::io::Error>{
        match name {
            "name" => self.name = value.as_string().expect("name types convert JsValue to String error"),
            "money" => self.money = value.as_string().expect("money convert error").parse::<f64>().unwrap(),
            "number" => self.number = value.as_string().expect("number convert error").parse::<f64>().unwrap(),
            "sale" => self.sale = value.as_string().expect("sale convert error").parse::<f64>().unwrap(),
            _ => log::info!("匹配错误，无法找到对应元素")
        }
        Ok(()) 
    }
}
#[derive(Clone, PartialEq, Debug)]
pub struct DrugColumn {
    title: String,
    data_index: String,
}

impl ColumnTrait<DrugData> for DrugColumn {
    fn render(&self, value: String, _record: &DrugData, index: usize) -> Html {
        match &value as &str {
            "index" => return html! {{index + 1}},
            "name" => {
                return html! {<input class="input" type="text" name="name" id="name" placeholder="药品名称" />}
            }
            "number" => {
                return html! {<input class="input" type="number" name="number" id="number" placeholder="药品数量" />}
            }
            "money" => {
                return html! {<input class="input" type="text" name="money" id="money" placeholder="金额" />}
            }
            _ => html! {},
        }
    }
    fn title(&self) -> String {
        self.title.clone()
    }
    fn data_index(&self) -> String {
        self.data_index.clone()
    }
}

#[function_component(Drug)]
pub fn drug() -> Html {
    let case_info: UseStateHandle<Vec<DrugData>> = use_state(Vec::default);
    let tip_list: UseStateHandle<Vec<Tip>> = use_state(Vec::default);
    // let form_ref: UseStateHandle<Tip> = use_state(Tip::default);
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
            title: "金额".to_string(),
            data_index: "money".to_string(),
        },
    ];
    // let drug_info = use_async(async move {
    //     request::<(), Vec<DrugData>>(reqwest::Method::GET, "/sale".to_string(), ()).await
    // });
    // {
    //     let drug_info = drug_info.clone();
    //     use_effect_once(move || {
    //         // 查询今日的销售情况
    //         // drug_info.run();

    //         || message("获取销售列表错误".to_string())
    //     });
    // }

    let save_one_tip = {
        let tip_list = tip_list.clone();
        Callback::from(move |sale: Tip| {
            let mut tips = (*tip_list).clone();
            tips.push(sale);
            tip_list.set(tips.to_vec());
        })
    };

    {
        let case_info = case_info.clone();
        use_effect_once(move || {
            let case_arr = vec!(DrugData {
                index: 1,
                name: "name",
                number: "number",
                money: "money",
            });
            case_info.set(case_arr.to_vec());
            || debug!("Running clean-up of effect on unmount")
        });
    }
    
    html! {
        <div class="drug-components"> 
            <div class="drug-components-top">
                <div class="drug-buttons">
                    {"搜索往期销售情况"}
                    <input type="date" />
                    <button class="button is-link drug-in-out-button" >{"扫码识别"}</button>
                    <button class="button is-link drug-in-out-button" >{"添加"}</button>
                </div>
                <OwnTableComponent<DrugData, DrugColumn> data={(*case_info).clone()} columns={columns} pagination={false} />
            </div>
            <div class="card drug-card-bottom">
                <header class="card-header">
                    <p class="card-header-title">
                        {"单笔药品清单"}
                    </p>
                    <button class="button is-info is-outlined">
                        {"保存此笔交易"}
                    </button>
                </header>
                <div class="card-content">
                    <div class="content drug-card-content">
                        <div class="columns">
                            <div class="column drug-content-left">
                                {"本次交易列表"}
                                {
                                    for tip_list.clone().iter().map(|c|{
                                        html!{
                                            <div class="drug-sale-list-item">
                                                <div class="drug-sale-list-item-name">
                                                    {c.name.clone()}
                                                </div>
                                                <div class="drug-sale-list-item-money">
                                                    {c.money.clone()}
                                                </div>
                                            </div>
                                        }
                                    })
                                }
                            </div>
                            <div class="column is-three-quarters">
                                <Form<Tip> form={save_one_tip}>
                                    <FormItem label={"药品名称"} name={"name"} require={true} message={"require name!"}>
                                        <Input placeholder="药品名称" />
                                    </FormItem>
                                    <FormItem label={"药品数量"} name={"number"} require={true} message={"require number!"}>
                                        <Input placeholder="药品数量" />
                                    </FormItem>
                                    <FormItem label={"药品单价"} name={"money"} require={true} message={"require money!"}>
                                        <Input placeholder="药品单价" />
                                    </FormItem>
                                    <FormItem label={"药品总价"} name={"sale"} require={true} message={"require sale!"}>
                                        <Input placeholder="药品总价" />
                                    </FormItem>
                                </Form<Tip>>
                                <div class="control">
                                    <button type="submit" class="button is-link">{"添加小计"}</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    }
}
