use crate::ownhttp::myhttp::request;
use yew::prelude::*;
use yew_hooks::prelude::*;

#[function_component(Guest)]
pub fn guest_component() -> Html {
    fn on_reset(e: MouseEvent) {
        // request(reqwest::Method::GET, "/".to_string(), ())
        println!("reset reset reset");
    }

    let article_delete = {
        log::info!("article");
        use_async(async move {
            log::info!("request");
            request::<(), ()>(reqwest::Method::GET, "/".to_string(), ()).await
        })
    };

    println!("test---------------------------------------------------------------------");

    let onclick = {
        log::info!("click");
        Callback::from(move |_| article_delete.run())
    };

    html! {
        <form class="card">
            <div class="card-content">
                <div class="content">
                    <div class="columns is-2">
                        <div class="column">
                            <input class="input" type="text" required={true} name="name" id="name" placeholder="药品名称" />
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
                    <div class="columns is-2">
                        <div class="column">
                            <input class="input" type="text"  name="tag" id="tag" placeholder="商标" />
                        </div>
                    </div>
                    <div class="columns is-2">
                        <div class="column">
                            <input class="input" type="text"  name="name" id="name" placeholder="规格" />
                        </div>
                    </div>
                    <div class="columns is-2">
                        <div class="column">
                            <input class="input" type="text" placeholder="关键字" />
                        </div>
                    </div>
                    <div class="columns is-2">
                        <div class="column">
                            <input class="input" type="text" placeholder="上市时间" />
                        </div>
                    </div>
                    <div class="columns is-2">
                        <div class="column">
                            <input class="input" type="text" placeholder="地址" />
                        </div>
                    </div>
                    <div class="columns is-2">
                        <div class="column">
                            <input class="input" type="text" placeholder="公司名称" />
                        </div>
                    </div>
                    <div class="columns is-2">
                        <div class="column">
                            <input class="input" type="text" placeholder="物品编码" />
                        </div>
                    </div>
                    <div class="columns is-2 save-button-column">
                        <div class="column save-button-column-left">
                            <button class="button is-link" {onclick} >{"保存"}</button>
                            <input type="submit" value="Subscribe!" />
                        </div>
                        <div class="column save-button-column-right">
                            <button type="submit" class="button is-light" onclick={on_reset} >{"重置"}</button>
                        </div>
                    </div>

                </div>
            </div>
        </form>
    }
}
