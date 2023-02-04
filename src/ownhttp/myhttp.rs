use crate::error::{Error, ErrorInfo};
use reqwest::Url;
use serde::{de::DeserializeOwned, Serialize};

// const API_ROOT: String = String::from("localhost:9876");

/// build all kinds of http request: post/get/delete etc.
pub async fn request<B, T>(method: reqwest::Method, url: String, body: B, allow: bool) -> Result<T, Error>
where
    T: DeserializeOwned + 'static + std::fmt::Debug,
    B: Serialize + std::fmt::Debug,
{
    let allow_body = method == reqwest::Method::POST || method == reqwest::Method::PUT || allow;
    let mut fin_url;
    if method == reqwest::Method::GET {
        fin_url = Url::parse_with_params("http://127.0.0.1:9876", &[("lang", "rust"), ("browser", "servo")]).expect("msg").as_str().to_string();
    }else{
        fin_url = format!("{}{}", String::from("http://127.0.0.1:9876"), url);
    }
    let mut builder = reqwest::Client::new()
        .request(method, fin_url)
        .header("Content-Type", "application/json");
    if allow_body {
        builder = builder.json(&body);
    }
    let response = builder.send().await;
    if let Ok(data) = response {
        if data.status().is_success() {
            log::info!("data: {:?}", data);
            let data: Result<T, _> = data.json::<T>().await;
            log::info!("data: {:?}", data);
            if let Ok(data) = data {
                Ok(data)
            } else {
                Err(Error::DeserializeError)
            }
        } else {
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
        Err(Error::RequestError)
    }
}
