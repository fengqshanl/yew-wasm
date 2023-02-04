use serde::{Deserialize, Serialize};
use yew::prelude::*;
use sp_yew::uuid::Uuid;
use yew::{html, Properties};
use chrono::prelude::*;
use crate::pages::purchase::models::DrugInData;
use crate::components::{table::ColumnTrait, form::form::FormTypes};

#[derive(Clone, Debug, PartialEq, Properties, Default, Deserialize, Serialize)]
pub struct DrugDetail {
    pub name: String,
    pub number: String,
    pub money: String,
}