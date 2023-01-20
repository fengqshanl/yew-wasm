use crate::ownhttp::myhttp::request;
use web_sys::HtmlInputElement;
use yew::prelude::*;
use yew_hooks::prelude::*;

use super::people::table::PeopleData;

#[function_component(Guest)]
pub fn guest_component() -> Html {
    let update_info = use_state(PeopleData::default);
    let add_drug = {
        let up = update_info.clone();
        use_async(async move {
            request::<PeopleData, ()>(reqwest::Method::POST, "/drug".to_string(), (*up).clone(), false).await
        })
    };

    let onclick = { Callback::from(move |_| add_drug.run()) };

    let oninput_name = {
        let update_info = update_info.clone();
        Callback::from(move |e: InputEvent| {
            let input: HtmlInputElement = e.target_unchecked_into();
            let mut info = (*update_info).clone();
            info.name = input.value();
            update_info.set(info);
        })
    };

    //     let oninput_drug_number = {
    //         let update_info = update_info.clone();
    //         Callback::from(move |e: InputEvent| {
    //             let input: HtmlInputElement = e.target_unchecked_into();
    //             let mut info = (*update_info).clone();
    //             info.drug_number = input.value();
    //             update_info.set(info);
    //         })
    // };
    //
    // let oninput_ingredient = {
    //             let update_info = update_info.clone();
    //             Callback::from(move |e: InputEvent| {
    //                 let input: HtmlInputElement = e.target_unchecked_into();
    //                 let mut info = (*update_info).clone();
    //                 info.ingredient = input.value();
    //                 update_info.set(info);
    //             })
    //     };
    //
    //     let oninput_character = {
    //             let update_info = update_info.clone();
    //             Callback::from(move |e: InputEvent| {
    //                 let input: HtmlInputElement = e.target_unchecked_into();
    //                 let mut info = (*update_info).clone();
    //                 info.character = input.value();
    //                 update_info.set(info);
    //             })
    //     };
    //
    //     let oninput_major_function = {
    //             let update_info = update_info.clone();
    //             Callback::from(move |e: InputEvent| {
    //                 let input: HtmlInputElement = e.target_unchecked_into();
    //                 let mut info = (*update_info).clone();
    //                 info.major_function = input.value();
    //                 update_info.set(info);
    //             })
    //     };
    //
    //     let oninput_specification = {
    //             let update_info = update_info.clone();
    //             Callback::from(move |e: InputEvent| {
    //                 let input: HtmlInputElement = e.target_unchecked_into();
    //                 let mut info = (*update_info).clone();
    //                 info.specification = input.value();
    //                 update_info.set(info);
    //             })
    //     };

    let oninput_usage_dosage = {
        let update_info = update_info.clone();
        Callback::from(move |e: InputEvent| {
            let input: HtmlInputElement = e.target_unchecked_into();
            let mut info = (*update_info).clone();
            info.usage_dosage = input.value();
            update_info.set(info);
        })
    };

    // let oninput_adverse_reaction = {
    //         let update_info = update_info.clone();
    //         Callback::from(move |e: InputEvent| {
    //             let input: HtmlInputElement = e.target_unchecked_into();
    //             let mut info = (*update_info).clone();
    //             info.adverse_reaction = input.value();
    //             update_info.set(info);
    //         })
    // };
    //
    // let oninput_taboo = {
    //         let update_info = update_info.clone();
    //         Callback::from(move |e: InputEvent| {
    //             let input: HtmlInputElement = e.target_unchecked_into();
    //             let mut info = (*update_info).clone();
    //             info.taboo = input.value();
    //             update_info.set(info);
    //         })
    // };

    let oninput_matters_need_attention = {
        let update_info = update_info.clone();
        Callback::from(move |e: InputEvent| {
            let input: HtmlInputElement = e.target_unchecked_into();
            let mut info = (*update_info).clone();
            info.matters_need_attention = input.value();
            update_info.set(info);
        })
    };

    // let oninput_store_up = {
    //         let update_info = update_info.clone();
    //         Callback::from(move |e: InputEvent| {
    //             let input: HtmlInputElement = e.target_unchecked_into();
    //             let mut info = (*update_info).clone();
    //             info.store_up = input.value();
    //             update_info.set(info);
    //         })
    // };
    //
    // let oninput_expiry_date = {
    //         let update_info = update_info.clone();
    //         Callback::from(move |e: InputEvent| {
    //             let input: HtmlInputElement = e.target_unchecked_into();
    //             let mut info = (*update_info).clone();
    //             if let value = input.value().parse::<i64>().unwrap(){
    //                 info.expiry_date = value;
    //                  update_info.set(info);
    //             }
    //         })
    // };
    //
    // let oninput_produced_time = {
    //         let update_info = update_info.clone();
    //         Callback::from(move |e: InputEvent| {
    //             let input: HtmlInputElement = e.target_unchecked_into();
    //             let mut info = (*update_info).clone();
    //             info.produced_time = input.value();
    //             update_info.set(info);
    //         })
    // };
    //
    // let oninput_approval_number = {
    //         let update_info = update_info.clone();
    //         Callback::from(move |e: InputEvent| {
    //             let input: HtmlInputElement = e.target_unchecked_into();
    //             let mut info = (*update_info).clone();
    //             info.approval_number = input.value();
    //             update_info.set(info);
    //         })
    // };
    //
    // let oninput_manufacturing_enterprise = {
    //         let update_info = update_info.clone();
    //         Callback::from(move |e: InputEvent| {
    //             let input: HtmlInputElement = e.target_unchecked_into();
    //             let mut info = (*update_info).clone();
    //             info.manufacturing_enterprise = input.value();
    //             update_info.set(info);
    //         })
    // };

    html! {
        <form class="card">
            <div class="card-content">
                <div class="content">
                    <div class="columns is-2">
                        <div class="column">
                            <input class="input" type="text" required={true} name="name" id="name" placeholder="药品名称"
                            value={update_info.name.clone()}  oninput={oninput_name} />
                        </div>
                        <div class="column">
                        <div class="file is-primary">
                        <label class="file-label">
                          <input class="file-input" type="file" name="resume" />
                          <span class="file-cta">
                            <span class="file-icon">
                              <i class="fas fa-upload" />
                            </span>
                            <span class="file-label">
                              {"请选择图片"}
                            </span>
                          </span>
                        </label>
                      </div>
                        </div>
                    </div>
                    // <div class="columns is-2">
                    //     <div class="column">
                    //         <input class="input" type="text"  name="drug_number" id="drug_number" placeholder="药品编号"
                    //             value={update_info.drug_number.clone()}  oninput={oninput_drug_number} />
                    //     </div>
                    // </div>
                    // <div class="columns is-2">
                    //     <div class="column">
                    //         <input class="input" type="text"  name="ingredient" id="ingredient" placeholder="成分"
                    //         value={update_info.ingredient.clone()}  oninput={oninput_ingredient}  />
                    //     </div>
                    // </div>
                    // <div class="columns is-2">
                    //     <div class="column">
                    //         <input class="input" type="text"  name="character" id="character" placeholder="性状"
                    //         value={update_info.character.clone()}  oninput={oninput_character}  />
                    //     </div>
                    // </div>
                    // <div class="columns is-2">
                    //     <div class="column">
                    //         <input class="input" type="text"  name="major_function" id="major_function" placeholder="功能主治"
                    //         value={update_info.major_function.clone()}  oninput={oninput_major_function}  />
                    //     </div>
                    // </div>
                    // <div class="columns is-2">
                    //     <div class="column">
                    //         <input class="input" type="text"  name="specification" id="specification" placeholder="规格"
                    //         value={update_info.specification.clone()}  oninput={oninput_specification}  />
                    //     </div>
                    // </div>
                    <div class="columns is-2">
                        <div class="column">
                            <input class="input" type="text"  name="usage_dosage" id="usage_dosage" placeholder="用法用量"
                            value={update_info.usage_dosage.clone()}  oninput={oninput_usage_dosage}  />
                        </div>
                    </div>
                    // <div class="columns is-2">
                    //     <div class="column">
                    //         <input class="input" type="text"  name="adverse_reaction" id="adverse_reaction" placeholder="不良反应"
                    //         value={update_info.adverse_reaction.clone()}  oninput={oninput_adverse_reaction}  />
                    //     </div>
                    // </div>
                    // <div class="columns is-2">
                    //     <div class="column">
                    //         <input class="input" type="text"  name="taboo" id="taboo" placeholder="禁忌"
                    //         value={update_info.taboo.clone()}  oninput={oninput_taboo}  />
                    //     </div>
                    // </div>
                    <div class="columns is-2">
                        <div class="column">
                            <input class="input" type="text"  name="matters_need_attention" id="matters_need_attention" placeholder="注意事项"
                            value={update_info.matters_need_attention.clone()}  oninput={oninput_matters_need_attention}  />
                        </div>
                    </div>
                    // <div class="columns is-2">
                    //     <div class="column">
                    //         <input class="input" type="text"  name="store_up" id="store_up" placeholder="贮藏"
                    //         value={update_info.store_up.clone()}  oninput={oninput_store_up}  />
                    //     </div>
                    // </div>
                    // <div class="columns is-2">
                    //     <div class="column">
                    //         <input class="input" type="text"  name="expiry_date" id="expiry_date" placeholder="有效期"
                    //         value={update_info.expiry_date.clone().to_string()}  oninput={oninput_expiry_date}  />
                    //     </div>
                    // </div>
                    // <div class="columns is-2">
                    //     <div class="column">
                    //         <input class="input" type="text"  name="produced_time" id="produced_time" placeholder="生产日期"
                    //         value={update_info.produced_time.clone()}  oninput={oninput_produced_time}  />
                    //     </div>
                    // </div>
                    // <div class="columns is-2">
                    //     <div class="column">
                    //         <input class="input" type="text"  name="approval_number" id="approval_number" placeholder="批准文号"
                    //         value={update_info.approval_number.clone()}  oninput={oninput_approval_number}  />
                    //     </div>
                    // </div>
                    // <div class="columns is-2">
                    //     <div class="column">
                    //         <input class="input" type="text"  name="manufacturing_enterprise" id="manufacturing_enterprise" placeholder="生产企业"
                    //         value={update_info.manufacturing_enterprise.clone()}  oninput={oninput_manufacturing_enterprise}  />
                    //     </div>
                    // </div>
                    <div class="columns is-2 save-button-column">
                        <div class="column save-button-column-left">
                            <button class="button is-link" {onclick} >{"保存"}</button>
                        </div>
                        <div class="column save-button-column-right">
                            <button type="submit" class="button is-light" >{"重置"}</button>
                        </div>
                    </div>

                </div>
            </div>
        </form>
    }
}
