use reqwest::Method;
use crate::error::{Error, ErrorInfo};
use serde::{de::DeserializeOwned, Serialize};
use yew::UseStateHandle;
use crate::pages::people::table::DrugInfo;

// const API_ROOT: String = String::from("localhost:9876");

/// build all kinds of http request: post/get/delete etc.
pub async fn request<B, T>(method: reqwest::Method, url: String, body: B) -> Result<T, Error>
where
    T: DeserializeOwned + 'static + std::fmt::Debug,
    B: Serialize + std::fmt::Debug,
{
    log::info!("1");
    let allow_body = method == reqwest::Method::POST || method == reqwest::Method::PUT;
    log::info!("2");
    let url = format!("{}{}", String::from("http://127.0.0.1:9876"), url);
    log::info!("3, url:{}", url);
    let mut builder = reqwest::Client::new()
        .request(method, url)
        .header("Content-Type", "application/json");
    log::info!("4");

    if allow_body {
        builder = builder.json(&body);
    }
    log::info!("5");

    let response = builder.send().await;
    log::info!("6: {:?}", response);

    if let Ok(data) = response {
        if data.status().is_success() {
            log::info!("http success:{:?}", data);
            let data: Result<T, _> = data.json::<T>().await;
            log::info!("data json:{:?}", data);
            if let Ok(data) = data {
                log::info!("Response: {:?}", data);
                Ok(data)
            } else {
                Err(Error::DeserializeError)
            }
        } else {
            log::info!("http error");
            match data.status().as_u16() {
                401 => Err(Error::Unauthorized),
                403 => Err(Error::Forbidden),
                404 => Err(Error::NotFound),
                500 => Err(Error::InternalServerError),
                422 => {
                    let data: Result<ErrorInfo, _> = data.json::<ErrorInfo>().await;
                    if let Ok(data) = data {
                        Err(Error::UnprocessableEntity(data))
                    } else {
                        Err(Error::DeserializeError)
                    }
                }
                _ => Err(Error::RequestError),
            }
        }
    } else {
        log::info!("request error");
        log::info!("response: {:?}", response);
        Err(Error::RequestError)
    }
}
