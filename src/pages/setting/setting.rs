use std::{
    ops::{Add, Sub},
    rc::Rc,
};

use chrono::{Duration, Utc};
use yew::prelude::*;
use yew_chart::{
    axis::{Axis, Orientation, Scale},
    linear_axis_scale::LinearScale,
    series::{self, Labeller, Series, Tooltipper, Type},
    time_axis_scale::TimeScale,
};

const WIDTH: f32 = 233.0;
const HEIGHT: f32 = 100.0;
const MARGIN: f32 = 20.0;
const TICK_LENGTH: f32 = 10.0;


#[function_component(Setting)]
pub fn setting() -> Html {
    let end_date = Utc::now();
    let start_date = end_date.sub(Duration::days(4));
    let timespan = start_date..end_date;

    let circle_text_labeller = Rc::from(series::circle_text_label("Label")) as Rc<dyn Labeller>;

    let data_set = Rc::new(vec![
        (start_date.timestamp_millis(), 1.0, None),
        (
            start_date.add(Duration::days(1)).timestamp_millis(),
            4.0,
            None,
        ),
        (
            start_date.add(Duration::days(2)).timestamp_millis(),
            3.0,
            None,
        ),
        (
            start_date.add(Duration::days(3)).timestamp_millis(),
            2.0,
            None,
        ),
        (
            start_date.add(Duration::days(4)).timestamp_millis(),
            5.0,
            Some(circle_text_labeller),
        ),
    ]);

    let h_scale = Rc::new(TimeScale::new(timespan, Duration::days(1))) as Rc<dyn Scale<Scalar = _>>;
    let v_scale = Rc::new(LinearScale::new(0.0..5.0, 1.0)) as Rc<dyn Scale<Scalar = _>>;

    let tooltip = Rc::from(series::y_tooltip()) as Rc<dyn Tooltipper<_, _>>;
    html! {
        <div class="setting-components">
            <div class="select">
                <select>
                    <option>
                        {"全部"}
                    </option>
                    <option>
                        {"出账"}
                    </option>
                    <option>
                        {"入账"}
                    </option>
                </select>
            </div>
            <button class="button is-link drug-in-out-button" >{"扫码识别"}</button>
            <div class="setting-line-chart">
                <svg class="chart" viewBox={format!("0 0 {} {}", WIDTH, HEIGHT)} preserveAspectRatio="none">
                    <Series<i64, f32>
                        series_type={Type::Line}
                        name="some-series"
                        data={data_set}
                        horizontal_scale={Rc::clone(&h_scale)}
                        horizontal_scale_step={Duration::days(2).num_milliseconds()}
                        tooltipper={Rc::clone(&tooltip)}
                        vertical_scale={Rc::clone(&v_scale)}
                        x={MARGIN} y={MARGIN} width={WIDTH - (MARGIN * 2.0)} height={HEIGHT - (MARGIN * 2.0)} />

                    <Axis<f32>
                        name="some-y-axis"
                        orientation={Orientation::Left}
                        scale={Rc::clone(&v_scale)}
                        x1={MARGIN} y1={MARGIN} xy2={HEIGHT - MARGIN}
                        tick_len={TICK_LENGTH}
                        title={"Some Y thing".to_string()} />

                    <Axis<i64>
                        name="some-x-axis"
                        orientation={Orientation::Bottom}
                        scale={Rc::clone(&h_scale)}
                        x1={MARGIN} y1={HEIGHT - MARGIN} xy2={WIDTH - MARGIN}
                        tick_len={TICK_LENGTH}
                        title={"Some X thing".to_string()} />

                </svg>
            </div>
        </div>
    }
}
