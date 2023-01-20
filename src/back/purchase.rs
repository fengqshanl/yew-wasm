use serde::{Deserialize, Serialize};
use crate::pages::purchase::models::PurchaseType;

#[derive(Clone, Debug, PartialEq, Default, Deserialize, Serialize)]
pub struct BKPurchase {
    pub per_id: String,
    pub kind: i32,
    pub money: f32,
    pub in_time: String,
    pub detail: Vec<PurchaseType>
}