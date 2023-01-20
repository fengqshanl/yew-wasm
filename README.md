### 要做的事情
1. 药品出入库登记
2. 医药资料查询、知识库
3. 营销统计
4. 病例打印、病人数据存取

#### 药品出入库登记

药品数量增删改查
存量、销量、销售日期、

####  安装与预览

1. rust 环境 详情 [rust官网](https://www.rust-lang.org/)
2. trunk 环境 详情 [yew官网](https://yew.rs/docs/getting-started/introduction)
3. git clone & cd
4. trunk serve

后台服务端在另一个仓库里 [后台仓库](https://github.com/fengqshanl/yew-rust) 
数据库 docker 等配置搞得差不多了就贴上

####  特点

1. 基于 rust 的前后端全栈项目，前端使用 yew 后端使用 rocket 数据库使用 postgres。
2. 自己造了几个函数式轮子，后续会不断添加并慢慢优化，设计理念部分借鉴 react 的 ant-design ，因个人水平有限，以后会不断完善。
3. 属于自做自用的系统，前期需求主要集中在出入库管理、营销登记、数据查询，后续会完善 人员、权限、角色等，并由本地环境走向 互联网 环境。
4. 也属于自身的试水项目，所以后续在编写过程中也会不断添加各种新的技术，以及架构理念。