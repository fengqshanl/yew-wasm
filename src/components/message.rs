pub fn message(message: String) {
    let window = web_sys::window().expect("no global `window` exists");
    let document = window.document().expect("should have a document on window");
    let body = document.body().expect("document should have a body");

    // Manufacture the element we're gonna append
    let article = document.create_element("article").unwrap();
    article.set_class_name("message");
    let div = document.create_element("div").unwrap();
    div.set_class_name("message-header");
    let div2 = document.create_element("p").unwrap();
    div2.set_inner_html("Hello World");
    let button = document.create_element("button").unwrap();
    button.set_class_name("delete");
    button.set_attribute("aria-label", "delete").unwrap();
    div.append_child(&div2).unwrap();
    div.append_child(&button).unwrap();
    article.append_child(&div).unwrap();

    let div = document.create_element("div").unwrap();
    div.set_class_name("message-body");
    div.set_inner_html(&message);
    article.append_child(&div).unwrap();

    body.append_child(&article).expect("message 组件挂载失败");
}
