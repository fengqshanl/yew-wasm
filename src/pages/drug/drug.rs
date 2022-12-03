// use crate::components::message::message;
use crate::components::table::{ColumnTrait, OwnTableComponent};
// use crate::ownhttp::myhttp::request;
use gloo::console::debug;
use serde::{Deserialize, Serialize};
use yew::prelude::*;
use yew::{html};
use yew_hooks::{use_async, use_effect_once};

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct DrugData {
    pub index: usize,
    pub name: String,
    pub number: String,
    pub money: String,
}

#[derive(Clone, PartialEq, Debug)]
pub struct DrugColumn {
    title: String,
    data_index: String,
}

impl ColumnTrait<DrugData> for DrugColumn {
    fn render(&self, value: String, record: &DrugData, index: usize) -> Html {
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
    {
        let case_info = case_info.clone();
        use_effect_once(move || {
            let case_arr = vec!(DrugData {
                index: 1,
                name: "name".to_string(),
                number: "number".to_string(),
                money: "money".to_string(),
            });
            println!("arr list: {:?}",case_arr);
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
                                    <div class="column drug-content-left">{"本次交易列表"}</div>
                                    <div class="column is-three-quarters">
                                        <div class="field">
                                            <label class="label">{"药品名称"}</label>
                                            <div class="control">
                                                <input class="input" type="text" placeholder="药品名称" />
                                            </div>
                                        </div>
                                        <div class="field">
                                            <label class="label">{"药品数量"}</label>
                                            <div class="control">
                                                <input class="input" type="number" placeholder="药品数量"/>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <label class="label">{"药品单价"}</label>
                                            <div class="control">
                                                <input class="input" type="number" placeholder="药品单价"/>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <label class="label">{"药品总价"}</label>
                                            <div class="control">
                                                <input class="input" type="number" placeholder="药品总价"/>
                                            </div>
                                        </div>
                                        <div class="field is-grouped">
                                            <div class="control">
                                                <button class="button is-link">{"添加药品"}</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
            </div>
        </div>
    }
}
