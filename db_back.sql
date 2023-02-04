--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.purchase DROP CONSTRAINT purchase_pk;
ALTER TABLE ONLY public.drug DROP CONSTRAINT drug_approval_number_key;
ALTER TABLE ONLY public.classification DROP CONSTRAINT classification_pkey;
ALTER TABLE ONLY public.classification DROP CONSTRAINT classification_class_id_key;
DROP TABLE public.sale;
DROP TABLE public.purchase_detail4;
DROP TABLE public.purchase_detail3;
DROP TABLE public.purchase_detail2;
DROP TABLE public.purchase_detail1;
DROP TABLE public.purchase_detail0;
DROP TABLE public.purchase;
DROP TABLE public.inventory;
DROP TABLE public.drug;
DROP TABLE public.classification;
DROP TABLE public.broth_song;
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO "user";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: broth_song; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.broth_song (
    broth_id uuid DEFAULT gen_random_uuid() NOT NULL,
    broth_name character varying NOT NULL,
    broth_content text NOT NULL
);


ALTER TABLE public.broth_song OWNER TO "user";

--
-- Name: TABLE broth_song; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE public.broth_song IS '汤头歌';


--
-- Name: COLUMN broth_song.broth_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.broth_song.broth_id IS '汤头歌ID';


--
-- Name: COLUMN broth_song.broth_name; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.broth_song.broth_name IS '汤头歌名称';


--
-- Name: COLUMN broth_song.broth_content; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.broth_song.broth_content IS '汤头歌内容';


--
-- Name: classification; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.classification (
    class_id uuid DEFAULT gen_random_uuid() NOT NULL,
    classf_name character varying NOT NULL
);


ALTER TABLE public.classification OWNER TO "user";

--
-- Name: TABLE classification; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE public.classification IS '药品分类';


--
-- Name: drug; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.drug (
    name character varying NOT NULL,
    drug_id uuid DEFAULT gen_random_uuid() NOT NULL,
    drug_number bigint DEFAULT 0 NOT NULL,
    ingredient character varying,
    "character" character varying,
    major_function character varying,
    specification character varying,
    usage_dosage character varying,
    adverse_reaction character varying,
    taboo character varying,
    matters_need_attention character varying,
    store_up character varying,
    expiry_date bigint,
    produced_time character varying,
    approval_number character varying,
    manufacturing_enterprise character varying,
    class_id uuid NOT NULL,
    a_b_classify character(1),
    serial_number integer,
    money double precision,
    purchase uuid
);


ALTER TABLE public.drug OWNER TO "user";

--
-- Name: COLUMN drug.name; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.name IS '药品名称';


--
-- Name: COLUMN drug.drug_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.drug_id IS 'uuid';


--
-- Name: COLUMN drug.drug_number; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.drug_number IS '药品存量';


--
-- Name: COLUMN drug.ingredient; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.ingredient IS '成份';


--
-- Name: COLUMN drug."character"; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug."character" IS '性状';


--
-- Name: COLUMN drug.major_function; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.major_function IS '主治功能';


--
-- Name: COLUMN drug.specification; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.specification IS '规格';


--
-- Name: COLUMN drug.usage_dosage; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.usage_dosage IS '用法用量';


--
-- Name: COLUMN drug.adverse_reaction; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.adverse_reaction IS '不良反应';


--
-- Name: COLUMN drug.taboo; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.taboo IS '禁忌';


--
-- Name: COLUMN drug.matters_need_attention; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.matters_need_attention IS '注意事项';


--
-- Name: COLUMN drug.store_up; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.store_up IS '贮藏';


--
-- Name: COLUMN drug.expiry_date; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.expiry_date IS '有效期';


--
-- Name: COLUMN drug.produced_time; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.produced_time IS '生产日期';


--
-- Name: COLUMN drug.approval_number; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.approval_number IS '批准文号';


--
-- Name: COLUMN drug.manufacturing_enterprise; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.manufacturing_enterprise IS '生产企业';


--
-- Name: COLUMN drug.class_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.class_id IS '关联的药品分类id';


--
-- Name: COLUMN drug.a_b_classify; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.a_b_classify IS '甲乙分类';


--
-- Name: COLUMN drug.serial_number; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.serial_number IS '溯源码';


--
-- Name: COLUMN drug.money; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.money IS '单价';


--
-- Name: COLUMN drug.purchase; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.drug.purchase IS '所属批次id';


--
-- Name: inventory; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.inventory (
    inv_id uuid DEFAULT gen_random_uuid() NOT NULL,
    drug_id uuid NOT NULL,
    stock integer NOT NULL,
    money integer NOT NULL,
    warning integer NOT NULL,
    drug_name character varying NOT NULL,
    purchase uuid NOT NULL
);


ALTER TABLE public.inventory OWNER TO "user";

--
-- Name: TABLE inventory; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE public.inventory IS '库存表';


--
-- Name: COLUMN inventory.inv_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.inventory.inv_id IS '库存 uuid';


--
-- Name: COLUMN inventory.drug_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.inventory.drug_id IS '药品id';


--
-- Name: COLUMN inventory.stock; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.inventory.stock IS '存量';


--
-- Name: COLUMN inventory.money; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.inventory.money IS '单价';


--
-- Name: COLUMN inventory.warning; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.inventory.warning IS '警告量';


--
-- Name: COLUMN inventory.drug_name; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.inventory.drug_name IS '药品名称';


--
-- Name: COLUMN inventory.purchase; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.inventory.purchase IS '批次编号';


--
-- Name: purchase; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.purchase (
    per_id uuid DEFAULT gen_random_uuid() NOT NULL,
    in_time timestamp without time zone NOT NULL,
    kind integer NOT NULL,
    money real NOT NULL,
    "order" bigint
);


ALTER TABLE public.purchase OWNER TO "user";

--
-- Name: TABLE purchase; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE public.purchase IS '进货表';


--
-- Name: COLUMN purchase.per_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase.per_id IS '进货id';


--
-- Name: COLUMN purchase.in_time; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase.in_time IS '进货时间';


--
-- Name: COLUMN purchase.kind; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase.kind IS '采购的药品种类';


--
-- Name: COLUMN purchase.money; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase.money IS '采购总成本';


--
-- Name: COLUMN purchase."order"; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase."order" IS '检索标识';


--
-- Name: purchase_detail0; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.purchase_detail0 (
    purchase uuid NOT NULL,
    drug_id uuid NOT NULL,
    number real NOT NULL,
    name character varying NOT NULL,
    sale_money real NOT NULL,
    pur_detail_id uuid DEFAULT gen_random_uuid() NOT NULL,
    self_money real NOT NULL
);


ALTER TABLE public.purchase_detail0 OWNER TO "user";

--
-- Name: TABLE purchase_detail0; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE public.purchase_detail0 IS '进货细则';


--
-- Name: COLUMN purchase_detail0.purchase; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail0.purchase IS '进货id';


--
-- Name: COLUMN purchase_detail0.drug_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail0.drug_id IS '关联的药品id';


--
-- Name: COLUMN purchase_detail0.number; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail0.number IS '采购的药品数量';


--
-- Name: COLUMN purchase_detail0.name; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail0.name IS '采购的药品名称';


--
-- Name: COLUMN purchase_detail0.sale_money; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail0.sale_money IS '本次采购关联的各种药品的售价';


--
-- Name: COLUMN purchase_detail0.pur_detail_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail0.pur_detail_id IS '入库标识';


--
-- Name: COLUMN purchase_detail0.self_money; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail0.self_money IS '成本价';


--
-- Name: purchase_detail1; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.purchase_detail1 (
    purchase uuid NOT NULL,
    drug_id uuid NOT NULL,
    number bigint NOT NULL,
    name character varying NOT NULL,
    money double precision NOT NULL,
    sale_money double precision NOT NULL,
    pur_detail_id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.purchase_detail1 OWNER TO "user";

--
-- Name: COLUMN purchase_detail1.purchase; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail1.purchase IS '进货id';


--
-- Name: COLUMN purchase_detail1.drug_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail1.drug_id IS '关联的药品id';


--
-- Name: COLUMN purchase_detail1.number; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail1.number IS '采购的药品数量';


--
-- Name: COLUMN purchase_detail1.name; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail1.name IS '采购的药品名称';


--
-- Name: COLUMN purchase_detail1.money; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail1.money IS '购买的药品的价格';


--
-- Name: COLUMN purchase_detail1.sale_money; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail1.sale_money IS '本次采购关联的各种药品的售价';


--
-- Name: COLUMN purchase_detail1.pur_detail_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail1.pur_detail_id IS '入库标识';


--
-- Name: purchase_detail2; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.purchase_detail2 (
    purchase uuid NOT NULL,
    drug_id uuid NOT NULL,
    number bigint NOT NULL,
    name character varying NOT NULL,
    money double precision NOT NULL,
    sale_money double precision NOT NULL,
    pur_detail_id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.purchase_detail2 OWNER TO "user";

--
-- Name: COLUMN purchase_detail2.purchase; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail2.purchase IS '进货id';


--
-- Name: COLUMN purchase_detail2.drug_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail2.drug_id IS '关联的药品id';


--
-- Name: COLUMN purchase_detail2.number; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail2.number IS '采购的药品数量';


--
-- Name: COLUMN purchase_detail2.name; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail2.name IS '采购的药品名称';


--
-- Name: COLUMN purchase_detail2.money; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail2.money IS '购买的药品的价格';


--
-- Name: COLUMN purchase_detail2.sale_money; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail2.sale_money IS '本次采购关联的各种药品的售价';


--
-- Name: COLUMN purchase_detail2.pur_detail_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail2.pur_detail_id IS '入库标识';


--
-- Name: purchase_detail3; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.purchase_detail3 (
    purchase uuid NOT NULL,
    drug_id uuid NOT NULL,
    number bigint NOT NULL,
    name character varying NOT NULL,
    money double precision NOT NULL,
    sale_money double precision NOT NULL,
    pur_detail_id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.purchase_detail3 OWNER TO "user";

--
-- Name: COLUMN purchase_detail3.purchase; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail3.purchase IS '进货id';


--
-- Name: COLUMN purchase_detail3.drug_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail3.drug_id IS '关联的药品id';


--
-- Name: COLUMN purchase_detail3.number; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail3.number IS '采购的药品数量';


--
-- Name: COLUMN purchase_detail3.name; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail3.name IS '采购的药品名称';


--
-- Name: COLUMN purchase_detail3.money; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail3.money IS '购买的药品的价格';


--
-- Name: COLUMN purchase_detail3.sale_money; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail3.sale_money IS '本次采购关联的各种药品的售价';


--
-- Name: COLUMN purchase_detail3.pur_detail_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail3.pur_detail_id IS '入库标识';


--
-- Name: purchase_detail4; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.purchase_detail4 (
    purchase uuid NOT NULL,
    drug_id uuid NOT NULL,
    number bigint NOT NULL,
    name character varying NOT NULL,
    money double precision NOT NULL,
    sale_money double precision NOT NULL,
    pur_detail_id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.purchase_detail4 OWNER TO "user";

--
-- Name: COLUMN purchase_detail4.purchase; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail4.purchase IS '进货id';


--
-- Name: COLUMN purchase_detail4.drug_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail4.drug_id IS '关联的药品id';


--
-- Name: COLUMN purchase_detail4.number; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail4.number IS '采购的药品数量';


--
-- Name: COLUMN purchase_detail4.name; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail4.name IS '采购的药品名称';


--
-- Name: COLUMN purchase_detail4.money; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail4.money IS '购买的药品的价格';


--
-- Name: COLUMN purchase_detail4.sale_money; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail4.sale_money IS '本次采购关联的各种药品的售价';


--
-- Name: COLUMN purchase_detail4.pur_detail_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.purchase_detail4.pur_detail_id IS '入库标识';


--
-- Name: sale; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.sale (
    sale_id uuid DEFAULT gen_random_uuid() NOT NULL,
    drug_name character varying NOT NULL,
    drug_id uuid NOT NULL,
    sale_number real NOT NULL,
    money real NOT NULL,
    total real NOT NULL,
    sale_time timestamp without time zone NOT NULL
);


ALTER TABLE public.sale OWNER TO "user";

--
-- Name: TABLE sale; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE public.sale IS '销售表';


--
-- Name: COLUMN sale.sale_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.sale.sale_id IS 'uuid';


--
-- Name: COLUMN sale.drug_name; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.sale.drug_name IS '销售的药品名称';


--
-- Name: COLUMN sale.drug_id; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.sale.drug_id IS '药品uuid';


--
-- Name: COLUMN sale.sale_number; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.sale.sale_number IS '销售数量';


--
-- Name: COLUMN sale.money; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.sale.money IS '销售金额';


--
-- Name: COLUMN sale.total; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.sale.total IS '销售总价';


--
-- Name: COLUMN sale.sale_time; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON COLUMN public.sale.sale_time IS '销售时间';


--
-- Data for Name: broth_song; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.broth_song (broth_id, broth_name, broth_content) FROM stdin;
769b66a8-db46-4ae4-91f6-aa313d93fa52	四君子汤	《局方》中和义，参术茯苓甘草比。（人参、白术、茯苓各二钱，甘草一钱。气味中和，故名君子。）益以夏陈半夏、陈皮名六君子汤，祛痰补气阳虚饵。（二陈除痰，四君补气，脾弱阳虚宜之。）除却半夏名异功（散，钱氏。）或加香砂胃寒使。（加木香、砂仁，行气温中
6b972e96-93ef-45ee-af2c-e0fcb48a4b15	升阳益胃	（汤，东垣）参术 ，黄连半夏草陈皮。苓泻防风羌独活，柴胡白芍枣姜随。〔黄芪二两，人参、半夏、炙甘草各一钱，羌活、独活、防风、白芍（炒）各五钱，陈皮四钱，白术、茯苓、泽泻、柴胡各三钱，黄连二钱。每服三钱，加姜枣煎。六君子助阳，补脾除痰；重用黄芪，补气固胃；柴胡、羌、独，除湿升阳；泽泻、茯苓，泻热降浊。加芍药和血敛阴，少佐黄连以退阴火。按∶东垣治疗首重脾胃，而益胃又以升阳为先，故每用补中、上升下渗之药。此方补中有散，发中有收，脾胃诸方多从此仿也。〕
032e7441-c161-4aa4-895d-2711e4088fa5	黄鳖甲	（散，罗谦甫）地骨皮，艽菀参苓柴半知。地黄芍药天冬桂，甘桔桑皮劳热宜。（治虚劳骨蒸，晡热咳嗽，食少盗汗∶黄 、鳖甲、天冬各五钱，地骨、秦艽、茯苓、柴胡各三钱，紫菀、半夏、知母、生地、白芍、桑皮、炙草各二钱半，人参、肉桂、桔梗各钱半。每服一两，加姜煎。鳖甲、天冬、知、芍，补水养阴；参、 、桂、苓、甘草，固卫助阳；桑、桔泻肺热，菀、夏理痰嗽；艽、柴、地骨退热升阳。为表里气血交补之剂。）
b5e85dae-3e23-4954-9902-13d0b8046ff5	秦艽鳖甲	（散，罗谦甫）治风劳，地骨柴胡及青蒿。当归知母乌梅合，止嗽除蒸敛汗高。（鳖甲、地骨皮、柴胡各一两，青蒿五钱，秦艽、当归、知母各五钱，乌梅五钱。治略同前，汗多倍黄。此方加青蒿、乌梅，皆敛汗退蒸之义。）
987fb255-2288-412e-aa4a-19c08d716ff2	秦艽扶羸汤	（汤，《直指》）鳖甲柴，地骨当归紫菀偕。半夏人参兼炙草，肺劳蒸嗽服之谐。（治肺痿骨蒸，劳嗽声嘎，自汗体倦∶柴胡二钱，秦艽、鳖甲、地骨、当归、人参各钱半，柴菀、半夏、甘草炙各一钱，加姜、枣煎。按∶黄 鳖甲散盖本此方，除当归加余药，透肌解热，柴胡、秦艽、干葛为要剂，故骨蒸方中多用之。此方虽表里交治，而以柴胡为君。）
5b683e5a-61c3-4499-842c-773b0a9a3041	紫菀汤	（海藏）中知母贝，参苓五味阿胶偶。再加甘桔治肺伤，咳血吐痰劳热久。（治肺伤气极，劳热咳嗽，吐痰吐血，肺痿肺痈∶紫菀、知母、贝母、阿胶各二钱，人参、茯苓、甘草、桔梗各五分，五味十二粒，一方加莲肉。以保肺止嗽为君，故用阿胶、五味；以清火化痰为臣，故用知母、贝母，佐以参、苓、甘草，扶土以生金；使以桔梗，上浮而利膈。气极，六极之一。）
8ca0dc80-1f4d-4978-adb0-c7edb266d009	百合固金	（汤，赵蕺庵）二地黄，玄参贝母桔甘藏。麦冬芍药当归配，喘咳痰血肺家伤。（生地二钱，熟地三钱，麦冬钱半，贝母、百合、当归、白芍、甘草各一钱，玄参、桔梗各八分。火旺则金伤，故以玄参、二地助肾滋水；麦冬、百合保肺安神，芍药、当归平肝养血，甘、桔、贝母清金化痰，泻以甘草培本，不欲以苦寒伤生发之气也。）
ebc48e94-3bdb-4585-8985-5b9129523d79	补肺阿胶	（散，钱氏）马兜铃，鼠粘甘草杏糯停。肺虚火盛人当服，顺气生津嗽哽宁。（阿胶两半，马兜铃焙、鼠粘子炒、甘草炙、糯米各一两，杏仁七钱。牛蒡利膈滑痰，杏仁降润气嗽。李时珍曰∶马兜铃非取补肺，取其清热降气，肺自安也。其中阿胶、糯米，乃补肺之正药。
4ef8bdc6-7599-440b-b75d-5e9a7b893326	小建中汤	（仲景）芍药多，（即桂枝加芍药汤再加饴糖，名建中。）桂姜甘草大枣和。更加饴糖补中脏，虚劳腹冷服之瘥。（芍药六两，桂枝、生姜各三两，甘草一两，枣十二枚，饴糖一升。）增入黄 名亦尔，〔再加黄 两半，各黄 建中汤（《金匮》）。若除饴糖，则名黄 五物汤，不名建中矣。今人用建中者，绝不用饴糖，何哉？〕表虚身痛效无过。又有建中十四味，阴斑劳损起沉 。（亦有阴证发斑者，淡红隐隐，散见肌表，此寒伏于下，逼其无根之火熏肺而然，若服寒药立毙。）十全大补加附子，麦夏苁蓉仔细哦。（即十全大补汤加附子、麦冬、半夏、肉苁蓉，名十四味建中汤。十四味除茯苓、白术、麦冬、川芎、熟地、肉苁蓉，名八味大建中
e495b2a2-c5ea-481c-a031-e404ebc84c30	益气聪明汤	（东垣）蔓荆，升葛参 黄柏并。并加芍药炙甘草，耳聋目障服之清。（参、 各五钱，蔓荆子、葛根各三钱，黄柏、白芍各二钱，升麻钱半，炙草一钱，每服四钱。人之中气不足，清阳不升，则耳目不聪明。蔓荆、升、葛，升其清气；参、 、甘草，补其中气，而以芍药平肝木，黄柏滋肾水也。）
0c7caeda-7f91-4671-8dc2-cb5a693be6fa	麻黄汤	（仲景）中用桂枝，杏仁甘草四般施。发热恶寒头项痛，伤寒服此汗淋漓。〔麻黄（去节）三两，桂枝二两，杏仁七十枚（去皮尖），甘草（炙）一两。伤寒太阳表证无汗，用此发之。麻黄善发汗，恐其力猛，故以桂枝监之，甘草和之，不令大发也。按∶桂、麻二汤虽治太阳证，而先正每云皆肺药，以伤寒必自皮毛入，而桂、麻又入肺经也。〕
19328d06-abba-492c-9670-e9c8c6a6d803	桂枝汤	（仲景）治太阳（中）风，芍药甘草姜枣同。（桂枝、芍药、生姜各三钱，炙草三两，大枣干二枚。治太阳中风有汗，用此解肌，以和营卫，中犹伤也。仲景《伤寒论》通用。）桂麻相合名各半汤，太阳如疟此为功。（热多寒少，如疟状者，宜之。）
edd92356-8508-4f98-94b2-48a7cf48dc7c	大青龙汤	（仲景）桂麻黄，杏草石膏姜枣藏。（麻黄六两，桂枝、炙草各三两，杏仁四十枚，石膏鸡子大，生姜三两，大枣十二枚。）太阳无汗兼烦躁，（烦为阳、为风，躁为阴、为寒。必太阳证兼烦躁者，方可用之。以杏、草佐麻黄发表，以姜、枣佐桂枝解肌，石膏质重泻火，气轻亦达肌表。义取青龙者，龙兴而云升雨降，郁热赖除，烦躁乃解也。若少阴烦躁，而误服此则逆。）风寒两解此为良。（麻黄汤治寒，桂枝汤治风，大青龙小风寒而两解之。陶节庵曰∶此汤险峻，今人罕用。）
680ea11c-e9b5-4872-8b5c-e9657c6fd86f	小青龙汤	（仲景）治水气，喘咳呕哕渴利慰。（太阳表证未解，心下有水气者用之。或喘或咳，或呕或哕，或渴或利，或短气，或小便秘，皆水气内积所致。）姜桂麻黄芍药甘，细辛半夏兼五味。〔干姜、麻黄、桂枝、芍药（酒炒）、炙草、细辛各二两，半夏、五味子各半升。桂枝解表，使水从汗泄；芍药敛肺，以收喘咳；姜、夏、细辛润肾行水，止渴呕，亦表里分消之意。〕
b559be68-8de7-4d81-9d0c-2c825d40d9a5	葛根汤	（仲景）内麻黄襄，二味加入桂枝汤。（桂枝、芍药、炙草各二两，姜三两，枣十二枚，此桂枝汤也，加葛根四两，麻黄三两。）轻可去实因无汗，（中风表实，故汗不得出。《十剂》曰∶轻可去实，葛根、麻黄之属是也。）有汗加葛无麻黄。（名桂枝加葛根汤，仲景治太阳有汗恶风。）
83b9731f-72b4-4388-b8ef-4f91ba40b50e	升麻葛根汤	钱氏（钱乙），再加芍药甘草是。（升麻三钱，葛根、芍药各二钱，炙草一钱。轻可去实，辛能达表，故用升药发散阳明表邪。阳邪盛则阴气虚，故加芍药敛阴和血。升麻、甘草升阳解毒，故亦治时疫。）阳明发热与头疼，无汗恶寒均堪倚。（及目痛鼻干、不得卧等症。）亦治时疫与阳斑，痘疹已出慎勿使。（恐升散重虚其表也。）
36b6dd60-9f64-4927-a29f-e01034da3225	九味羌活	（汤，张元素）用防风，细辛苍芷与川芎。黄芩生地同甘草，三阳解表益姜葱。（防风、苍术各钱半，白芷、川芎、生地、甘草各一钱，细辛五分，加生姜、葱白煎。）阳虚气弱人禁用，加减临时在变通。（洁古制此汤，以代麻黄、桂枝、青龙、各半等汤。用羌、防、苍、细、芎、芷，各走一经，祛风散寒，为诸路之应兵。加黄芩泄气中之热，生地泄血中之热，甘草以调和诸药。然黄芩、生地，寒滞未可概施，用时宜审。）
acdaabf2-e6bd-46c3-b384-b5f9739dc17f	十神汤	《局方》里葛升麻，陈草芎苏白芷加。麻黄赤芍兼香附，时行（瘟疫）感冒效堪夸。（葛根、升麻、陈皮、甘草、川芎、白芷、紫苏、麻黄、赤芍、香附等分，加姜、葱煎，治风寒两感，头痛发热，无汗恶寒，咳嗽鼻塞。芎、麻、升、葛、苏、芷、香附，辛香利气，发表散寒。加芍药者，敛阴气于发汗之中；加甘草者，和阳气于疏利之队也。吴绶曰∶此方用升麻、葛根，能解阳明瘟疫时气。若太阳伤寒发热，用之则引邪入阳明，传变发斑矣，慎之！）
3f5cd53a-414e-49b1-8612-3f1838563c06	神术散	（《局方》）用甘草苍，细辛 本芎芷羌。（苍术二两，炙草、细辛， 本、白芷、川芎、羌活各一两，每服四钱，生姜、葱白煎。）各走一经祛风湿，（太阴苍术，少阴细辛，厥阴、少阳川芎，太阳羌活、 本，阳明白芷。此方与九味羌活汤意同，加 本，除黄芩、生地、防风，较羌活汤更稳。）风寒泄泻总堪尝。太无神术（散，太无，丹溪之师）即平胃（散），加入菖蒲与藿香。（陈皮为君二钱，苍术、浓朴各一钱，炙草、菖蒲、藿各钱半，治岚瘴瘟疟时气。）海藏神术（散）苍防草，太阳无汗代麻黄。（苍术、防风各二两，炙草一两，用代仲景麻黄汤，治太阳伤寒无汗。）若以白术易苍术，太阳有汗此汤良。（名白术汤，用代桂枝汤，治太阳伤风有汗。二术主治略同，特有止汗、发汗之异。）
13a6cf3f-3b0e-44c8-ace4-687bd5cabca2	麻黄附子细辛汤	（仲景）发表温经两法彰。（麻黄 、细辛各二两，附子一枚炮。麻黄发太阳之汗，附子温少阴之经，细辛为肾经表药，联属其间。）若非表里相兼治，少阴反热曷能康。（少阴证，脉沉属里，当无热，今反发热，为太阴表证未除。）
e923c556-1911-4fca-bc89-3ef7a847f97d	人参败毒	（散，《活人》。毒即热湿也）茯苓草，枳桔柴前羌独芎。薄荷少许姜三片，时行感冒有奇功。（人参、茯苓、枳壳、桔梗、柴胡、羌活、独活、川芎各一两，甘草五钱，每服二两，加薄荷、生姜煎。羌活理太阳游风，独活理少阴伏风，兼能去湿除痛，川芎、柴胡和血升清，枳壳、前胡行痰降气，甘、桔、参、茯清肺强胃，辅正匡邪也。喻嘉言曰∶暑湿热三气门中，推此方为第一。俗医减却人参，曾与他方有别耶？）去参名为败毒散，加入消风（散，见风门）治亦同。（合消风散名消风败毒散。）
a48a900e-6378-4971-b761-fb41a9233d3c	再造散	（节庵）用参 甘，桂附羌防芎芍参。细辛加枣煨姜煎，阳虚无汗法当谙。〔人参、黄、甘草、川芎、白芍（酒炒）、羌活、防风、桂枝、附子（炮）、细辛（煨），姜、大枣煎。以参、 、甘、姜、桂、附大补其阳，助羌、防、芎、细散寒发表。加芍药者，于阳中敛阴，散中有收也。陶节庵曰∶发热头痛，恶寒无汗，服汗剂汗不出者，为阳虚不能作汗，名无汗证。庸医不识，不论时令，遂以麻黄重剂劫取其汗，误人死者多矣。又曰∶人第知参、 能止汗，而不知其能发汗，以在表药队中，则助表药而解散也。〕
509c393b-f759-4c46-bc74-6686d2405d86	麻黄人参芍药汤	（东垣）桂枝五味麦冬襄。归 甘草汗兼补，虚人外感服之康。〔麻黄、白芍、黄 、当归、甘草（炙）各一钱，人参、麦冬各三分，桂枝五分，五味五粒。东垣治一人内蕴虚热，外感大寒而吐血，法仲景麻黄汤，加补剂制此方，一服而愈。原解曰∶麻黄散外寒，桂枝补表虚，黄 实表益卫，人参益气固表，麦冬、五味保肺气，甘草补脾，芍药安太阳，当归和血养血。〕
463eeb49-0cde-492b-ba3d-c49a6f6e9f70	神白散	（《卫生家宝》）用白芷甘，姜葱淡豉与相参。（白芷一两，甘草五钱，淡豉五十粒，姜三片，葱白三寸，煎服取汗。）一切风寒皆可服，疏表祛邪效可推。（必须得汗，服乃有效。）豉一升，名葱豉汤。）用代麻黄汤功不惭。伤寒初觉头痛身热，便
c74fcefa-5cd2-4636-b33e-51426a5ef2d0	大承气汤	（仲景）用芒硝，枳实大黄浓朴饶。〔大黄四两（酒洗），芒硝三合，浓朴八两，枳实五枚〕。救阴泻热功偏擅，急下阳明有数条。（大黄治大实，芒硝治大燥大坚，二味治无形血药；浓朴治大满，枳实治痞，二味治有形气药。热毒传入阳明胃府，痞、满、燥、实、坚全见，杂证、三焦实热，并须以此下之。胃为水谷之海，土为万物之母。四旁有病，皆能传入胃府，则不复传他经矣。陶节庵曰∶伤寒热邪传里，须看热气浅深用药，大承气最紧，小承气次之，调
d16556bb-6446-497f-97f8-a1587cf63ead	小承气汤	（仲景）朴实黄，〔大黄四两，浓朴二两（姜炒），枳实三枚（麸炒）。〕谵狂痞硬上焦强。（热在上焦则满，在中焦则硬，胃有燥粪则谵语，不用芒硝者，恐伤下焦真阴也。）益以羌活名三化（汤，）中风闭实可消详。（用承气治二便，加羌活治风，中风体实者可偶用。然涉虚者多，不可轻投。）
f5230dbc-a760-483e-b540-665aa7df128b	调胃承气	（汤，仲景）硝黄草，〔大黄（酒浸）、芒硝各一两，甘草（炙）五钱。〕甘缓微和将胃保。（用甘草甘以缓之，微和胃气，勿令大泄下。）不用朴实伤上焦，（不用浓朴、枳实，恐伤上焦氤氲之气也。）中焦燥实服之好。
3ba300e8-f261-468d-8ad9-5a96d630a11b	保和（丸）	神曲与山楂，苓夏陈翘菔（音卜）子加。曲糊为丸麦（芽）汤下，亦可方中用麦芽。〔山楂（去核）三两，神曲、茯苓、半夏各一两，菔子（微炒）、连翘各五钱。山楂消肉食，麦芽消谷食，神曲消食解酒，菔子下气，制曲、茯苓渗湿，连翘散结，陈、夏健脾化痰。此内伤而气末病者，故但以和平之品消而化之，不必攻补也。〕太安丸内加白术（二两，）中消兼补效堪夸。
901c11d6-17e9-4a01-8bc7-67dcbfa4fba7	木香槟榔	（丸，张子和）青陈皮，枳壳柏连棱术随。大黄黑丑兼香附，芒硝水丸量服之。一切实积能推荡，泻痢食疟用咸宜。〔木香、槟榔、青皮（醋炒）、陈皮、枳壳（炒）、黄柏（酒炒）、棱、莪术（并醋煮），各五钱，大黄（酒浸）一两，香附、牵牛各二两，芒硝，水丸，量虚实服。木香、香附、青、陈、枳壳利气宽肠，黑牵牛、槟榔下气尤速，气行则无痞满后重之患矣。连、柏燥实清热，棱、莪行气破血，硝、黄去血中伏热，并为推坚峻品。湿热积滞去，则二便调而三焦通泰矣。盖宿垢不净，清阳终不得升，亦通因通用之意也。〕
84f7824c-cffe-4f35-b818-79886b8641de	枳实导滞	（丸，东垣）首大黄，芩连曲术茯苓襄。泽泻蒸饼糊丸服，湿热积滞力能攘。〔大黄一两，枳实（麸炒）、黄芩（酒炒）、黄连（酒炒）、神曲（炒）各五钱，白术（土炒）、茯苓三钱，泽泻二钱，蒸饼糊丸，量虚实服之。大黄、枳实荡热去积，芩、连佐之以清热，苓、泻佐之以利湿，神曲佐之以消食。又恐苦寒力峻，故加白术补土固中。〕若还后重兼气滞，木香导滞（丸）加槟榔。
b0d58545-11aa-4ecd-b4e8-2601b6d4c792	温脾	（汤，《千金》）参附与干姜，甘草当归硝大黄。寒热并行治寒积，脐腹绞结痛非常。人参、附子、甘草、芒硝各一两，大黄五两，当归、干姜各三两，煎服，日三。本方除当归、芒硝，亦名温脾汤，治久痢赤白、脾胃冷、实不消。硝、黄以荡其积，姜、附以祛其寒，参、草、当归以保其血气。按∶古人方中，多有硝、黄、柏、连与姜、茱、桂、附寒热并用者，亦有参、术、硝、黄补泻并用者，亦有大黄、麻黄汗下兼行者，令人罕识其旨。姑录此方，以见治疗之妙不一端也。）
d3a70d4c-696a-472d-bd60-5dbd6be5d582	蜜煎导法通大便，	（仲景用蜜熬如饴，捻作挺子，掺皂角末，乘热纳谷道中，或掺盐。）或将（猪）胆汁灌肛中。（用猪胆汁醋和，以竹管插肛门中，将汁灌入，顷当大便，名猪胆汁导法，仲景）。不欲苦寒伤胃府，阳明无热勿轻攻。（胃府无热而便秘者，为汗多津液不足，不宜用承气妄攻。此仲景心法，后人罕识，故录三方于攻下之末。）
bfeb2db7-aae8-441b-be3f-83d70e2307d3	涌吐之剂（二首、附方六）	汗、吐、下、和，乃治疗之四法。经曰∶在上者涌之，其高者因而越之，故古人治病，用吐法者最多。朱丹溪曰∶吐中就有发散之义。张子和曰∶诸汗法古方多有之，惟以吐发汗者，世罕知之。今人医疗，惟用汗、下、和，而吐法绝置不用，可见时师之缺略。特补涌吐一门，方药虽简，而法不可废也。若丹溪用四物、四君引吐，又治小便不通，亦用吐法，是又在用者之圆神矣。
c20d70ab-acfe-4d17-bf3a-014f2628df72	瓜蒂散	（仲景）中赤小豆，（甜瓜蒂炒黄与赤小豆为末，热水或 水调，量虚实服之。）或入藜芦郁金凑。（张子和去赤豆加藜芦、防风，一方去赤豆加郁金、韭汁，俱名三圣散。鹅翎探吐，并治风痰。）此吐实热与风痰，（瓜蒂吐实热，藜芦吐风痰。）虚者参芦（散）一味勾。（虚人痰壅不得服瓜蒂者，以参芦代之，或加竹沥。）若吐虚烦栀豉汤，（仲景，栀子十四枚，豉四合，治伤寒后虚烦。）剧痰乌附尖方透。（丹溪治许白云，用瓜蒂、栀子、苦参、藜芦，屡吐不透，后以浆水和乌附尖服，始得大吐。）古人尚有烧盐方，一切积滞功能奏。（烧盐热汤调服，以指探吐，治霍乱、宿食、冷痛等症。《千金》曰∶凡病宜吐，大胜用药。）
81778383-9dfa-40b7-80a6-68912b0d9d05	稀涎	（散，严用和）皂角白矾斑，〔皂角四挺（去皮弦炙），白矾一两，为末，每服五分。白矾酸苦涌泄，能软顽痰；皂角辛咸通窍，专制风木。此专门之兵也，国中风时宜用之。〕或益藜芦微吐间。风中痰升人眩仆，当先服此通其关。（令微吐稀涎，续进他药。）通关散用细辛皂（角，为末，）吹鼻得嚏保生还。（卒中者用此吹鼻，有嚏者可治，无嚏者为肺气已绝。）
132ebfb9-5904-427a-af39-75c8f18b5954	小柴胡汤	（仲景）和解供，半夏人参甘草从。更用黄芩加姜枣，少阳百病此为宗。（柴胡八两，半夏半升，人参、甘草、黄芩、生姜各三两，大枣十二枚。治一切往来寒热，胸满胁痛，心烦喜呕，口苦耳聋，咳渴悸利，半表半里之证。属少阳经者，但见一症即是，不必悉具。胆府清净，无出无入，经在半表半里，法宜和解。柴胡升阳达表，黄芩退热和阴，半夏祛痰散逆，参、草辅正补中，使邪不得复传入里也。）
b847abb3-5074-4387-ac63-b326409123f2	四逆散	（仲景）里用柴胡，芍药枳实甘草须。（柴胡、芍药炒、枳实麸炒、甘草炙等分。）此是阳邪成厥逆，（阳邪入里，四肢逆而不温。）敛阴泄热平剂扶。（芍药敛阴，枳实泄热，甘草和逆，柴胡散邪，用平剂以和解之。）
90acbbe0-fa77-4dd9-86c5-4b45d64f4dc4	黄连汤	（仲景）内用干姜，半夏人参甘草藏。更用桂枝兼大枣，寒热平调呕痛忘。〔黄连（炒）、干姜（炮）、甘草、桂枝各三两，人参二两，半夏半升，大枣十二枚，治胸中有热而欲呕，胃中有寒而作痛，或丹田有热，胸中有寒者，仲景亦用此汤。按∶此汤与小柴胡汤同意，以桂枝易柴胡，黄连易黄芩，以干姜易生姜，余药同，皆是和解之意。但小柴胡汤属少阳药，此汤
76382767-71eb-4472-8b4b-cce625381bda	黄芩汤	（仲景）用甘芍并，二阳合利加枣烹。（治太阳、少阳合病，下利∶黄芩三两，芍药、甘草各二两，枣十二枚。阳邪入里，故以黄芩彻其热，甘草、大枣和其太阴。）此方遂为治痢祖，后人加味或更名。（利，泻泄也；痢，滞下也。仲景本治伤寒下利，《机要》用此治痢，更名黄芩芍药汤；洁古治痢加木香、槟榔、大黄、黄连、当归、官桂，名芍药汤。）再加生姜与半夏，（名黄芩加生姜半夏汤，仲景。）前症兼呕此能平。单用芍药与甘草（炙，等分，名芍药甘草汤，仲景。）散逆止痛能和营。（虞天民曰∶白芍不惟治血虚，兼能行气。腹痛者，营气不
fb9fd790-0b25-431d-a85e-98243d42b25f	逍遥散	（《局方》）用当归芍，柴芩术草加姜薄。〔柴胡、当归（酒拌）、白芍（酒炒）、白术（土炒、茯苓各一钱，甘草（炙）五分，加煨姜、薄荷煎。〕散郁除蒸功最奇，（肝虚则血病，归、芍养血平肝；木盛则土衰，术、草和中补土，柴胡升阳散热，茯苓利湿宁心，生姜暖胃祛痰，薄木郁则火郁，火郁则土郁，土郁则金郁，金郁则水郁。五行相因，自然之理也。余以一方治木郁，而诸郁皆解，逍遥散是也。）调经八味丹栀着。（加丹皮、栀子各八味逍遥散，治肝伤血少。）
26e3eb14-c320-41e8-bf44-50bd73177a7e	藿香正气	（散，《局方》）大腹苏，甘桔陈苓术朴俱。夏曲白芷加姜枣，感伤（外感内伤）岚瘴并能驱。〔藿香、大腹皮、紫苏、茯苓、白芷各三两，陈皮、白术（土炒）、浓朴（姜汁炒）、半夏曲、桔梗各二两，甘草一两，每服五钱，加姜、枣煎。藿香理气和中，辟恶止呕；苏、芷、桔脾去湿，以辅正气。正气通畅，则邪逆自除矣。〕
07b3ad73-0522-48ad-be45-669938426b15	六和	（汤，《局方》）藿朴杏砂呈，半夏木瓜赤茯苓。术参扁豆同甘草，姜枣煎之六气平。（藿香、浓朴、砂仁、半夏、木瓜、赤茯苓、白术、人参、扁豆、甘草，加姜、枣煎，能御风、寒、暑、湿、燥、火六气，故名曰六和。藿、朴、杏、砂理气化食，参、术、陈、夏补正匡脾，豆、瓜祛暑，赤茯行水。大抵以理气健脾为主，脾胃既强，则诸邪不能干矣。）或益香藿或苏叶，伤寒伤暑用须明。（伤寒加苏叶，伤暑加香藿。）
4896e577-b908-47cd-8a98-ea92ad36571c	清脾饮	（严用和）用青朴柴，芩夏甘苓白术偕。更加草果姜煎服，热多阳疟此方佳。〔青皮、浓朴（醋炒）、柴胡、黄芩、半夏（姜制）、甘草（炙）、茯苓、白术（土炒）、草果（煨），加姜煎。疟不止，加酒炒常山一钱，乌梅二个；大渴，加麦冬、知母。疟疾，一名脾寒，盖因脾胃受伤者居多。此方乃加减小柴胡汤从温脾诸方而一变也。青、柴平肝破滞，朴、夏平胃祛痰，芩、苓清热利湿，术、草补脾调中，草果散太阴积寒，除痰截疟。〕
83e75679-3f8d-4d07-9ce8-a7bc3773a31d	痛泻要方	（刘草窗）陈皮芍，防风白术煎丸酌。〔白术（土炒）三两，白芍（酒炒）四两，陈皮（炒）半两，防风一两，或煎或丸，久泻加升麻。〕补土泻木理肝脾，（陈皮理气补脾，防、芍泻木益土）。若作食伤医便错。（吴鹤皋曰∶伤食腹痛，得泻便减，今泻而痛不减，故责之土败木贼也
18b96781-f982-4c53-8a7a-37fdb0963b74	大柴胡汤	（仲景）用大黄，枳实苓夏白芍将。煎加姜枣表兼里，妙法内攻并外攘。（柴胡八两，大表证未除，里证又急者。柴胡解表，大黄、枳实攻里，黄芩清热，芍药敛阴、半夏和胃止呕，姜、枣调和营卫。按∶本方、次方治少阳阳明，后方治太阴阳明，为不同。）柴胡（加）芒硝义亦尔，（小柴胡汤加芒硝六两，仲景。）仍有桂枝（加）大黄汤。（仲景桂枝汤内加大黄一两，芍药三两，治太阳误下，转属太阴，大实痛者。）
d4708d74-ce83-4998-9ec5-51f4f7fcdc6d	防风通圣	（散，河间）大黄硝，荆芥麻黄栀芍翘。甘桔芎归膏滑石，薄荷芩术力偏饶。表里交攻阳热盛，外科疡毒总能消。〔大黄（酒蒸）、芒硝、防风、荆芥、麻黄、黑栀、白芍（炒）、连翘、川芎、当归、薄荷、白术各五钱，桔梗、黄芩、石膏各一两，甘草二两，滑石三两，加姜、葱煎。荆、防、麻黄、薄荷发汗而散热搜风，栀子、滑石、硝、黄利便而降火行水，芩、桔、石膏清肺泻胃，川芎、归、芍养血补肝，连翘散气聚血凝，甘、术能补中燥湿，故能汗不伤表，下不伤里也。〕
d5bf8dbe-5250-4a48-bcea-3778774bd39c	五积散	（《局方》）治五般积，（寒积、食积、气积、血积、痰积。）麻黄苍芷芍归芎。枳桔桂姜甘茯朴，陈皮半夏加姜葱。（当归、川芎、白芍、茯苓、桔梗各八分，苍术、白芷、浓朴、陈皮各六分，枳壳七分，麻黄、半夏各四分，肉桂、干姜、甘草各三分，重表者用桂枝。桂、麻解表散寒，甘、芍和里止痛，苍、朴平胃，陈、夏行痰，芎、归养血，茯苓利水，姜、芷祛寒湿，枳、桔利膈肠。一方统治多病，唯善用者，变而通之。）除桂枳陈余略炒，（三味生用，余药微炒，名熟料五积散。）熟料尤增温散功。温中解表祛寒湿，散痞调经用各充。（陶节庵曰∶凡阴证伤寒，脉浮沉无力，均当服之，亦可加附子。）
c86f2891-5bf2-4cb3-9586-8524d3737b21	三黄石膏	（汤）芩柏连，栀子麻黄豆豉全。姜枣细茶兼热服，（寒因热用。）表里三焦热盛宣。（石膏两半，黄芩、黄连、黄柏各七钱，栀子三十个，麻黄、淡豉各二合，每服一两，姜三片、枣二枚、茶一撮煎，热服。治表里三焦大热，谵狂斑衄，身目俱黄。黄芩泻上焦，黄连泻中焦，黄柏泻下焦，栀子通泻三焦之火以清里，麻黄、淡豉散寒发汗而解表，石膏体重能泻肺胃之火，气轻亦能解肌也。）
31c6cabe-e6cb-47ee-8647-93c7d235ed23	葛根黄芩黄连汤	（仲景），甘草四般治二阳。（治太阳桂枝证，医误下之，邪入阳明，协热下利，脉促喘而汗出者，葛根八两，炙草、黄芩各二两，黄连三两。）解表清里兼和胃，喘汗自利保平康。（成无己曰∶邪在里，宜见阴脉，促为阳盛，知表未解也。病有汗出而喘者，为邪气外甚，今喘而汗出，为里热气逆，与此方散表邪、清里热。脉数而止曰促，用葛根者，专主阳明之表。）
7ac956cd-d405-49b7-b935-17af5913a18f	参苏饮	（元戎）内用陈皮，枳壳前胡半夏宜。干葛木香甘桔茯，内伤外感此方推。〔人参、紫苏、前胡、半夏（姜制）、干葛、茯苓各七钱半，陈皮、枳壳（麸炒）、桔梗、木香、甘草各二钱，每服二钱，加姜、枣煎。治外感内伤，发热头痛，呕逆咳嗽，痰眩风泻。外感重者，去枣加葱白。苏、葛、前胡解表，参、芩、甘草补中，陈皮、木香行气破滞，半夏、枳、桔利膈祛痰。〕参前若去芎柴入，饮号芎苏治不瘥。（去人参、前胡，加川芎、柴胡，名芎苏饮，不服参者宜之。）香苏饮（《局方》）仅陈皮草，感伤内外亦堪施。〔香附（炒）、紫苏各二钱，陈皮（
c5b02ddd-5753-4e9d-8f2e-a3987b5e1e5d	茵陈丸	（《外台》）用大黄硝，鳖甲常山巴豆邀。杏仁栀豉蜜丸服，汗吐下兼三法超。时气毒疠及疟痢，一丸两服量病调。〔茵陈、芒硝、鳖甲（炙）、栀子各二两，大黄五两，常山、杏仁（炒）各三两，巴豆一两（去心皮炒），豉五合，蜜丸梧子大。每服一丸，或吐或利，不应再服。一丸不应，以热汤投之。栀子、淡豉，栀豉汤也，合常山可以涌吐，合杏仁可以解肌。大黄、芒硝，承气汤也，可以荡热去实，合茵陈可以利湿退黄，加巴豆大热以祛脏腑积寒，加鳖甲滋阴以退血分寒热。此方备汗、吐、下三法，虽云劫剂，实是佳方。〕
4c9d4fcd-06cb-49ba-82ee-bb58b5227fe4	大羌活汤	即九味，己独知连白术暨。（即九味羌活汤加防己、知母、独活、黄连、生地、川芎、知母各一两，余药各三钱，每服五钱。）散热培阴表里和，伤寒两感瘥堪慰。（两感伤寒，一曰太阳与少阴俱病，二曰阳明与太阴俱病，三曰少阳与厥阴俱病。阴阳表里，同时俱病，欲汗则有里证，欲下则有表证。经曰∶其两感于寒者，必死。仲景无治法，洁古为制此方，间有生者。羌、独、苍、防、细辛，以散寒发表；芩、连、防己、知母、芎、地，以清里培阴；白术、甘草，以固中和表里。）
8886056f-cc89-4794-bc89-1df3c9c38184	平胃散	（《局方》）是苍术朴，陈皮甘草四般药。〔苍术（泔浸）二钱，浓朴（姜汁炒）、陈皮（去白）、甘草（炙）各一钱，姜、枣煎。〕除湿散满驱瘴岚，调胃诸方从此扩。（苍术燥湿强脾，浓朴散满平胃，陈皮利气行痰，甘草和中补土，泄中有补也。）或合二陈（名平陈汤，治痰）或五苓，（名胃苓汤，治泄。）硝黄麦曲均堪着。（加麦芽、神曲消食，加大黄、芒硝荡积。）若合小柴（胡）名柴平（汤），煎加姜枣能除疟。又不换金正气散，即是此方加夏藿（半夏、藿香。）
a5e0cde1-0dff-41b3-a001-f7f63f7072e6	健脾（丸）	参术与陈皮，枳实山楂麦 （芽）随。曲糊作丸米饮下，消补兼行胃弱宜。〔人参、白术（土炒）各二两，陈皮、麦芽（炒）各一两，山楂两半，枳实（麸炒）三两。陈皮、枳实理气化积，山楂消肉食，曲、麦消谷食，人参、白术益气强脾。〕枳术丸（洁古）亦消兼补，〔白术（土炒）〕、〔枳实（麸炒）〕等分。荷叶烧饭上升奇。（荷叶包陈米饭，煨干为丸，引胃气及少
ff2519e7-3fbd-4ec4-9350-93829533bc3b	参苓白术	（散）扁豆陈，山药甘莲砂薏仁。（数药利气强脾。）桔梗上浮（载药上行）兼保肺，（恐燥药上僭。）枣汤调服益脾神。〔人参、茯苓、白术（土炒）、陈皮、山药、甘草（炙）各一斤，扁豆（炒）十二两，莲肉（炒）、砂仁、苡仁（炒）、桔梗各半斤，共为末，每服二钱，枣汤或米饮调下。〕
117bd8db-50bf-4e65-bb46-95b9ad3b3272	枳实消痞	（丸，东垣）四君全，麦芽夏曲朴姜连。蒸饼糊丸消积满，清热破结补虚痊。〔炒）、黄连（姜汁炒）各五钱，人参、白术（土炒）、半夏曲、浓朴（姜汁炒）、茯苓各三钱，甘草（炙）、干姜各二钱。黄连、枳实治痞君药，麦、夏、姜、朴温胃散满，参、术、苓、甘燥湿补脾，使气足脾运，痞乃化也。〕
6af12e66-1a04-4524-8a36-3572c6892eba	鳖甲饮子	（《严氏》）治疟母，（久疟不愈，中有结癖。）甘草 术芍芎偶。草果槟榔浓朴增，乌梅姜枣同煎服。〔鳖甲（醋炙）、黄 、白术（土炒）、甘草、陈皮、川芎、白芍（酒炒）、草果（面煨）、槟榔、浓朴等分，姜三片，枣二枚，乌梅少许煎。鳖甲属阴入肺，退热散结为君，甘、陈、 、术助阳补气，川芎、白芍养血和阴，草果温胃，槟榔破积，浓朴散满，甘草和中，乌梅酸敛，姜、枣和营卫。〕
5c1c83f1-704f-4dfd-9006-e08bf6feedea	葛花解酲	（汤）香砂仁，二苓参术蔻青陈。神曲干姜兼泽泻，温中利湿酒伤珍。〔葛花、砂仁、豆蔻各一钱，木香一分，茯苓、人参、白术（炒）、青皮、陈皮各四分，神曲（炒）、干姜、猪苓、泽泻各五分，专治酒积及吐泻痞塞。砂、蔻、神曲皆能解酒，青皮、木香、干姜行气温中，葛花引湿热从肌肉出，苓、泻引湿热从小便出，益以参、术固其中气也。〕
13e762be-bd88-4974-aca1-6a813ed6a5e1	补中益气	（汤，东垣） 术陈，升柴参草当归身。〔黄 （蜜炙）钱半，人参、甘草（炙）各一钱，白术（土炒）、陈皮（留白）、归身各五分，升麻、柴胡各三分，加姜、枣煎。表虚者，升麻用蜜水炒用。东垣曰∶升、柴味薄性阳，能引脾胃清气行于阴道，以资春气之和；又引参、 、甘草上行，充实腠理，使卫外为固。凡补脾胃之气，多以升阳补气名之者，此也。〕虚劳内伤功独擅，亦治阳虚外感因。（虚人感冒，不在发散者，此方可以代之，或加辛散药。）木香苍术易归术，调中益气畅脾神。（除当归、白术，加木香、苍术，名调中益气汤。前方加白芍、五味子，发中有收，亦名调中益气汤，俱李东垣方。）
3ade12b6-6578-4ea7-b78a-f175b066aa1c	乌药顺气	（汤，严用和）芎芷姜，橘红枳桔及麻黄。僵蚕炙草姜煎服，中气厥逆此方详。（厥逆痰塞，口噤脉伏，身温为中风，身冷为中气。中风多痰涎，中气无痰涎，以此为辨。许学士云∶中气之证，不可作中风治。喻嘉言曰∶中风证多挟中气。乌药、橘红各二钱，川芎、白芷、枳壳、桔梗、麻黄各一钱，僵蚕（去丝嘴炒）、炮姜、炙草各五分，加姜、枣煎。麻、梗、芎、芷发汗散寒，以顺表气；乌、姜、陈、枳行气祛痰，以顺里气。加僵蚕清化消风，甘草协和诸药。古云气顺则风散，风邪卒中，当先治标也。）
b8410b92-0f8f-44e6-810c-b90736c60a37	越鞠丸	（丹溪）治六般郁，气血痰火湿食因。（此六郁也。）芎苍香附兼栀曲，气畅郁舒痛闷伸。（吴鹤皋曰∶香附开气郁，苍术燥湿郁，抚芎调血郁，栀子清火郁，神曲消食郁，各等分，面糊为丸。又湿郁加茯苓、白芷，火郁加青黛，痰郁加半夏、栝蒌、海石，血郁加桃仁、红花，气郁加木香、槟榔，食郁加麦芽、山楂，挟寒加吴茱萸。）又六郁汤苍芎附，甘苓橘半栀砂仁。（苍术、川芎、香附、甘草、茯苓、橘红、半夏、栀子、砂仁。此前方加味，兼治痰郁，看六郁中之重者为君，余药听加减用之。）
32833fe1-37a9-4f72-a63f-d74f94946682	苏子降气	（汤，《局方》）橘半归，前胡桂朴草姜根据。下虚上盛痰嗽喘，亦有加参贵合机。〔苏子、橘红、半夏、当归、前胡、浓朴（姜汁炒）各一钱，肉桂、炙甘草各五分，加姜煎。一方无桂加沉香。苏子、前胡、橘红、半夏降气行痰，气行则痰行也。数药兼能发表，加当归和血，甘草缓中。下虚上盛，故用官桂引火归元。如气虚亦有加人参、五味者。〕
ab6e999e-8980-417c-9d9d-a67abb0a1728	四七汤	（《三因》）理七情气，（七气，寒、热、喜、怒、忧、愁、恚也，亦名七气汤。）半夏浓朴茯苓苏。〔半夏（姜汁炒）五钱，浓朴（姜汁炒）三钱，茯苓四钱，紫苏二钱。郁虽由乎气，亦多挟湿挟痰，故以半夏、浓朴除痰散满，茯苓、苏叶利湿宽中。湿去痰行，郁自除矣。〕姜枣煎之舒郁结，痰涎呕痛尽能纾。又有局方名四七汤，参桂夏草妙更殊。（人参、官桂、半夏各一钱，甘草五分，加姜煎。人参补气，官桂平肝，姜制半夏祛痰，甘草和中，并不用利气之药。汤名四七者，以四味治人之七情也。）
6588e1fd-91d8-4e07-b4f4-53a8d8812440	四磨	（汤，《严氏》）亦治七情侵，人参乌药及槟沉。（人参、乌药、槟榔、沉香等分。气逆，故以乌药、槟榔降而顺之。加参者，恐伤其气也。）浓磨煎服调逆气，实者枳壳易人参。去参加入木香枳（实），五磨饮子白酒斟。（白酒磨服，治暴怒卒死，名气厥。）
99ba872f-ef16-4b63-af33-2089d7f69cc3	代赭旋复汤	仲景用人参，半夏甘姜大枣临。重以镇逆咸软痞，痞硬（音硬）噫（音爱）气（赭石一两，参二两，旋复、甘草各三两，半夏半升，生姜五两，枣十二枚。旋复之咸以软坚，赭石之重以镇逆，姜、夏之辛以散虚痞，参、甘、大枣之甘以补胃弱。）
9549ee23-e74d-4f71-8081-aa09498b3b42	绀珠正气天香散	香附干姜苏叶陈。乌药舒郁兼除痛，气行血活自经匀。（香附八钱，乌药二钱，陈皮、苏叶各一钱，干姜五分，每服五、六钱。乌、陈入气分而理气，香、苏入血分而利气，干姜兼入气血，用辛温以顺气平肝，气行则血行经自调，而痛自止矣。）
a6d2d08e-5786-4ee9-aaa8-ce2348b20e55	橘皮竹茹	（汤）治呕呃，参甘半夏陈皮麦。赤茯再加姜枣煎，方由金匮此加辟。（《金匮》方，橘皮、竹茹各二升，人参一两，甘草五两，生姜半斤，枣三十枚，名橘皮竹茹汤，治哕逆，即呃逆也。后人加半夏、麦冬、赤茯苓、枇杷叶。呃逆由胃火上冲，肝胆之火助之，肺金之气不得下降也。竹茹、麦冬、枇杷叶清肺和胃而降气，肺金清则肝木自平矣。二陈降痰逆，赤茯苓泻心火，生姜呕家圣药，久病虚赢，故以参、甘、大枣扶其胃气。）
4f7ad96e-f773-4fad-84a0-ae27a9a671d1	丁香柿蒂	（汤，《严氏》）人参姜，呃逆因寒中气戕。（丁香、柿蒂各二钱，人参一钱，。）济生香蒂仅二味，（亦名丁香柿蒂汤，加姜煎。古方单用柿蒂，取其苦温降气；《济生》加丁香、生姜，取其开郁散痰；加参者，扶其胃气也。）或加竹橘用皆良。（加竹茹、橘红，各丁香柿蒂竹茹汤，治同。）
dcf1a3e8-2999-4c97-9b51-81b7136c7c0b	定喘	（汤）白果与麻黄，款冬半夏白皮桑。苏杏黄芩兼甘草，肺寒膈热哮喘尝。〔白果三十枚（炒黄），麻黄、半夏（姜制）、款冬各三钱，桑皮（蜜炙）、苏子各二钱，杏仁、黄芩各钱半，甘草一钱，加姜煎。麻黄、杏仁、桑皮、甘草散表寒而清肺气，款冬温润，白果收涩，定喘而
8858ae74-ad57-4805-9c37-1b5c7b911eed	四物	（汤）地芍与归芎，血家百病此方通。〔当归（酒洗）、生地各三钱，白芍二钱，川芎钱半。当归辛、苦、甘温，入心脾，生血为君；生地甘寒，入心肾，滋血为臣；芍药酸寒，入肝脾，敛阴为佐；川芎辛温，通行血中之气为使。〕八珍（汤）合入四君子（参、术、苓、草，）气血双疗功独崇。（四君补气，四物补血。）再加黄 与肉桂，（加黄 助阳固卫，加肉桂引火归元。）十全大补（汤）补方雄。（补方之首。）十全除却 地草，（除生地、黄 、甘草。）加粟（米百粒）煎之名胃风（汤。张元素治风客肠胃，飧泄完谷及 牙闭。）
7d444b2e-a419-4b0d-95cc-5a62d4d1ae54	人参养荣	（汤）即十全（汤，见前四物下。）除却川芎五味联。陈皮远志加姜枣，脾肺气血补方先。（即十全大补汤除川芎，加五味、陈皮、远志。薛立斋曰∶气血两虚，变生诸症，不问脉病，但服此汤，诸症悉退。）
956caded-c7db-4fe6-9ace-47c1b6851e3e	归脾汤	（《济生》）用术参 ，归草茯神远志随。酸枣木香龙眼肉，煎加姜枣益心脾。怔忡健忘俱可却，肠风崩漏总能医。〔人参、白术（土炒）、茯神、枣仁、龙眼肉各二钱，黄 （蜜炙）钱半，当归（酒洗）、远志各一钱，木香、甘草（炙）各八分。血不归脾则妄行，参、 、草、术之甘温以补脾，志、茯、枣仁、龙眼之甘温、酸苦以补心，当归养血，木香调气，气壮则自能摄血矣。〕
2028d484-581e-45d6-919a-ec90fffb8e63	养心汤	用草 参，二茯芎归柏子等。夏曲远志兼桂味，再加酸枣总宁心。〔黄 （蜜炙）、茯苓、茯神、川芎、当归（酒洗）、半夏曲各一两，甘草（炙）一钱，人参、柏子仁（去油）、五味子、远志、枣仁（炒）各二钱半，每服五钱。参、 补心气，芎、归养心血，二茯、柏仁、远志泄心热而宁心神，五味、枣仁收心气散越，半夏去扰心之痰涎，甘草补土以培心子，赤桂引药以达心经。〕
2b6faa90-f8f1-40b6-8bfe-e3fa170297f5	当归四逆	（汤，仲景）桂枝芍，细辛甘草木通着。再加大枣治阴厥，脉细阳虚由血弱。〔当归、桂枝、芍药、细辛各二两，甘草（炙）、木通各二两，枣二十五枚。成氏曰∶通脉者，必先入心补血，当归之苦以助心血。心苦缓，急食酸以收之，芍药之酸，以收心气。肝苦急，急食甘以缓之，甘草、大枣、木通以缓阴血。〕内有久寒加姜茱，（素有久寒者，加吴茱萸二升、生姜半斤酒煎，名四逆加吴茱萸生姜汤，仲景。）发表温中通脉络。（桂枝散表风，吴茱萸、生姜、细辛温经，当归、木通通经复脉。）不用附子及干姜，助阳过剂阴反灼。（姜附四逆在于回阳，当归四逆在于益血复脉，故虽内有久寒，止加生姜、吴茱，不用干姜、附子，恐反灼其阴也。）
de992565-45cd-4bb5-9059-be4842362f31	桃仁承气	（汤、仲景）五般奇，甘草硝黄并桂枝。〔桃仁五十枚（去皮尖研），大黄四两，芒硝、桂枝、甘草各二两。硝、黄、甘草，调胃承气汤也。热甚搏血，故加桃仁润燥缓肝，表证未除，故加桂枝调经解表。〕热结膀胱小腹胀，如狂蓄血最相宜。（小腹胀而小便自利，知为血蓄下焦，蓄血发热故如狂。）
ccd8c4c2-2d74-41dd-b771-6f8a61567981	犀角地黄	（汤）芍药丹，（生地半两，白芍一两，丹皮、犀角二钱半。每服五钱。）血升胃热火邪干。斑黄阳毒皆堪治，（犀角大寒，解胃热而清心火；芍药酸寒，和阴血而散肝火；丹皮苦寒，泻血中之伏火；生地大寒，凉血而滋水，以期平诸经之僭逆也。）或益柴芩总伐肝。（因怒致血者，加柴胡、黄芩。）
0e2bbdf8-cf06-4e58-8792-3f94fdecc950	咳血方	（丹溪）中诃子收，栝蒌海石山栀投。青黛蜜丸口噙化，咳嗽痰血服之瘳。〔诃子（煨取肉）、栝蒌仁（去油）、海石（去砂）、栀子（炒黑）、青黛（水飞）等分，蜜丸，嗽甚加杏仁。青黛清肝泻火，栀子清肺凉心，栝蒌润燥滑痰，海石软坚止嗽，诃子敛肺定喘。不用血药者，火退而自止也。〕
8adbb5df-246b-46ba-9cec-af10b52731c5	东垣秦艽白术丸	归尾桃仁枳实攒。地榆泽泻皂角子，糊丸血痔便艰难。（大肠燥结故便难。）秦艽、白术、归尾（酒洗）、桃仁（研）、地榆各一两，枳实（麸炒）、泽泻、皂角子（烧存性）各五钱，糊丸。归尾、桃仁以活血，秦艽、皂子以润燥，枳实泄胃热，泽泻泻湿邪，地榆以破血止血，白术以燥湿益气。仍有苍术防风剂，润血疏风燥湿安。（本方除白术、当归、地榆，加苍术、防风、大黄、黄柏、槟榔，名秦艽苍术汤。除枳实、皂角、地榆，加防风、升麻、柴胡、陈皮、炙甘草、黄柏、大黄、红花，名秦艽除风汤，治并同。）
62b5d611-fc97-40c6-8277-19e69306b959	槐花散	用治肠风，侧柏（叶）黑荆（芥）枳壳充。为末等分米饮下，宽肠凉血逐风功。（槐花、柏叶凉血，枳实宽肠，荆芥理血疏风。）
30bbb438-d25a-4a19-9779-268a61bb1169	小蓟饮子藕	（节）蒲黄（炒黑），木通滑石生地襄。归草（当归、甘草）黑栀（子）淡竹叶，（等分煎服。）血淋热结服之良。（小蓟、藕节散瘀血，生地凉血，蒲黄止血，木通泻心火达小肠，栀子散郁火
63216c1a-b4f4-45dd-938f-a2639e077a62	四生丸	（《济生》）用三般叶，侧柏艾荷生地协。（侧柏叶、艾叶、荷叶、生地黄。）等分生捣如泥煎，血热妄行止衄惬。（侧柏、生地补阴凉血，荷叶散瘀血、留好血，艾叶生者性温，理气止血。）
20cd7fb0-d988-40b9-bfb7-4f167897f43a	复元活血汤	（《发明》）柴胡，花粉当归山甲俱。桃仁红花大黄草，损伤瘀血酒煎祛。〔柴胡五钱，花粉、当归、穿山甲（炮）、甘草、红花各二钱，桃仁五十枚（去皮尖研），大黄一两。每服一两，酒煎。血积必干，两胁属肝胆经，故以柴胡引用为君，以当归活血脉，以甘草缓其急，以大黄、桃仁、红花、山甲、花粉破血润血。〕
8038d6ad-ccc2-4e1f-9f23-16bd93a5e552	理中汤	（仲景）主理中乡，（仲景曰∶理中者，理中焦。）甘草人参术黑姜。〔白术（土炒）二两，人参、干姜（炮）、甘草（炙）各一两，治太阴厥逆，自利不渴，脉沉无力。人参补气益脾为君，白术健脾燥湿为臣，甘草和中补土为佐，干姜温胃散寒为使。〕呕利腹痛阴寒盛，或加附子总扶阳。（名附子理中汤。）
25cc03db-11a7-4a82-b293-9343a6b62d09	小续命汤	（《千金》）桂附芎，麻黄参芍杏防风。黄芩防己兼甘草，六经风中此方通。〔通治六经中风， 斜不遂，语言蹇涩及刚柔二痉，亦治厥阴风湿∶防风一钱二分，桂枝、麻黄、人参、白芍（酒炒）、杏仁（炒研）、川芎（酒洗）、黄芩（酒洗）、防己、甘草（炙）各八分，附子四分，姜、枣煎。麻黄、杏仁，麻黄汤也，治寒；桂枝、芍药，桂枝汤也，治风。参、草补气，芎、芍养血，防风治风淫，防己治湿淫，附子治寒淫，黄芩治热淫，故为治风套剂。刘宗浓曰∶此方无分经络，不辨寒热，虚实虽多，亦奚以为？昂按∶此方今人罕用，然古今风方，多从此方损益为治。〕
ec9aac21-aefc-468c-b5db-a3b687fb3e87	大秦艽汤	（《机要》）羌活防，芎芷辛芩二地黄。石膏归芍芩甘术，风邪散见可通尝。〔邪散见，不拘一经者∶秦艽、石膏各三两，羌活、独活、防风、川芎、白芷、黄芩（酒炒）、生地（酒洗）、熟地、当归（酒洗）、茯苓、白芍（酒炒）、甘草（炙）、白术（土炒）各一两，细辛五钱，每服一两。刘宗浓曰∶秦艽汤愈风，虽有补血之药，而行经散风之剂居其大半，将何以养血而益筋骨也？昂按∶治风有三法，解表、攻里、行中道也。国中必挟外感，故用风药解表散寒，而用血药、气药调里，活血降火也。〕
c738f30d-d6bb-4fa0-ace7-c817d70202d3	三生饮	（《局方》）用乌附星，三皆生用木香听。〔生南星一两，生川乌、附子（去皮）各五钱，木香二两。〕加参对半扶元气，（每服一两，加参一两。）卒中痰迷服此灵。（乌、附燥热，行经逐寒；南星辛热，除痰散风。重用人参以扶元气，少佐木香以行逆气。《医贯》曰∶此行经散痰之剂，斩关擒王之将，宜急用之。凡中风口开为心绝，手撒为脾绝，眼合为肝绝，遗尿为肾绝，鼻鼾为肺绝。吐沫直视，发直头摇，面赤如朱，汗缀如珠者，皆不治。若服此汤，间有生者。）星香散亦治卒中，体肥不渴邪在经。（中脏、中腑者重，中经者稍轻。胆星八钱散痰，木香二行气，为末服。《易简》和姜煎服，名星香散。）
fcc1a486-97e3-4ba4-a985-389c5859dde6	地黄饮子	（河间）山茱斛，麦味菖蒲远志茯。苁蓉桂附巴戟天，少入薄荷姜枣服。〔熟地、山萸肉、石斛、麦冬、五味、石菖蒲、远志、茯苓、内苁蓉、官桂、附子（炮）、巴戟等分，每服五钱，加薄荷少许煎。〕 厥风痱能治之，（凡口噤身冷为 厥，四肢不收为风痱。）火归水中水生木。（熟地以滋根本之肾，桂、附、苁蓉、巴戟以返真元之火，山茱、石斛平胃温肝，志、苓、菖蒲补心通肾，麦、味保肺以滋水源，水火既交，风火自息矣。刘河间曰∶中风，非外中之风，良由将息失宜，心火暴甚，肾水虚衰，不能制之，故卒倒无知也。治宜和脏腑，通经络，便是治风。《医贯》曰∶痰涎上涌者，水不归元也；面赤烦渴者，火不归元也。惟桂、附能引火归元，火归水中，则水能生木，木不生风，而风自息矣。）
637aa707-3a22-4aaa-b85e-d0b0ca130061	独活汤	（丹溪）中羌独防，芎归辛桂参夏菖。茯神远志白薇草， （音炽纵）昏愦力能匡。〔羌活、独活、防风、当归、川芎、细辛、桂心、人参、半夏、菖蒲、茯神、远志、白薇各五钱，甘草（炙）二钱半，每服一两，加姜、枣煎。肝属风而主筋，故 为肝邪。二活、防风治风，辛、桂温经，半夏除痰，芎、归和血，血活则风散也。肝移热于心则昏愦。人参补心气，菖蒲开心窍，茯神、远志安心，白薇退热止风。风静火熄，血活神宁， 自已矣。〕
a36a959d-d3d7-408d-bca0-fb2d3cc80ec3	顺风匀气	（散）术乌沉，白芷天麻苏叶参。木瓜甘草青皮合， 僻偏枯口舌 。〔口眼 斜，偏枯不遂，皆由宗气不能周于一身。白术二钱，乌药钱半，天麻、人参各五分，苏叶、白芷、木瓜、青皮、甘草（炙）、沉香（磨）各三分，加姜煎。天麻、苏、芷以疏风气，乌药、青、沉以行黄柏苍术 天南星，桂枝（横行）防己（下行）及威灵（仙，上下行。）桃仁红花龙胆草（下行，）羌芷（上行）川芎（上下行）神曲停痛风湿热与痰血，上中下通用之听。〔黄柏（酒炒）、苍术（泔浸）、南星、姜、枣各二两，防己、桃仁（去皮尖）、胆草、白芷、川芎、神曲（炒）各一两，桂枝、威灵仙、红花、羌活各二钱半，面糊丸，名上中下通用痛风方，丹溪。黄柏清热，苍术燥湿，龙胆泻火，防己利水，四者治湿与热。桃仁、红花活血祛瘀，川芎血中气药，南星散风燥痰，四者活血与痰。羌活去百节风，白芷去头面风，桂枝、威灵仙去臂胫风，四者所以治风。和神曲者，消中焦陈积之气也。症不兼者，加减为治。
e7fcad69-7f56-4e5f-8f54-dee914ece331	独活寄生	（汤，《千金》）艽防辛，芎归地芍桂苓均。杜仲牛膝人参草，冷风顽痹屈能伸。〔独活、桑寄生、秦艽、防风、细辛、川芎（酒洗）、当归（酒洗）、白芍（酒炒）、熟地、桂心、茯苓、杜仲（姜汁炒断丝）、牛膝、人参、甘草等分，每服四钱。〕若去寄生加 续（黄 、续断，）汤名三痹古方珍。（名三痹汤，治风寒湿三痹。喻嘉言曰∶此方用参 四物一派补药，加艽、
00394d21-4ff0-439f-8981-e4d84d6b28e3	消风散	内羌防荆芎朴参苓陈草并。僵蚕蝉蜕藿香入，为末茶调或酒行，头痛目昏项背急，顽麻瘾疹服之清。〔人参、防风、茯苓、川芎、羌活、僵蚕（炒）、蝉蜕、藿香各二两，荆芥、浓朴（姜汁炒）、陈皮（去白）、甘草（炙）各五钱，每服三钱，茶调下。疮癣，酒下。羌、防、芎、荆，治头目、项背之风，僵蚕、蝉蜕散咽膈、皮肤之风，藿香、浓朴去恶散满，参、苓
cc5bc506-59b4-4c28-bc32-883850bd0a13	川芎茶调散	（《局方》）荆防，辛芷薄荷甘草羌。目昏鼻塞风攻上，正偏头痛悉平康。〔薄荷三钱，川芎、荆芥各四钱，防风钱半，细辛一钱，羌活、白芷、甘草（炙）各二钱，为末，每服三钱，茶调下。羌活治太阳头痛，白芷治阳明头痛，川芎治少阳、厥阴头痛，细辛治少阴头痛，防风为风药卒徒，薄荷、荆芥散风热而清头目。以风热攻上，宜于升散，巅顶之上，惟风药可到也。加甘草以缓中，加茶调以清降。〕方内若加僵蚕菊，菊花茶调（散）用亦臧。（菊花清头目，僵蚕去风疾。）
50bded45-71f1-4cbc-a020-572f22aa1eef	青空	（膏，东垣）芎草柴芩连，羌防升之入顶巅。为末茶调如膏服，正偏头痛一时蠲。〔川芎五钱，甘草（炙）一两半，柴胡七钱，黄芩（酒炒）、黄连（酒炒）、羌活、防风各一两，每服三钱。风寒湿热上攻头脑则痛，头两傍属少阳，偏头痛属少阳相火。芩、连苦寒，以羌、防、芎、
c94abe94-c08c-423b-b1cd-a0faf6bc57ed	人参荆芥散	（《妇宝》）熟地，防风柴枳芎归比。酸枣鳖羚桂术甘，血风劳作风虚治。〔血脉空疏，乃感风邪，寒热盗汗，久渐成劳。人参、荆芥、熟地、柴胡、枳壳、枣仁（炒）、鳖甲（童便炙）、羚羊角、白术各五分，防风、甘草（炙）、当归、川芎、桂心各三分，加姜煎。荆、防、柴、羚以疏风平木，地黄、鳖甲以退热滋阴，草、枣仁以敛汗补虚，除烦进食。〕
be63b17c-bbd7-4cc9-ba73-2d4bf20bb667	真武汤	（仲景）壮肾中阳，茯苓术芍附生姜。〔附子一枚（炮），白术二两（炒），茯苓、白芍（炒）、生姜各三两。〕少阴腹痛有水气，悸眩 惕保安康。（中有水气，故心悸头眩；汗多亡阳，故肉 筋惕。 ，音纯，动貌。苓、术补土利水，以疗悸眩；姜、附回阳益火，以逐虚寒；芍药敛阴和营，以止腹痛。真武，北方水神。肾中火足，水乃归元。此方补肾之阳，壮火而利水，故名。）
0d2950ea-01d0-4635-8d52-ef7e687bb2ed	四逆汤	（仲景）中姜附草，三阴厥逆太阳沉。〔附子一枚（生用），干姜一两，炙甘草二两，冷服。专治三阴厥逆，太阳初证脉沉亦用之。〕或益姜葱参芍桔，通阳复脉力能任（音仁。面赤，格阳于上也，加葱白通阳；腹痛，加芍药和阴；咽痛，加桔梗利咽；利止、脉不出，加人参补气复脉；呕吐，加生姜以散逆气。）
0269e3bf-2be2-402f-af89-e0c36ab6dfda	白通加	（人）尿猪胆汁（汤，仲景。尿，音鸟，去声，小便也。俗读平声，非。）干姜附子兼葱白。〔附子一枚（炮），干姜一两，葱白四茎，此白通汤也。葱白以通阳气，姜、附子以散阴寒，加人尿五合，猪胆汁一合。〕热因寒用妙义深，阴盛格阳厥无脉。（阴寒内甚，格阳于外，故厥逆无脉，纯与热药，则寒气格拒，不得达入，故于热剂中加尿汁，寒药以为引用，使得入阴而回阳也。）
f0163ef9-92e1-432a-b6bd-fb6141b46afb	吴茱萸汤	（仲景）人参枣，重用生姜温胃好。阳明寒呕（太阳热呕忌用）少阴（下）利，厥阴头痛皆能保。〔吴茱萸一升（炮），人参三两，生姜六两，枣十二枚。姜、茱、参、枣，补土散寒。茱萸辛热，能入厥阴，治肝气上逆而致呕利腹痛。〕
ad97b293-0f2e-4932-aed0-ae2926aebca2	益元	（汤，《活人》）艾附与干姜，麦味知连参草将。（附子（炮）、艾叶、干姜、麦冬、五味子、知母、黄连、人参、甘草。艾叶辛热，能回阳。）姜枣葱煎入童便（冷服），内寒外热名戴阳（症。此阴盛格阳之症，面赤身热，不烦而躁，但饮水不入口，为外热内寒。此汤姜、附加知、连，与白通加人尿、猪胆汁同意，乃热因寒药为引用也。按∶内热曰烦，为有根之火；外热曰躁，为无根之火。故但躁不烦及先躁后烦，皆不治。）
6d4ee896-8dc2-4551-83e1-7931cf0a8559	回阳救急	（汤，节庵曰即四逆汤）用六君，桂附干姜五味群。（附子炮、干姜、肉桂、人分，白术、茯苓各一钱，半夏、陈皮各七分，甘草三分，五味九粒，姜煎。）加麝三厘或（猪）胆汁，三阴寒厥见重勋。（姜、桂、附子祛其阴。六君温补，助其阳气。五味、人参以生其脉。加麝香者，以通其窍；加胆汁者，热因寒用也。）
9dda716d-18fb-47cd-a11e-2fdbcebf8d38	四神	（丸）故纸吴茱萸，肉蔻五味四般须。大枣百枚姜八两，〔破故纸四两（酒浸炒），吴茱萸一两（盐水炒），肉豆蔻三两（面里煨），五味子三两（炒），枣、生姜同煎。枣烂即去姜，捣枣肉为丸，临卧盐汤下，若早服，不能敌一夜之阴寒也。〕五更肾泻火衰扶。（由肾命火衰，不能生脾土，故五更将交阳分，阳虚不能键闭而泄泻，不可专责脾胃也。破故纸辛温，能补相火，以通君火，火盛乃能生土；肉豆蔻暖胃固阳，吴茱萸燥脾去湿，五味子补肾涩精，生姜温中，大枣补土，亦以防水也。）
783b89c9-0b21-489f-8a3e-5008c4d96f9a	浓朴温中	（汤）陈草苓，干姜草蔻木香停。煎服加姜治腹痛，虚寒胀满用皆灵。（浓朴、陈皮各一钱，甘草、茯苓、草豆蔻、木香各五分，干姜三分，加姜煎。干姜、草蔻辛热以散其寒，陈皮、广木香辛温以调其气，浓朴辛温以散满，茯苓甘淡以利湿，甘草甘平以和中。寒散气行，痛胀自已矣。）
cae5bce4-a1f5-4c15-ac78-3664495953e3	寒疝痛用导气汤	川楝茴香与木香。吴茱煎以长流水，散寒通气利小肠。（疝，亦名小肠气。川楝四钱，木香二钱，茴香二钱，吴茱萸一钱，汤泡同煎。川楝苦寒，入肝舒筋，能导小肠、膀胱之热从小水下行，为治疝君药。茴香暖胃散寒，吴茱萸温肝燥湿，木香行三焦通气。）
dd404734-6818-471a-b325-bd588270c4ec	疝气方	（丹溪）用荔枝核，栀子山楂枳壳益。（荔枝双结，状类睾丸，能入肚肾，辟寒散滞。栀子泻火利水，枳壳行气破症，山楂散瘀 积。睾，音皋，肾子也。）再入吴茱暖厥阴，（疝乃厥阴肝邪，非肾病，以肝脉络阴器也。）长流水煎疝痛释。（等分，或为末，空心服。）
5a037219-8150-403e-804f-e9a840caea07	橘核丸	（《济生》）中川楝桂，朴实延胡藻带昆。桃仁二木酒糊合， 疝痛顽盐酒吞。（橘核、川酒糊为丸，盐汤或酒下。橘核、木香能入厥阴气分而行气，桃仁、延胡索能入厥阴气分而活血，川楝、木通能导小肠、膀胱之湿，官桂能祛肝肾之寒，枳实、浓朴行结水而破宿血，昆布、藻、带寒行水而咸软坚。）
1390bb2f-3c61-4df8-8247-790aac4b379f	三物香薷	（饮，《局方》）豆朴先，（香薷辛温香散，能入脾肺，发越阳气以散蒸热。浓朴除湿散满，扁豆清暑和脾。）若云热盛加黄连。（名黄连香薷饮，《活人》治中暑热盛，口渴心烦。）或加苓草（茯苓、甘草）名五物（香薷饮），利湿祛暑木瓜宣。（加木瓜名六味香薷饮，木瓜、茯苓治湿盛。）再加参 与除术，兼治内伤十味全。（六味加参、 、陈皮、白术，名十味香薷饮。）二香（散）合入香苏饮，（五味香薷饮合香苏饮。香附、紫苏、陈皮、苍术，名二香散，治外感内伤，身寒腹胀。）仍有藿薷（汤）香葛（汤）传。（三物香薷饮合藿香正气散，名藿薷汤，治伏暑吐泻；三物香薷饮加葛根，名香葛汤，治暑月伤风。）
587b3189-882d-4fcb-b2d1-d00d48564245	清暑益气	（汤，东垣）参草 ，当归香味青陈皮。曲柏葛根苍白术，升麻泽泻枣姜随。〔人参、黄、甘草（炙）、当归（酒洗）、麦冬、五味、青皮（麸炒）、陈皮（留白）、神曲（炒）、黄柏（酒炒）、葛根、苍术、白术（土炒）、升麻、泽泻，加姜、枣煎。热伤气，参、 补气敛汗；湿伤脾，二术燥湿强脾。火旺则金病而水衰，故用麦、味保肺生津，黄柏泻火滋水，青皮理气而破滞，当归养血而和阴，曲、草和中而消食，升、葛以升清，泽泻以降浊也。〕
732b8443-01eb-47f6-85c9-eb872fdf1976	缩脾饮	用清暑气，砂仁草果乌梅暨。甘草葛根扁豆加，吐泻烦渴温脾胃。（砂仁、草果（乌梅、甘草（炙）各四两，扁豆（炒研）、葛根各二两。暑必兼温，而湿属脾土，故用砂仁、草果利气温脾，扁豆解暑渗湿，葛根升阳生津，甘草补土和中，乌梅清热止渴。）古人治暑多用温，（如香薷饮、大顺散之类。）暑为阴证此所谓。（洁古曰∶中热为阳证，为有余；中暑为阴证，为不足。经曰∶脉虚身热，得之伤暑。）大顺（散）杏仁姜桂甘，散寒燥湿斯为贵。（先将甘草、白砂仁，次入干姜、杏仁（炒），合肉桂为末，每服一钱。吴鹤皋曰∶此非治暑，乃治暑月饮冷受伤之脾胃耳。）
b36ec931-01f9-4504-bb68-457273127103	连附六一（汤）	治胃痛，寒因热用理一般。（黄连六两，附子一两，亦反佐也。）
b769ecec-2ea7-4502-bf32-a4ed8f18be90	生脉散	麦味与人参，保肺清心治暑淫。气少汗多兼口渴，病危脉绝急煎斟。（人参五分八分，五味子九粒。人参大补肺气，麦冬甘寒润肺，五味酸收敛肺，并能泻火生津。盖心主脉，肺朝百脉，补肺清心，则气充而脉复。将死脉绝者服之，能令复生。夏月火旺烁金，尤宜服之。）
948c2296-025b-4803-a65b-41005da8d406	六一（散）	滑石同甘草，解肌行水兼清燥。统治表里及三焦，热渴暑烦泻痢保。（滑石六两，甘草一两，灯心汤下，亦有用姜汤下者。滑石气轻解肌，质重泻火，滑能入窍，淡能行水，故能通治上下表里之湿热，甘草泻火和中，又以缓滑石之寒滑也。）益元（散）碧玉与鸡苏（散），砂黛薄荷加之好。（前方加辰砂，名益元散，取其清心；加青黛，名碧玉散，取其凉肝；加薄荷，
2396de4d-247b-48d8-883f-0987c7ff15b5	五苓散	（仲景）治太阳府，（太阳经热传入膀胱府者用之。）白术泽泻猪茯苓。膀胱化气添官桂，利便消暑烦渴清。〔猪苓、茯苓、白术（炒）各十八铢，泽泻一两六铢，桂枝半两，每服三钱。二苓甘淡利水，泽泻甘咸泻水，能入肺肾而通膀胱，导水以泄火邪。加白术者，补土所以制水；加官桂者，气化乃能出也。经曰∶膀胱者，州都之官，津液藏焉，气化则能出矣。〕除桂名为四苓散，无寒但渴服之灵。（湿胜则气不得施化，故渴，利其湿则渴自止。）猪苓汤（仲景）除桂与术，加入阿胶滑石停。（猪苓、茯苓、泽泻、阿胶、滑石各一两。滑石泻火解肌，最能行水。吴鹤皋曰∶以诸药过燥，故加阿胶以存津液。）此为利湿兼泻热，黄胆（小）便闭渴呕宁。（五苓治湿胜，猪苓兼热胜。）
8f87ac57-be6a-4033-8ec0-ffd3a8475602	小半夏加茯苓汤	（仲景）。行水散痞有生姜。（半夏一升，茯苓三钱，生姜半斤。除茯苓，名小半夏汤。）加桂除夏治悸厥，茯苓甘草汤名彰。（加桂枝、甘草，除半夏，名茯苓甘草汤，仲景治伤寒水气乘心，厥而心下悸者，先治其水，却治其厥。火因水而下行，则眩悸止而痞满治矣。）
846f70a2-8201-4792-8c2b-92af633bb5f8	肾着汤	（《金匮》）内用干姜，茯苓甘草白术襄。伤湿身痛与腰冷，亦名甘姜苓术汤。〔、茯苓各四两，炙甘草、白术（炒）各二两。数药行水补土，此湿邪在经而未入腑脏者。〕黄防己（汤，《金匮》）除姜茯，术甘姜枣共煎尝。此治风水与诸湿，身重汗出服之良。〔黄、防己各一两，白术七钱半，甘草（炙）五钱，加姜、枣煎。防己大辛苦寒，通行十二经，开窍行水；黄 生用达表，白术燥湿强脾，并能止汗。加甘草者，益土所以制水，又以缓防己之峻急也。〕
46b88ac4-02a2-463b-ac3f-5cf3c2323d73	舟车	（丸，河间）牵牛及大黄，遂戟芫花又木香。青皮橘皮加轻粉，燥实阳水却相当。〔口渴面赤，气粗便秘而肿胀者，为阳水。黑牵牛四两炒，大黄二两（酒浸），甘遂（面里煨）、芫花（醋炒）、大戟（面里煨）、青皮（炒）、橘红各一两，木香五钱，轻粉一钱，水丸。牵牛、大黄、遂、戟、芫花行水厉药，木香、青、陈以行气，少加轻粉以透经络，然非实证不可轻投。〕
78fb1f00-1b8a-41f2-8bfb-4ee2f37a0e7b	疏凿	（饮）槟榔及商陆，苓皮大腹同椒目。赤豆艽羌泻木通，煎益姜皮阳水服。（槟榔、商陆、茯苓皮、大腹皮、椒目、赤小豆、秦艽、羌活、泽泻、木通等分，加姜皮、枣煎。艽、羌散湿上升，通、泻泄湿下降，苓、腹、姜皮行水于皮肤，椒、豆、商、槟攻水于腹里，亦上下表里分消之意。）
7dc2dbb0-9c3b-4daa-adca-5195f2c2b8cf	实脾	（汤，《严氏》）苓术与木瓜，甘草木香大腹加。草蔻附姜兼浓朴，虚寒阴水效堪夸。〔便利不渴而肿胀者，为阴水。茯苓、白术（土炒）、木瓜、甘草、木香、大腹皮、草豆蔻（煨）、附子（炒）、黑姜、浓朴（炒），加姜、枣煎。脾虚，补以苓、术、甘草；脾寒，温以蔻、附、黑姜；脾湿，利以茯苓、大腹；脾滞，导以浓朴，木香。又土之不足，由于木之有余，木瓜、木香皆能平肝泻木，使木不克土而脾和，则土能制水而脾实矣。经曰∶湿胜则地泥，实土正所以制水也。〕
79e970d1-a4c9-42ef-a2a4-c9fc91acc78c	五皮饮	（澹寮）用五般皮，陈茯姜桑大腹奇。（陈皮、茯苓皮、姜皮、桑白皮、大腹皮）。或用五加（皮）易桑白，脾虚肤胀此方司。（脾不能为胃行其津液，故水肿。半身以上，宜汗；半身以下，宜利小便。此为于泻水之中，仍寓调补之意。皆用皮者，水溢皮肤，以皮行皮也。）
4b433e0b-402b-4257-a651-d0c4ad206180	羌活胜湿	（汤，《局方》）羌独芎，甘蔓 木与防风。湿气在表头腰重（痛），发汗升阳有异功。风能胜湿升能降，（气升则水自降。）不与行水渗湿同。〔湿气在表宜汗。又风能胜湿，故用风药上升，使湿从汗散。羌活、独活各一钱，川芎、甘草（炙）、 本、防风各五分，蔓荆子三分。如有寒湿，加附子、防己。〕若除独活芎蔓草，除湿（汤）升麻苍术充。（除独活、川芎、蔓荆子、甘草，加升麻、苍术，名羌活除湿汤，治风湿身痛。）
ecb507c2-973a-4b54-92c5-0339d282b99c	大橘皮汤	治湿热，五苓六一二方缀。陈皮木香槟榔增，能消水肿及泄泻。（用五苓散，赤茯苓一钱，猪苓、泽泻、白术、桂各五分；用六一散，滑石六钱，甘草一钱，加陈皮钱半，木香、槟榔各三分，每服五钱，加姜煎。小水并入大肠，致小肠不利而大便泄泻。二散皆行水泄热之药，加槟榔峻下，陈皮、木香理气，以利小便而实大便也。水肿亦湿热为病，故皆治之。）
2dc46035-8181-411d-b440-45b207041c52	茵陈蒿汤	（仲景）治疸黄，阴阳寒热细推详。阳黄大黄栀子入，〔瘀热在里，口渴便闭，色，脉沉实者，为阳黄。茵陈六两，大黄二两（酒浸），栀子十四枚。茵陈发汗利水，能泄太栀子十五枚，甘草一两。按∶阳黄胃有瘀热者，宜下之。如发热者，则势外出而不内入，不必汗下，惟用栀子、黄柏，清热利湿以和解之。若小便利，色白无热者，仲景作虚劳治，用小建中汤。）
9176b994-596c-459c-bbe4-d1d3ba8db118	八正	（散，《局方》）木通与车前， 蓄大黄滑石研。（甘）草梢瞿麦兼栀子，煎加灯草痛淋蠲。（一方有木香，治湿热下注，口渴咽干，淋痛尿血，小腹急满。木通、灯草、瞿麦降心火人小肠，车前清肝火入膀胱，栀子泻三焦郁火，大黄、滑石泻火利水之捷药， 蓄利便涌淋，草梢入茎止痛。虽治下焦，而不专于治下，必三焦通利，水乃下行也。）
cd18d634-bd1d-4a52-a921-669458f077eb	萆厘清	（饮）石菖蒲，（甘）草梢乌药益智俱。（甘草梢减半，余药等分。）或益茯苓盐煎服，（加盐少许。）通心固肾浊精驱（遗精、白浊。萆 能泄厥阴、阳明湿热，去浊厘清；乌药疏逆气而止便数，益智固脾胃而开郁结，石菖蒲开九窍而通心，甘草梢达肾茎而止痛，使温热去而心肾通，则气化行而淋浊止矣。此以疏泄为禁止者也。）
a6140c96-fefc-4dd2-994c-0fd0480e190b	缩泉（丸）	益智同乌药（等分），山药（为）糊丸便数需。（盐汤下，治便数遗尿。）
e654a06d-2715-4084-aac6-f6d16283fa16	当归拈痛	（汤，东垣）羌防升，猪泽茵陈芩葛朋。二术苦参知母草，疮疡湿热服皆应。〔洗）、羌活、防风、升麻、猪苓、泽泻、茵陈、黄芩（酒炒）、葛根、苍术、白术（土炒）、苦参、知母（并酒炒）、甘草（炙）。羌活通关节，防风散留湿，苦参、黄芩、茵陈、知母以泄热，当归以和气血，升、葛助阳而升清，芩、泻泄湿而降浊，参、甘、二术补正固中，使苦寒不伤胃，疏泄不损气也。刘宗浓曰∶此方东垣本治湿热香港脚，后人用治诸疮，甚验。〕
3f9297e1-419a-48da-aab3-4062cb530689	炙甘草汤	（仲景）参姜桂，麦冬生地大麻仁。大枣阿胶加酒服，虚劳肺痿效如神。〔甘草（炙）、人参、生姜、桂枝各三两，阿胶、蛤粉各二两，生地一斤，麦冬、麻仁（研）各半升，枣十二枚，水、酒各半煎。仲景治伤寒脉结代，心动悸及肺痿唾多。《千金翼》用治虚劳，《宝鉴》用治呃逆，《外台》用治肺痿。参、草、麦冬益气复脉，阿胶、生地补血养阴，枣、麻润滑以缓脾胃，姜、桂辛温以散余邪。）
dee50d6d-dc7f-4959-a83a-45f70ca8238f	滋燥养荣	（汤）两地黄，芩甘归芍及艽防。（艽、防，风药润剂。）爪枯肤燥兼风秘，火烁金伤血液亡。（当归（酒洗）二钱，生地、熟地、白芍（炒）、黄芩（酒炒）、秦艽各一钱，防风、甘草各五分。）
2fe48516-ea73-40df-b284-182c79c17dce	活血润燥生津饮	（丹溪。）二冬熟地兼栝蒌。桃仁红花及归芍，利秘通幽善泽枯。（熟地、当归、白芍各一钱，天冬、麦冬、栝蒌各八分，桃仁（研）、红花各五分。）
d2ba9472-ea08-46c0-a081-a7103eaa73ae	韭汁牛乳	（饮，丹溪）反胃滋，养荣散瘀润肠奇。五汁安中（饮，张任候）姜梨藉，三般加入用随宜。（牛乳半斤，韭菜汁少许，滚汤顿服，名韭汁牛乳饮。牛乳六分，韭汁、姜汁、藕汁、梨汁各一分，和服名五汁安中饮，并治噎膈。反胃噎膈，由火盛血枯，或有瘀血寒痰，阻滞胃口，故食入反出也。牛乳润燥养血为君，韭汁、藕汁消瘀益胃，姜汁温胃散痰，梨汁消痰降火，要审症用之。或加陈酒亦佳，以酒乃米成也。）
13f4ce61-0378-42c2-b83e-8665bbafad88	润肠丸	（东垣）用归尾羌，桃仁麻仁及大黄。（归尾、羌活、大黄各五钱，桃仁、火麻仁各一两，蜜丸。归尾、桃仁润燥活血，羌活散火搜风，大黄破结通幽，麻仁润肠利窍。）或加艽防皂角子，（风湿加秦艽、防风、皂角子烧存性研。皂子得湿则滑，善通便秘，艽、防治风。）风秘血秘善通肠。（治风燥、血燥致大汤秘。）
a3ebbd10-3138-476a-a41c-423a6b464bc8	通幽汤	（东垣）中二地俱，桃仁红花归草濡。升麻升清以降浊，（清阳不升，则浊阴不降，故大便不通。生地、熟地各五分，桃仁（研）、红花、当归身、甘草（炙）、升麻各一钱。）噎塞便闭此方需。有加麻仁大黄者，当归润肠汤名殊。（以上药皆润燥通肠。）
d6384d53-597c-48f0-827c-fe431d55f60c	搜风顺气	（丸）大黄蒸，郁李麻仁山药增。防独车前及槟枳，菟丝牛膝山茱仍。中风风秘及气秘，肠风下血总堪凭。（大黄（九蒸九晒）五两，火麻仁、郁李仁（去皮）、山药（酒蒸）、车前子、牛膝（酒蒸）、山茱肉三两，菟丝子（酒浸）、防风、独活、槟榔、枳壳（麸炒）各一两，蜜丸。防、独润肾搜风，槟、枳顺气破滞、大黄经蒸晒则性稍和缓，同二仁滑利，润燥通幽。牛膝、车前下行利水，加山药、山茱、菟丝固本益阳，不使过于攻散也。）
58ffda8c-145b-44de-b149-522fc39993e8	消渴方	（丹溪）中花粉连，藕汁（生）地汁牛乳研。（粉、连研为末，诸汁调研。）或加姜（汁）蜜为膏服，泻火生津益血痊。（黄连泻心火，生地滋肾水，藕汁益胃，花粉生津，牛乳润燥益血。）
c3cf67c3-a123-4831-9217-c9e9f27fe2d4	白茯苓丸	治肾消，花粉黄连萆 调。二参熟地覆盆子，石斛蛇床 要。（ ，音皮鸱，即鸡肫皮也。茯苓、花粉、黄连、萆 、人参、玄参、熟地黄、覆盆子各一两，石斛、蛇床子各七钱半，鸡肫皮三十具（微炒），蜜丸，磁石汤下。黄连降心火，石斛平胃热，熟地、玄参生肾水，覆盆、蛇床固肾精，人参补气，花粉生津，茯苓交心肾，萆 利湿热， 治膈消，磁石色黑属水，假之入肾也。）
0484c229-ca86-4e1e-8f4c-583259490bd6	猪肾荠汤	（《千金》）参茯神，知芩葛草石膏因。磁石天花同黑豆，强中消渴此方珍。〔下消之证，茎长兴盛，不交精出，名强中。缘服邪术热药而毒盛也。猪肾一具，大豆一升，荠 、人参、石膏各三两，磁石（绵裹）、茯神、知母、黄芩、葛根、甘草、花粉各二两，先煮豆、肾，去滓，以药分三服。知、苓、石膏以泻邪火，人参、甘草以固正气，葛根、花粉以生津，荠、黑豆最能解毒，磁石、猪肾引之人肾也。〕
b0797b22-a8aa-44fa-a521-a9dd1a67327c	地黄饮子	（《易简》）参 草，二地二冬枇斛参。泽泻枳实疏二腑，躁烦消渴血枯含。〔人参、黄、甘草（炙）、天冬、麦冬、生地、枇杷叶（蜜炙）、石斛、泽泻、枳实（麸炒），每服二钱。参、 、甘草以补其气，气能生水，二地、二冬以润其燥，润能益血，石斛平胃，枇杷补气，泽泻泻膀胱之火，枳实宣大肠之滞，使二腑清，则心、肺二脏之气得以下降，而渴自止。〕
483ed4be-bc41-4c5c-8c16-4d58fef8ae95	酥蜜膏酒	（《千金》）用饴糖，二汁百部及生姜。杏枣补脾兼润肺，声嘶气惫酒温尝。〔酥蜜、饴糖、枣肉、杏仁（细研）、百部汁、生姜汁，共煎一炊，久如膏，温酒细细咽服之。〕
1860a141-a164-41d8-a031-f8072fe46e94	清燥	（汤，东垣）二术与黄 ，参苓连柏草陈皮。猪泽升柴五味曲，麦冬归地痿方推。〔治肺金受湿热之邪，痿 喘促，口干便赤，黄 钱半，苍术（炒）一钱，白术（炒）、陈皮、泽泻各五分，人参、茯苓、升麻各三分，当归（酒洗）、生地、麦冬、甘草（炙）、神曲炒、黄柏（酒炒）、猪苓各二分，柴胡、黄连（炒）各一分，五味九粒，煎。肺属辛金，主气；大肠为庚金，主津。燥金受湿热之邪，则寒水生化源绝，而痿 喘渴诸症作矣。参、 、苓、术、陈、草补土以生金，麦、味保金而生水，连、柏、归、地泻火滋阴，猪、泽、升、柴升清降浊，则燥金整肃，水出高原，而诸病平矣。此方不尽润药，因有清燥二字，故附记于此。然东垣所云清燥
c4ccc5a2-3773-423f-8f7f-d0151ec4d354	黄连解毒汤	（毒即火热也）四味，黄柏黄芩栀子备，（等分）。躁狂大热呕不眠，吐（血）衄（鼻血，音女六切）斑黄均可使。若云三黄石膏汤，再加麻黄及淡鼓。（见表里。）此为伤寒温毒盛，三焦表里相兼治。栀子金花（丸）加大黄，（黄芩、黄柏、黄连、栀子、大黄，水丸。）润肠泻热真堪倚
e3f17367-51df-4eac-8a42-d5f76d2d559d	导赤	（散，钱乙）生地与木通，（甘）草梢竹叶四般攻。口糜淋痛小肠火，引热同归小便中（等分煎。生地凉心血，竹叶清心气，木通泻心火入小肠，草梢达肾茎而止痛。）
0a60beba-6bab-496e-a06b-dd23feca96a3	附子泻心	（汤，仲景）用三黄，寒加热药以维阳。〔芩、连各一两，大黄二两，附子一枚（炮）。恐三黄重损其阳，故加附子。〕痞乃热邪寒药治，（伤寒痞满，从外之内，满在胸而不在胃，多属热邪，故宜苦泻。若杂病之痞，从内之外，又宜辛热。）恶寒加附始相当。（经曰∶心下痞，按之软，关脉浮者，大黄黄连泻心汤。心下痞而复恶寒，汗出者，附子泻心肠。）大黄附子汤同意，温药下之妙异常。〔大黄、细辛各二两，附子一枚（炮）。《金匮》阳中有阴，宜以温药下其寒，后人罕识其旨。〕
c3c13545-b417-4630-a05d-4c642b30546b	半夏泻心	（汤，仲景）黄连芩，干姜甘草与人参。大枣和之治虚痞，法在降阳而和阴。〔半夏半斤，黄连一两，干姜、黄芩、甘草（炙）、人参各三两，大枣十二枚。治伤寒下之早，胸满而不痛者，为痞；身寒而呕，饮食不下，非柴胡证。凡用泻心者，多属误下，非传经热邪。否而不泰为痞。泻心者，必交阴阳；通上下者，必和其中，故用参、甘、大枣。〕
d438d742-cf28-471c-9cb4-abe2432000dc	白虎汤	（仲景）用石膏偎，知母甘草梗米陪。（石膏一斤，知母六两，甘草二两，粳米六合。）亦有加入人参者，（名人参白虎汤。）燥烦热渴舌生苔。（白虎，西方金神。此方清肺金而泻胃火，故名。然必实热方可用之，或有血虚身热，脾虚发热及阴盛格阳，类白虎汤证，误投之，不可救也。按∶白虎证脉洪大有力，类白虎证脉大而虚，以此为辨。又当观小便，赤者为内热，白者为内寒也。）
9b44a4b5-10ef-4ec2-91fa-fff3a9d45a67	竹叶石膏汤	（仲景）人参，麦冬半夏竹叶灵。甘草生姜兼粳米，暑烦热渴脉虚寻。〔竹叶膏一斤，人参三两，甘草（炙）三两，麦冬一升，半夏、粳米各半升，加姜煎。治伤寒解后，呕渴少气。竹叶、石膏之辛寒，以散余热；参、甘、粳、麦之甘平，以补虚生津；姜、夏之辛温，以豁痰止呕。〕
a8841c5f-32c4-4593-9a9e-e471fe19223e	升阳散火	（汤，东垣）葛升柴，羌独防风参芍侪。生炙二草加姜枣，阳经火郁发之佳。（柴胡八钱，葛根、升麻、羌活、独活、白芍各五钱，防风二钱半，炙甘草三钱，生甘草二钱，每服五钱，加姜、枣煎。火发多在肝、胆之经，以木盛能生火，而二经俱挟相火，故以柴胡散肝为君，羌、防以发太阳之火，升、葛以发阳明之火，独活以发少阴之火。加参、甘者，补土以泄火；加白芍者，泻肝而益脾，但令散中有补，发中有收也。）
d08845cc-2c0a-4fa2-9ce3-c296d985763f	凉膈	（散，《局方》）硝黄栀子翘，黄芩甘草薄荷饶。竹叶蜜煎疗膈上，（叶生竹上，故治上焦。）中焦燥实服之消。〔连翘四两，大黄（酒浸）、芒硝、甘草各二两，栀子（炒黑）、黄芩（酒炒）、薄荷各一两，为末，每服三钱，加竹叶、生蜜煎。连翘、薄荷、竹叶以升散于上，栀、芩、硝、黄以推泻于下，使上升下行，而膈自清矣。加甘草、生蜜者，病在膈，甘以缓之也。潘
3160e262-aa0e-4fdd-bace-89db1d71e981	清心莲子	（饮，《局方》）石莲参，地骨柴胡赤茯苓。 草麦冬车前子，躁烦消渴及崩淋。〔石莲、人参、柴胡、赤茯苓、黄各三钱，黄芩（酒炒）、地骨皮、麦冬、车前子、甘草（炙）各二钱。参、 、甘草补虚泻火，柴胡、地骨退热平肝，黄芩、麦冬清热上焦，赤茯苓、车前利湿下部，中以石莲交其心肾也。〕
5c9a6fa9-294a-4cba-8886-67cfca035468	甘露	（饮，《局方》）两地（生、熟）与茵陈，芩枳枇杷（黄芩、枳壳、枇杷叶）石斛伦。甘草二冬（天、麦）平胃热，（等分煎。二地、甘、石斛平脾胃之虚热，清而兼补，黄芩、茵陈折热而去温，枳壳、枇杷抑气而降火。）桂苓犀角可加均。（加茯苓、肉桂，名桂苓甘露饮。《本事方》加犀
7b5d7d36-e153-43f6-8b0a-dc9de4a7c6ef	清胃散	（东垣）用升麻（黄）连，当归生地牡丹全。或益石膏平胃热，口疮吐衄（口血、鼻血）及牙宣（齿龈出血。黄连泻心火，亦泻脾火，丹皮、生地平血热，当归引血归经，石膏泻阴阳之火，升麻升阳明之清。昂按∶古人治血，多用升麻。然上升之药，终不可轻施。）
248a0022-7eb6-4eeb-8238-494b99112a1b	泻黄	（散）甘草与防风，石膏栀子藿香充。炒香蜜酒调和服，胃热口疮并见功。（防风四两，甘草二两，黑栀子一两，藿香七钱，石膏五钱。栀子、石膏泻肺胃之火，藿香辟恶调中，甘草补脾泻热。重用防风者，能发脾中伏火，又能于土中泻木也。）
6bd00861-67a0-4edf-b40d-107a7fcdf556	钱乙泻黄	（散）升防芷，芩夏石斛同甘枳。亦治胃热及口疮，火郁发之斯为美。（升麻、防风、白枳壳以清热开郁，石斛、甘草以平胃调中。）
2e0ed9b6-2bae-48d8-8108-28e7aaced66c	泻白	（散，钱乙）桑皮地骨皮，甘草粳米四般宜。（桑白皮、地骨皮各一钱，甘草五分，粳米百粒。桑皮泻肺火，地骨退虚热，甘草补土生金，粳米和中清肺。李时珍曰∶此泻肺诸方之准绳也。）参茯知芩皆可入，（人参、茯苓、知母、黄芩听加，名加减泻白散。）肺炎喘嗽此方施。
1f5c0df8-17d9-48e5-b451-e29d879a86fd	泻青丸	（钱乙）用龙胆栀，下行泻火大黄资。羌防升上芎归润，火郁肝经用此宜。〔龙胆草、黑栀子、大黄（酒蒸）、羌活、防风、川芎、当归（酒洗），等分，蜜丸，竹叶汤下。羌、防引火上升，栀、胆、大黄抑火下降，芎、归养肝血而润肝燥。〕
56a296ec-2d22-41ee-9e4c-9fa56132b15a	龙胆泻肝	（汤，《局方》）栀芩柴，生地车前泽泻偕。木通甘草当归合，肝经湿热力能排。〔胆草（酒炒）、栀子（酒炒）、黄芩（酒炒）、生地（酒炒）、柴胡、车前子、泽泻、木通、当归、甘草（生用）。龙胆、柴胡泻肝胆之火，黄芩、栀子泻肺与三焦之热，以佐之泽泻泻肾经之湿，木通、车前泻小肠、膀胱之湿；以佐之归、地养血补肝，甘草缓中益胃，不令苦寒过于泄下也。〕
9f4972a2-af5d-4ab3-874c-9e994cfd2c35	当归龙荟	（丸，《宣明》）用四黄，龙胆芦荟木麝香。黑栀青黛姜汤下，一切肝火尽能攘。〔当归大黄（酒浸）、青黛（水飞）、芦荟各五钱，木香二钱，麝香五分，蜜丸，姜汤下。肝木为生火之原，诸经之火因之而起，故以青黛、龙胆入木经而直折之，而以大黄、芩、连、栀、柏通平上下三焦之火也。芦荟大苦、大寒，气臊入肝。恐诸药过于寒泻，故用当归养血补肝，用姜汤辛温为引。加木、麝者，取其行气通窍也。然非实热，不可轻投。〕
36324e06-2c94-4195-96af-ac195641d610	左金	（丸，丹溪）茱莲六一丸，肝经火郁吐吞酸。〔黄连六两（姜汁炒），吴茱萸一两（盐汤泡），亦名茱连丸。肝实则作痛，或呕酸。心为肝子，故用黄连泻心清火，使火不克金，则金能制木而肝平矣。吴茱萸能入厥阴行气解郁，又能引热下行，故以为反佐。寒者正治，热者反治，使之相济以立功也。左金者，使肺右之金得行于左而平肝也。〕再加芍药名戊己（丸），热泻热痢服之安。（戊为胃土，己为脾土，加芍药伐肝安脾，使木不克土。）
8abb6366-e57f-4329-b130-c184ae4b9806	清骨散	用银柴胡，胡连秦艽鳖甲符。地骨青蒿知母草，骨蒸劳热保无虞。〔银柴胡钱半，胡黄连、秦艽、鳖甲（童便炙）、地骨皮、青蒿、知母各一钱，甘草（炙）五分。地骨、胡连、知母以平内热，柴胡、青蒿、秦艽以散表邪，引诸药入骨而补阴，甘草和诸药而泻火。〕
62584e15-d6d0-4fa3-9f87-f00efa9f172a	普济消毒	（饮，东垣）芩连鼠，玄参甘桔蓝根侣。升柴马勃连翘陈，僵蚕薄荷为末咀。〔黄芩（酒子、板蓝根、马勃、连翘、薄荷各一钱，僵蚕、升麻各七分，末服，或蜜丸噙化。〕或加人参及大黄，（虚者加人参，便秘加大黄。）大头天行力能御。（大头天行，亲戚不相访，问染者多不救。原文曰∶芩、连泻心肺之火为君，玄参、陈皮、甘草泻火补肺为臣，连翘、薄荷、鼠粘、蓝根、僵蚕、马勃散肿消毒定喘为佐，升麻、柴胡散阳明、少阳二经之阳，桔梗为舟楫，不令下行为载。李东垣曰∶此邪热客心肺之间，上攻头面为肿，以承气汤泻之，是为诛伐无过，遂处此方，全活甚众。）
50dae6d9-536a-4479-abad-6d3c71d55ece	清震汤	河间治雷头风，升麻苍术两般充。（二味，《局方》名升麻汤。）荷叶一枚升胃气，邪从上散不传中。（头面肿痛疙瘩，名雷头风，一云头如雷鸣。东垣曰∶邪在三阳，不可过用寒药重剂误伐无过，处清震汤升阳解毒，盖取震为雷之义。）
d9995c40-1826-43ff-b9db-8b202e38a1f9	桔梗汤	（《济生》）中用防已，桑皮贝母栝蒌子。甘枳当归薏杏仁，黄 百合姜煎此。（桔梗、防己、栝蒌、贝母、当归、枳壳、薏苡仁、桑白皮各五分，黄 七分，杏仁、百合、甘草各三分，姜煎。）肺痈吐脓或咽干，便秘大黄可加使。（一方有人参，无枳壳。黄 补肺气，杏仁、薏仁、桑皮、百合补肺清火，栝蒌、贝母润肺除痰，甘、桔开提气血，利膈散寒，防己散肿除风，泻湿清热，当归以和血，枳壳以利其气。）
4e2cb89d-6842-48f1-9722-27f32a15269a	清咽太平	（丸）薄荷芎，柿霜甘桔及防风。犀角蜜丸治热膈，早间咯血颊常红。（两颊，肺肝之部。早间，寅卯木旺之时。木盛生火，来克肺金。薄荷十两，川芎、柿霜、甘草、防风、犀角各二两，桔梗三两，蜜丸。川芎，血中气药，散瘀升清；防风，血药之使，搜肝泻肺。薄荷理血散热，清咽除蒸，犀角凉心清肝，柿霜生津润肺，甘草缓炎上之火势，桔梗载诸药而上浮。）
0455886c-3375-47a0-b5d5-9e2d227ec0bd	清斑青黛	（饮，陶节庵）栀连犀，知母玄参生地齐。石膏柴胡人参（甘）草，便实参去大黄跻。（去人参，加入大黄。）姜枣煎加一匙醋，阳邪里实此方稽。（发斑虽由胃热，亦诸经之火有以助之。青黛、黄连清肝火，栀子清胃火。引以柴胡，使达肌表；使以姜、枣，以和营卫。热毒入里，亦由胃虚，故以人参、甘草益胃。加醋者，酸以收之也。）
3fb0e25e-d15f-4437-94c7-36b7db297e15	辛夷散	（严氏）里 （本）防风，白芷升麻与木通。芎细（川芎、细辛）甘草茶调服，鼻生息肉此方攻。（肺经湿热，上蒸于脑，入鼻而生息肉，犹湿地得热而生芝菌也。诸药等分，末服三钱。辛夷、升麻、白芷能引胃中清阳上行头脑，防风、 本能入巅顶燥湿祛风，细辛散热通窍，川
763e67e1-95e0-4324-9ff8-11bba1247a64	苍耳散	（陈无择）中用薄荷，辛夷白芷四般和。葱茶调服疏肝肺，清升浊降鼻渊瘥。〔苍耳子（炒）二钱半，薄荷、辛夷各五钱，白芷一两，末服。凡头面之疾，皆由清阳不升，浊阴逆上所致。浊气上烁于脑，则鼻流浊涕为渊。数药升阳通窍，除湿散风，故治之也。〕
99c1e711-49b3-4684-8510-69f5cd64d65a	妙香	（散，王荆公）山药与参 ，甘桔二茯远志随。少佐辰砂木香麝，惊悸郁结梦中遗。〔山药二两（乳汁炒），人参、黄 （蜜炙）、茯苓、茯神、远志（炒）各一两，桔梗、甘草各三钱，辰砂二钱，木香二钱半，麝香一钱，为末，每服二钱，酒下。山药固精，参、 补气，远志、二茯清心宁神，桔梗、木香疏肝清肺，丹、麝镇心，散郁辟邪，甘草补中，协和诸药，使精、气、神相根据，邪火自退。不用固涩之药，为泄遗良剂，以其安神利气，故亦治惊悸郁结。〕
9735ee63-9255-4b83-9025-4c867054a789	二陈汤	（《局方》）用半夏陈，益以茯苓甘草臣。〔半夏（姜制）二钱，陈皮（去白）、茯苓各一钱，甘草五分，加姜煎。〕利气调中兼去湿，一切痰饮此为珍。（陈皮利气，甘草和中，苓、夏除湿，气顺湿除，痰饮自散。）导痰汤内加星枳，顽痰胶固力能驯。（加胆星以助半夏，加枳实以成冲墙倒壁之功。）若加竹茹与枳实，汤名温胆可宁神。（二陈汤加竹茹、枳实，名温胆汤，治胆虚不眠。）润下丸（丹溪）仅陈皮草，利气祛痰妙绝伦。〔陈皮（去白）八两，盐五两（水浸洗），甘草二两，蜜炙，蒸饼糊丸，姜汤下，或将陈皮盐水煮晒，同甘草为末，名二肾散，不可多服，
cb5e45fa-e0a4-4116-a087-7bb0047630c1	涤痰汤	（严氏）用半夏星，甘草橘红参茯苓。竹茹菖蒲兼枳实，痰迷舌强服之醒。〔治中风痰迷心窍，舌强不能言；半夏（姜制）、胆星各二钱半，橘红、枳实、茯苓各三钱，人参、菖蒲各一钱，竹茹七分，甘草五分，加姜煎。此即导痰汤加人参扶正，菖蒲开痰，竹茹清金。〕
b6963454-ee49-4009-830c-a784a95a82f9	青州白丸	星夏并，白附川乌俱用生。晒露糊丸姜薄引，风痰瘫痪小儿惊。〔半夏（水浸生两，南星、白附子各二两，川乌（去皮脐）五钱。四味俱生用，为末，袋盛，水摆出粉，再擂瘫痪，酒下；惊风，薄荷汤下。痰之主也，由于风寒湿。星、夏辛温，祛痰燥湿；乌、附辛热，散寒逐风。浸而曝之，杀其毒也。〕
81d1be65-890d-4f45-b3d5-188ee4a96b45	清气化痰	（丸）星夏橘，杏仁枳实栝蒌实。芩苓姜汁为糊丸，气顺火消痰自失。〔半夏（姜胆星各两半，橘红、枳实（麸炒）、杏仁（去皮尖）、栝蒌仁（去油）、黄芩（酒炒）、茯苓各一两，姜制，糊丸，淡姜汤下。气能发火，火能生痰。陈、杏降逆气，枳实破滞气，芩、瓜平热气，星、夏燥湿气，茯苓行水气。水湿火热，皆生痰之本也，故化痰必以清气为先。〕
7fa4f189-aed5-4cf5-8266-fe95c16a7d0c	顺气消食化痰丸	（瑞竹堂），青皮星夏莱菔（子）攒。曲麦山楂葛杏附，蒸饼为糊姜汁搏。〔半夏（姜制）、胆星各一斤，陈皮（去白）、青皮、苏子、沉香（水炒）、莱菔子、生姜、麦芽（炒）、神曲（炒）、山楂（炒）、葛根、杏仁（去皮尖炒）、香附（醋炒），各一两，姜汁和，蒸饼为糊丸。痰由湿生，星、夏燥湿；痰因气升，苏子、杏仁降气；痰因气滞，青、陈、香附导滞；痰生于酒食，曲、葛解酒，楂、麦消食。湿去食消，则痰不生，气顺则喘满自止矣。〕
e3ba9df2-5878-4f67-85e6-14d8c7005723	滚痰丸	（王隐君）用青礞石，大黄黄芩沉木香。百病多因痰作祟，顽痰怪证力能匡。〔青礞石一两（用焰硝一两，同入瓦罐，盐泥固济， 至石色如金为度），大黄（酒蒸）、黄芩（酒洗）各八两，沉香五钱，为末，水丸，姜汤下，量虚实服。礞石 悍，能攻陈积伏匿之痰；大黄荡热实，以开下行之路；黄芩凉心肺，以平上僭之火；沉香能升降诸气，以导诸药，为使。然非物理，不可轻投。〕
f47d2090-26cc-4ccd-966a-152a25e3380f	金沸草散	（《活人》）前胡辛，半夏荆甘赤茯因。煎加姜枣除痰嗽，肺感风寒头目颦。〔旋复花、前胡、细辛各一钱，半夏五分，荆芥钱半，甘草（炙）三分，赤茯苓六分。风热上壅，故生痰作嗽。荆芥发汗散风，前胡、旋复消痰降气，半夏燥痰散逆，甘草发散缓中，细辛温经，茯苓利湿，用赤者，入血分而泻丙丁也。〕局方（金沸草散）不用细辛茯，加入麻黄赤芍均。（治
5c011acb-a286-44be-8e45-3dd4461d4927	半夏天麻白术汤	白术、神曲（炒）各一钱，人参、黄 、陈皮、苍术、茯苓、泽泻、天麻各五分，干姜三分，黄柏（酒洗）二分。痰厥，非半夏不能除；风虚，非天麻不能定。二术燥湿益气，参、 泻火补中，陈皮调气升阳，苓、泻泻热导水，曲、麦化滞助脾，干姜以涤中寒，黄柏以泻在泉少火也。〕
c72e7332-0c4b-4f41-9884-79b8941a1a60	常山饮	（《局方》）中知贝取，乌梅草果槟榔聚。姜枣酒水煎露之，劫痰截疟功堪诩。〔常山（烧酒炒）二钱，知母、贝母、草果（煨）、槟榔各一钱，乌梅二个，一方加穿山甲、甘草。疟未发时，面东温服。知母治阳明独胜之热，草果治太阴独胜之寒，二经和则阴阳不致交争矣。常山吐痰行水，槟榔下气破积，贝母清火散痰，乌梅敛阴退热。须用在发散表邪及提出阳分之后为宜。〕
15bfa770-d9ae-423e-85fc-6b56401824bf	截疟七宝	（饮，《易简》）常山果，槟榔朴草青陈多。水酒合煎露一宵，阳经实疟服之妥。〔常山面东温服。常山吐痰，槟榔破积，陈皮利气，青皮伐肝，浓朴平胃，草果消膏梁之痰。加甘草，入胃佐常山引吐也。〕
0ac1bd6d-bf35-423d-8709-aa980c28be5d	金锁固精	（丸）芡莲须，龙骨蒺藜牡蛎需。莲粉（为）糊丸盐酒下，涩精秘气滑遗无。〔芡实（蒸）、莲蕊须、沙苑蒺藜（炒），各二两，龙骨（酥炙）、牡蛎（盐水煮一日夜， 粉），各一两，莲子粉为糊丸，盐汤吞服，或酒下。芡实固精补脾，牡蛎涩精清热，莲子交通心肾，蒺藜补肾益精，龙骨、莲须皆固精收脱之品。〕
971810ce-3ddd-4cdc-ab3e-88a33aac5538	茯菟丹	（《局方》）疗精滑脱，菟苓五味石莲末。酒煮山药为糊丸，亦治强中及消渴。〔强中者，下消之人，茎长兴盛，不交精出也。菟丝子十两（酒浸），五味子八两，白茯苓、石莲各三两，山药六两，酒煮为糊丸。漏精，盐汤下；赤浊，灯心汤下；白浊，茯苓汤下；消渴，米饮下。菟丝强阴益阳，五味涩精生水，石莲精心止浊，山药利湿固脾，茯苓甘淡而渗，于补之中能泄肾邪也。〕
ed487c59-5e13-488d-9869-d256a11dbe34	治浊固本	（丸）莲蕊须，砂仁连柏二苓俱。益智半夏同甘草，清热利湿固兼躯。〔固本之中，兼利湿热。莲须、黄连（炒）各二两，砂仁、黄柏、益智仁、半夏（姜制）、茯苓各一两，猪苓二两，甘草（炙）三钱。精浊多由湿热与痰，连、柏清热，二苓利湿，半夏除痰。湿热多由郁滞，砂、智利气，兼能固肾强脾。甘草补土和中，莲须则涩以止脱也。〕
ee63ab91-2716-4dfa-a13f-df5071bf2b8e	诃子散	（东垣）用治寒泻，炮姜粟壳橘红也。〔诃子（煨）七分，炮姜六分，罂粟壳（去蒂蜜炙）、橘红各五分，末服。粟壳固肾涩肠，诃子收脱住泻，炮姜逐冷补阳，陈皮升阳调气。〕河间（诃子散）木香诃草连，仍用术芍煎汤下。〔诃子一两半（生煨），木香五钱，黄连三钱，甘草二钱，为末煎，白术白芍汤调服。久泻，以此止之，不止者，加入浓朴二钱。〕二方药异治略同，亦
e9304921-6ec7-4ec8-b8fa-03fd918762ff	桑螵蛸散	（寇宗 ）治便数，参苓龙骨同龟壳。菖蒲远志及当归，补肾宁心健忘觉。〔桑螵蛸（盐水炒）、茯苓（一用茯神）、龙骨（ ）、龟板（酥炙）、菖蒲（盐炒）、远志、当归等分，为末，临卧服二钱，人参汤下。治小便数而欠，补心虚，安神。虚则便数，故以人参、螵蛸补之；热则便欠，故以龟板滋之，当归润之。菖蒲、茯苓、远志，并能清心热而通心肾，使心行，则小肠之腑自宁也。〕真人养脏（汤，罗谦甫）诃粟壳，肉蔻当归桂木香。术芍参甘为涩剂，脱肛久痢早煎尝。〔诃子（面里裹煨）一两二钱，罂粟壳（去蒂蜜炙）三两六钱，肉豆蔻（面里裹煨）五钱，当归、白术（炒）、白芍（酒炒）、人参各六钱，木香二两四钱，桂八钱，生甘草一两八钱，每服四钱。脏寒甚加附子，一方无当归，一方有干姜。脱肛由于虚寒，参、术、甘草以补其虚，官桂、豆蔻以温其寒。木香调气，当归和血，芍药酸以收敛，诃子、粟壳涩以止脱。〕
933d3d44-c7f4-41c8-9f36-01e1fab9af4a	当归六黄	（汤）治汗出，（醒而汗出曰自汗，寐而汗出曰盗汗。） 柏芩连生熟地。（当归、黄柏、黄连、黄芩、二地等分，黄 加倍。）泻火固表复滋阴，（汗由阴虚，归、地以滋其阴；汗由火扰，黄芩、柏、连以泻其火；汗由表虚，倍用黄 ，以固其表。）加麻黄根功更异。（李时珍曰∶麻黄根走表，能引诸药至卫分而固腠理。）或云此药太苦寒，胃弱气虚在所忌。
69b33905-6559-40f6-bb7f-d1200c5f086f	柏子仁丸	人参术，麦麸牡蛎麻黄根。再加半夏五味子，阴虚盗汗枣丸吞。〔柏子仁（炒研去油）二两，人参、白术、牡蛎（ ）、麻黄根、半夏、五味子各一两，麦麸五钱，枣肉丸，米饮下。心血虚则卧而汗即出，柏仁养心宁神，牡蛎、麦麸凉心收脱，五味敛汗，半夏燥湿，麻黄根专走肌表，引参、术以固卫气。〕
4137a3ef-5d1d-406b-a233-25fe00d0f752	阳虚自汗牡蛎散	黄 浮麦麻黄根。〔牡蛎（ 研）、黄 、麻黄根各一钱，浮小麦百粒，煎。牡蛎、浮麦凉心止汗，黄 、麻黄根走肌表而固卫。〕扑法芎 牡蛎粉，（扑汗法∶白术、 本、川芎各二钱半，糯米粉两半，为末，袋盛，周身补之。）或将龙骨牡蛎扪。（龙骨、牡蛎为末，合糯米粉等分，亦可扑法。）
8993dfe6-5dcc-439e-9bf3-ba13ab0a5b80	乌梅丸	（仲景）用细辛桂，人参附子椒姜继。黄连黄柏及当归，温脏安蛔寒厥剂。〔乌梅三百个（醋浸蒸），细辛、桂枝、附子（炮）、人参、黄柏各六两，黄连一斤，干姜十两，川椒（去汗），当归各四两，治伤寒厥阴证，寒厥吐蛔。虫得酸则伏，故用乌梅；得苦则安，故用连、柏
fa42f0e7-fc3b-43c0-ad22-a8077b49c8ed	化虫	（丸）鹤虱及使君，槟榔芜荑苦楝群，白矾胡粉糊丸服，肠胃诸虫永绝氛。〔槟榔、鹤虱、苦楝根（东引者）、胡粉（炒）各一两，使君子、芜荑各五钱，枯矾一钱半，面糊丸，亦可末服。数药皆杀虫之品，单服尚可治之，汇萃为丸，而虫焉有不死者乎！〕
025536e6-027a-4061-813a-915a16e92a9e	真人活命	（饮）金银花，防芷归陈草节加。贝母天花兼乳没，穿山角刺酒煎嘉。〔金银花二钱，当归（酒洗）、陈皮（去白）各钱半，防风七分，白芷、甘草节、贝母、天花粉、乳香各一钱，没药五分，二味另研。候药熟，下皂角刺五分，穿山甲三大片（锉，蛤粉炒，去粉用），好酒煎服，恣饮尽醉。忍冬、甘草散热解毒，痈疮圣药，花粉、贝母清痰降火，防风、白芷燥湿排脓，当归和血，陈皮行气，乳香托里护心，没药散瘀消肿，山甲、角刺透经络而溃坚，加酒以行药势也。〕一切痈疽能溃散，（已成者溃，未成者散。）溃后忌服用毋差。大黄便实可加使，铁器酸物勿沾牙。
d8f6a4ad-a1a0-4319-bf33-c4e95f8378fc	金银花酒	加甘草，奇疡恶毒皆能保。〔金银花五两（生者更佳），甘草一两，水煎一日一夜，服尽。〕护膜须用蜡矾丸，（黄蜡二两，白矾一两，溶化为丸，酒服十丸，加至百丸则有力，使毒不攻心。一方加雄黄，名雄矾丸，蛇咬尤宜服之。）二方均是疡科宝。
147bed23-f23a-4845-a20c-ef24d516cb79	托里十补	（散，即《局方》十宣散）参 芎，归桂白芷及防风。甘桔浓朴酒调服，痈疡脉弱赖之充。（人参、黄 、当归各二钱，川芎、桂心、白芷、防风、甘草、桔梗、浓朴各一钱，热酒调服。参、 补气，当归和血，甘草解毒，防风发表，浓朴散满，桂枝、桔梗排脓，表里气血交治，共成内托之功。）
350fbed2-8f91-4f47-84f1-84cf44903b99	托里温中	（汤，孙彦和）姜附羌，茴木丁沉共四香。陈皮益智兼甘草，寒疡内陷呕泻良。（附子（炮）四钱，炮姜、羌活各三钱，木香钱半，茴香、丁香、沉香、益智仁、陈皮、甘草各二钱，加姜五片煎。治疮疡变寒内陷，心痞便溏，呃逆昏 。疡寒内陷，故用姜附温中助阳，羌活通关节，炙草益脾元，益智、丁、沉以止呃进食，茴、木、陈皮以散满除痞。此孙彦和治王伯禄臂疡，盛夏用此，亦舍时从证之变法也。）
2cb94d6d-87fe-4131-9a5e-7d8a055ac1c7	托里定痛	（汤）四物兼，（地黄、川芎、当归、白芍。）乳香没药桂心添。再加蜜炒罂粟壳，溃疡虚痛去如拈。（罂粟壳收涩，能止诸痛；四物活血，托里充肌。乳香能引毒瓦斯外出，不致内攻，，与没药并能消肿止痛。）
25946849-7838-4005-b69e-fa0dbd873c19	散肿溃坚	（汤，东垣）知柏连，花粉黄芩龙胆宣。升柴翘葛兼甘桔，归芍棱莪昆布全。〔黄芩八钱半（酒炒半生用），知母、黄柏（酒炒）、花粉、胆草（酒炒）、桔梗、昆布各五钱，柴胡四钱，升麻、连翘、甘草（炙）、三棱（酒炒）、莪术（酒洗炒）各三钱，葛根、归尾（酒洗）、白芍（酒炒）各二钱，每服五、六钱，先浸后煎。连翘、升、葛解毒升阳，甘、桔、花粉排脓利膈，归、芍活血，昆布散痰，棱、莪破血行气，龙胆、知、柏、芩、连大泻诸经之火也。〕
6e2982e7-5431-4fbf-bb95-be1b7bc9808e	经产之剂（十二首、附方二十二）	妇人诸病与男子同，惟行经妊娠，则不可以例治，故立经产一门。
06b18a23-5568-4ed6-929b-d2b3d44fbfd9	海藏妊娠六合汤	四物为君妙义长。（当归、地黄、川芎、白芍。）伤寒表虚地骨桂，（表虚自汗，发热恶寒，头痛脉浮，四物四两加桂枝、地骨皮各七钱，二药解肌实表，名表虚六合汤。）表实细辛兼麻黄。（头痛身热，无汗脉紧，四物四两加细辛、麻黄各五钱，二药温经发汗，名表实六合汤。）少阳柴胡黄芩入，（寒热胁痛，心烦喜呕，口苦脉弦，为少阳证。加柴胡解表，黄芩清里，名柴胡六合汤。）阳明石膏知母藏。（大热烦渴，脉大而长，为阳明证，加白虎汤清肺泻胃，名石膏六合汤。）小便不利加芩泻，（加茯苓、泽泻利水，名茯苓六合汤。）不眠黄芩栀子良。（汗下后不得眠，加黄芩、栀子养阴除烦，名栀子六合汤。）风湿防风与苍术，（兼风兼湿，肢节烦痛，心热脉浮，加防风搜风、苍术燥湿，名风湿六合汤。）发斑蕴毒升翘将。（下后不愈，蕴毒发斑如锦纹者，加升麻、连翘散火解毒，名升麻六合汤。）胎动血漏名胶艾，（伤寒汗下后，胎动漏血，加阿胶、艾叶养血安胎，名胶艾四物汤。）虚痞朴实颇相当。（胸满痞胀，加浓朴、枳实炒，散满消痞，名朴实六合汤。）脉沉寒厥亦桂附。（身冷拘急，腹痛脉沉，亦有不得已而加附子、肉桂散寒回阳者，名附子六合汤。）便秘蓄血桃仁黄。（大便秘，小便赤而脉实数，或膀胱蓄血，亦有加桃仁、大黄润燥通幽者，名大黄六合汤。）安胎养血先为主，余因各症细参详。后人法此治经水，过多过少别温凉。温六合汤加芩术，（加黄芩、白术治经水过多，黄芩抑阳，白术补脾，脾能统血。）色黑后期连附商。（加黄连清热，香附行气，名连附六合汤。）热六合汤栀连益，（加栀子、黄连治血热妄行。）寒六合汤加附姜。（加炮姜、附子治血海虚寒。）气六合汤加陈朴，（加陈皮、浓朴治气郁经阻。）风六合汤加艽羌。（加秦艽、羌活治血虚风痉。）此皆经产通用剂，说与时师好审量。
36c3cb8f-c357-4cbf-9192-ee7dd9dcb0ad	胶艾汤	（《金匮》）中四物先，阿胶艾叶甘草全。（阿胶、川芎、甘草各二两，艾叶、当归各三两，芍药、地黄各四两，酒水煎，内阿胶烊化服。四物养血，阿胶补阴，艾叶补阳，甘草和胃，加酒行经。）妇人良方单胶艾，（亦名胶艾汤。）胎动血漏腹痛痊。胶艾四物加香附，（香附用童便、盐水、酒、醋各浸三日，炒。）方名妇宝（丹）调经专。
9579f9f8-5e28-4e07-8276-7f370a624071	当归散	（《金匮》）益妇人妊，术芍芎归及子芩。安胎养血宜常服，产后胎前功效深。（妇人怀妊，宜温服之，临盆易产，自无众疾。当归、川芎、芍药、黄芩各一斤，白术半斤，为末，酒调服。丹溪曰∶黄芩、白术，安胎之圣药。盖怀妊宜清热凉血，血不妄行则胎安。黄芩养阴退阳，能除胃热；白术补脾，亦除胃热。脾胃健则能化血养胎，自无半产胎动血漏之患也。）
b374c45d-1cce-44ae-a817-d600d0fa1afd	黑神散	（《局方》）中熟地黄，归芍甘草桂炮姜。蒲黄黑豆童便酒，消瘀下胎痛逆忘。〔瘀血攻冲则作痛，胞胎不下，亦由血滞不行。诸药各四两，黑豆（炒去皮）半斤，酒、童便合煎。熟地、归、芍润以濡血，蒲黄、黑豆滑以行血，黑姜、官桂热以动血，缓以甘草，散以童便，行
ac0f3d8a-b86e-4506-b1d7-f6aae8b0faa4	清魂散	（《局方》）用泽兰叶，人参甘草川芎协。荆芥理血兼祛风，产中昏晕神魂帖。〔泽兰、人参、甘草（炙）各三分，川芎五分，荆芥一钱，酒调下。川芎、泽兰和血，人参、甘草补气。外感风邪，荆芥能疏血中之风。肝藏魂，故曰魂魂。〕
43dc4756-6bf3-44b1-8e5d-a4519a03843b	羚羊角散	（《本事方》）杏薏仁，防独芎归又茯神。酸枣木香和甘草，子痫风中均回春。〔羚羊角屑一钱，杏仁、薏仁、防风、独活、川芎、当归、茯神、枣仁（炒）各五分，木香、甘草各二枣、茯以宁心神，芎、归以和血，杏仁、木香以利气，薏仁、甘草以调脾。〕
2acb9cef-71f6-4dd4-9178-bfc0ae0e183d	当归生姜羊肉汤	（《金匮》），当归三两，生姜五两，羊肉一斤。产中腹痛褥劳匡。（产后发热，自汗身痛，名褥劳。腹痛者，瘀血未去，则新血自不生也。）亦有加入参 者，（气能生血。羊肉辛热，用气血之属以补气血，当归引入血分，生姜引入气分，以生新血。加参、 者，气血交补也。）千金四物甘桂姜。（《千金》羊肉汤，芎、归、芍、地、甘草、干姜、肉桂，
ab847ce8-4dc2-4afe-ab00-05062836f772	达生	（散，丹溪。达，小羊也，取其易生）紫苏大腹皮，参术甘陈归芍随。再加葱叶黄杨脑，孕妇临盆先服之。〔大腹皮三钱，紫苏、人参、白术（土炒）、陈皮、当归（酒洗）、白芍（酒洗）各一钱，甘草（炙）三钱，青葱五叶，黄杨脑七个，煎。归、芍以益其血，参、术以补其气，陈、腹、苏、葱以疏其壅。不虚不滞，产自无难矣。〕若将川芎易白术，（名）紫苏饮子（严氏）子悬宜。（胎气不和，上冲心腹，名子悬。）
633cb06e-9cfc-4c59-953f-9bb3e08a7b1c	妊娠转胞参术饮	（丹溪。转胞者，气血不足，或痰饮阻塞，胎为胞逼，压在一边，故脐下急痛，而小便或数或闭也。）芎芍当归熟地黄。炙草陈皮（留白）兼半夏，气升胎举自如常。（此即人参汤除茯苓，加陈皮、半夏以除痰，加姜煎。）
ff4166ee-b17d-4e84-9f33-eaf5be2e0e9b	牡丹皮散	（《妇人良方》）延胡索，归尾桂心赤芍药。牛膝棱莪酒水煎，气行瘀散血瘕削。（瘀血半煎。桂心、丹皮、赤芍、牛膝以行其血，三棱、莪术、归尾、延胡索兼行血中气滞、气中血滞，则结者散矣。）
4b11f9ee-997d-4da8-9adb-28a141fdb845	固经丸	（《妇人良方》）用龟板君，黄柏樗皮香附群。黄芩芍药酒丸服，漏下崩中色黑殷。〔治经多不止，色紫黑者，属热。龟板（炙）四两，黄柏（酒炒）、芍药（酒炒）各二两，樗皮（炒）、香附（童便浸炒），各两半，黄芩（酒炒）二两，酒丸。阴虚不能制胞络之火，故经多。龟板、芍药滋阴壮水，黄芩清上焦，黄柏泻下焦，香附辛以散郁，樗皮涩以收脱。〕
af1e763e-7154-41f0-977b-36ea5d0629fa	柏子仁丸	（《良方》）熟地黄，牛膝续断泽兰芳。卷柏加之通血脉，经枯血少肾肝匡。〔柏子仁（去油）、牛膝（酒浸）、卷柏各五钱，熟地一两，续断、泽兰各三两，蜜丸，米饮下。经曰∶心气不得下降，则月事不来。柏子仁安神养心，熟地、续断、牛膝补肝益肾，泽兰、卷柏活血通经。〕
fa5ec253-6282-454f-b595-53439e398025	望梅丸	（ 庵）用盐梅肉，苏叶薄荷与柿霜。茶末麦冬糖共捣，旅行 服胜琼浆。〔盐梅肉四两，麦冬去心，薄荷叶（去梗）、柿霜、细茶各一两，紫苏叶（去梗）五钱，为极细末，白霜糖四两，共捣为丸，鸡子大。旅行带之，每含一丸，生津止渴，加参一两尤妙。〕
f6e4807a-aa35-42f8-b433-a06843b755f0	骨灰固齿	（牙散）猪羊骨，腊月腌成 研之。骨能补骨咸补肾，坚牙健啖老尤奇。（用腊月腌猪羊骨，火 ，细研，每晨擦牙，不可间断。至老而其效益彰，头上齿骨亦佳。）
3e1dba96-ba7f-49d3-b2c2-a47b472f8218	软脚散	中芎芷防，细辛四味研如霜。轻撒鞋中行远道。足无针 汗皆香。（防风、白芷，川芎、细辛各二钱半，为末。行远路者，撒少许于鞋内，步履轻便，不生针 ，足汗皆香。）
98b8f51b-d264-4192-b3b6-9b0d7b20e03f	稀痘神	（米以功）丹三种豆，粉草细末竹筒装。腊月厕中浸洗净，风干配入梅花良。丝瓜藤丝煎汤服，一年一次三年光。（用赤小豆、黑豆、绿豆、粉草各一两，细末，入竹筒中，削皮留节，凿孔入药，杉木塞紧，溶蜡封固，浸腊月厕中；一月取出，洗浸，风干。每药一两，腊月梅花片三钱，以雪中花片落地者，不着人手，以针刺取更妙。如急出用，入纸套中略烘即干。儿大者服一钱，小者五分，以霜后丝瓜藤上小藤丝煎汤，空腹服。忌荤腥十二日，解出黑粪为验。每年服一次，二次可稀，三次永不出矣。）又方蜜调忍冬末，（顾骧宇。）不住服之效亦强。（金银花为末，糖调，不住服之。）更有玄参菟丝子，（娄江王相公。）蜜丸如弹空心尝。白酒调化日二次，〔菟丝子半斤（酒浸二宿，煮干去皮），玄参四两，共为细末，蜜丸，弹子大，白酒调下，每日二次。〕或加犀麦生地黄。（又方加生地、麦冬四钱，犀角二两。）此皆验过稀痘法，为力简易免仓皇。
\.


--
-- Data for Name: classification; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.classification (class_id, classf_name) FROM stdin;
4906cf0e-f6ae-454f-9890-874ab1e0e46b	消化道和代谢方面的药物
d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	血液和造血器官药
e065b1aa-d114-45d4-9242-7254a92de540	心血管系统药物
b1130ef7-2502-4225-96b3-21ea964a3f8f	皮肤病用药
f17898c3-4f1b-4912-ab30-c3590909a44e	泌尿生殖系统和性激素
56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	除性激素和胰岛素外的全身激素制剂
22c9233b-af5a-4724-954c-5c8c2df6babd	全身用抗感染药
c2494299-0691-4f02-964d-76ba0e9ad357	抗肿瘤药及免疫调节剂
64387702-f538-4d46-a240-a9efef71e9ad	肌肉-骨骼系统药物
1d8fa51d-ec42-4073-bf0e-cb304f60a891	神经系统
adb80c4d-8829-4c0e-99f6-38c789301d0e	抗寄生虫药，杀虫药和驱虫药
3620342b-4430-4eed-9ca2-ca25604ce783	呼吸系统药物
3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	感觉器官药物
9bbb0b50-8b07-40e7-a820-05b11a5caed3	其他
\.


--
-- Data for Name: drug; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.drug (name, drug_id, drug_number, ingredient, "character", major_function, specification, usage_dosage, adverse_reaction, taboo, matters_need_attention, store_up, expiry_date, produced_time, approval_number, manufacturing_enterprise, class_id, a_b_classify, serial_number, money, purchase) FROM stdin;
阿莫西林	5c1992c8-acf6-4199-82a0-ffe40c4ee148	15	\N	\N	\N	\N	口服液体剂	\N	\N	限儿童及吞咽困难患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
复方甲氧那明	d39bb768-0fb6-4b5d-89cb-e3272011766e	20	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
烯丙雌醇	ac06b4c9-cb3e-450b-9e42-aa05d3634f8a	10	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
兰索拉唑	7562c86f-84d5-4ebe-9927-afb5e5eaeb06	0	\N	\N	\N	\N	注射剂	\N	\N	限有禁食医嘱或吞咽困难的患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
丝裂霉素	4a274bca-ff5e-420d-a84e-f5f45d6967e9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
间羟胺	a2462111-7e67-47e0-8af4-3c9b9df7c35b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
米托蒽醌	940d352a-d3bd-4146-9349-9d6fe7f30e3a	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
小儿复方阿司匹林	57881ac3-4862-47d3-adf8-7774fcb64556	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
硝酸异山梨酯	7abef642-52f0-4f3f-a4b1-fb50e0a09973	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
帕拉米韦氯化钠	51dcd414-bd82-4646-b38f-88175148e0bd	0	\N	\N	\N	\N	注射剂	\N	\N	限流感重症高危人群及重症患者的抗流感病毒治疗	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
多沙唑嗪	80d5a951-2c0b-4183-a64d-a4eb3a01202a	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
抗蝮蛇毒血清	2c7e75ea-b961-46df-b5d4-46d0412d3b83	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
坎地沙坦酯	343af1f2-1068-4e48-8e89-50308064e56c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
门冬胰岛素50	84012cb5-138e-48af-aaf7-0a6512fd25e1	0	\N	\N	\N	\N	注射剂	\N	\N	限1型糖尿病患者；限其他短效胰岛素或口服药难以控制的2型糖尿病患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
二硫化硒	ac555702-fb06-44cc-9215-317d6926fd10	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
三尖杉酯碱	12f757f5-ae8c-4eb4-ba60-03604a091410	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
复方莪术油	3bd877d7-8af4-497b-9d80-5ec199c0d9c1	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
替尼泊苷	b502c26e-ef94-4f8a-80e2-e056f4acdf43	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
呋喃妥因	e67b0fe8-6228-442d-8430-f4e3cfc3aa9f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
伊班膦酸	5bfd0170-73f2-4ac9-87e9-005608ca36e3	0	\N	\N	\N	\N	注射剂	\N	\N	限重度骨质疏松或恶性肿瘤骨转移并有明显癌痛的患者	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
复方磺胺甲噁唑	fb0b105d-8f85-4454-a09a-40e687ac6dfd	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
左乙拉西坦	7314c2f4-fdb8-45ec-b99d-7017c8a7903d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
消旋卡多曲	2fa9752c-a36d-4419-ab1c-08e615a74ed2	0	\N	\N	\N	\N	口服散剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
葡萄糖酸亚铁	c3c4bcdd-f65b-4ed0-945b-adcff226a716	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
阿柔比星	b93e5cd7-1ba9-4202-9f4b-30dbb817594d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
复方卡托普利	f97dfca4-1a15-408b-9fe2-d3e212b87614	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
咪康唑	ece4d0b3-7ba5-46ab-b562-8f25ae6400dc	0	\N	\N	\N	\N	阴道软胶囊	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
维生素K1	d4af60b8-2469-4137-a8f3-13ecf46a8ce2	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
破伤风人免疫球蛋白	568783fd-c7f0-4b2e-a0fa-1f30e1bafb06	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
氨甲苯酸葡萄糖	1832abef-7b1e-4793-86a6-b0d3cea26bcf	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
亚砷酸（三氧化二砷）	9eb737d0-6f92-4b84-9665-981939d42544	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
山莨菪碱	d952e82b-86ca-47b4-a4cc-4f28cdb07269	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
茶碱 茶碱Ⅱ	bf837afa-f15b-47f6-af3f-f017e09b3e93	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
依巴斯汀	ddaaf2cc-f98b-419a-aaa9-5ac1522f6c00	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
齐拉西酮	a38e719c-c5bc-49cc-8aca-47be1dd1344c	0	\N	\N	\N	\N	注射剂	\N	\N	限精神分裂症患者的急性激越症状	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
钆双胺	bd48ef98-27f3-4fd4-be02-5b200e1f4229	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
甲硝唑	536d75b1-0368-43de-b13a-e4ccb034c2dd	0	\N	\N	\N	\N	阴道泡腾片	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
异甘草酸镁	54577940-ebbf-4c81-b90f-6d1abfc09761	0	\N	\N	\N	\N	注射剂	\N	\N	限肝功能衰竭或无法使用甘草酸口服制剂的患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
酮康唑	b48e4bf5-8673-41f7-a571-17c51839f1d5	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
复方卡比多巴	11bda6f3-431a-4a5b-8d4b-2a4be05d58c9	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
硫软膏	0fb6d84a-5692-48b6-b69e-ad8f134b0ccb	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
重组甘精胰岛素	eb3d233d-9339-4ba5-a3df-32e297e40eff	0	\N	\N	\N	\N	注射剂	\N	\N	限1型糖尿病患者；限中长效胰岛素难以控制的2型糖尿病患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
抗五步蛇毒血清	4bbe7538-61d0-4fdf-9bb8-c03cf3e7b88f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
二甲弗林	5e1d930d-ca41-4585-88e0-0c1841cd849b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
氟康唑葡萄糖	b0a5bc56-b582-4760-bf93-e5da9271a1bd	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
左氧氟沙星	0b660e4b-a45e-490b-b5b3-b62838d2be93	0	\N	\N	\N	\N	眼用凝胶剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
山莨菪碱	711e49e7-8c9d-450e-9519-80db0debbaff	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
磺胺嘧啶锌	face843f-fa05-4f1f-807e-117cf8002efc	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
玻璃酸钠	0ac8e8a4-756c-4f34-ab8e-96948b6324bd	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
氧氟沙星	47d8a4d9-574f-4a37-9582-44efd15380c9	0	\N	\N	\N	\N	滴耳剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
普罗雌烯	c4abcf34-2ffc-43db-ac34-432ae6359021	0	\N	\N	\N	\N	阴道软胶囊	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
小儿碳酸钙D3	a7faceda-3147-4832-9a13-e8d5f6073792	0	\N	\N	\N	\N	颗粒剂	\N	\N	限儿童佝偻病	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
氟康唑	7064712b-94d2-4b6b-aac1-6a7962fad95b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
人用狂犬病疫苗（地鼠肾细胞）	8082d447-cbbb-41e0-abb6-90e39d9cb410	0	\N	\N	\N	\N	注射剂	\N	\N	限工伤保险	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
开塞露（甘油）	3ceb2104-d1c3-45af-8a6b-82007c90ffa8	0	\N	\N	\N	\N	灌肠剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
戊酸雌二醇/雌二醇环丙孕酮	45ec9f34-139a-4421-a829-c0eb5da352c1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
丙酚替诺福韦	cedb3627-d2a4-4fa7-b8f4-a6af064208be	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限慢性乙型肝炎患者。	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
头孢西丁	debb4e02-d243-471a-8a9a-d6e88e0860a4	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确药敏试验证据或重症感染的患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
伏立康唑	374a9b46-b0b4-4b3b-8988-1671ad391124	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限有明确的重度免疫缺陷诊断并发严重真菌感染的临床证据；曲霉菌肺炎或中枢神经系统感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
辅酶A	7f749fb1-4fc0-4c40-9108-13cc1ba9aa28	0	\N	\N	\N	\N	注射剂	\N	\N	限急救、抢救	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
甘氨双唑钠	354f88df-cc3a-4b97-8d94-baa009f21cf1	0	\N	\N	\N	\N	注射剂	\N	\N	限头颈部恶性肿瘤	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
人干扰素α1b(重组人干扰素α-1b)	cb36c55d-d165-46be-9421-d43df1200982	0	\N	\N	\N	\N	注射剂	\N	\N	限白血病、淋巴瘤、黑色素瘤、肾癌、多发性骨髓瘤、丙肝 、慢性活动性乙肝。丙肝、慢性活动性乙肝连续使用6个月 无效时停药，连续使用不超过12个月	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
多巴胺	eb1da377-91a3-438a-9461-a80101ac3a0f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
扑米酮	ca162edd-091c-47f3-b112-1f1994addb7d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
硼替佐米	e6124135-ebe8-4436-9fb8-cadcadfe041a	0	\N	\N	\N	\N	注射剂	\N	\N	限多发性骨髓瘤、复发或难治性套细胞淋巴瘤患者，并满足以下条件：1.每2个疗程需提供治疗有效的证据后方可继续 支付；2.由三级医院血液专科或血液专科医院医师处方。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
托泊替康	1a560749-ecd6-418a-8779-84e098064bff	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
胺碘酮	ee05ea95-f84f-48a4-8364-928a1cc9201b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
氨氯地平	24abfcd4-fa12-4abc-b856-8ff07de7c275	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
氯米帕明	7620cc14-fd83-42c5-8f4b-783afd1cee47	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
羟乙基淀粉（200/0.5）氯化钠;羟乙基淀粉（130/0.4）氯化钠	c8c49275-7072-4a35-9478-ecc294b5ba66	0	\N	\N	\N	\N	注射剂	\N	\N	限低血容量性休克或手术创伤、烧伤等引起的显著低血容量患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
甲羟孕酮	9a2a3904-108e-4152-8e95-a0f50159aba4	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
亚砷酸氯化钠	eb3f4498-55ed-418e-9414-5339cfbc15c6	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
布洛芬	1b428ec1-6d7e-4ddc-9b80-4904a04dee68	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
氟尿嘧啶	be3db7f7-f8b2-4413-85c8-51022a976047	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
精蛋白人胰岛素混合(30R)（精蛋白锌重组人胰岛素混合）	7144ad00-658d-463d-b419-05aff82b5c93	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
腺苷	190a677e-e5ec-47cd-b4d6-f9e8bef57d05	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
他克莫司	5c12b54d-5fec-4ecf-b8da-355ca7bb8d72	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
精蛋白锌胰岛素	12ab879f-4b68-48b4-9808-54e87c5bd5d9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
巯嘌呤	0bbbe552-2bff-440c-aaf9-e85ec3e864d1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
头孢丙烯	7a3d0fe8-853c-4744-bb1f-232a023d410e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
右旋糖酐铁	e41b9799-c4d6-456a-930c-bab06eebe7e6	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
达克罗宁	113e3553-2df2-4524-9357-ef460b7abde0	0	\N	\N	\N	\N	胶浆剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
维拉帕米	ba4e2256-a5b1-446e-ab59-eb1cf02fb463	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
替硝唑	13f06005-37b3-4337-bdc8-3851fba27216	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
促肝细胞生长素	4014d39e-ccd5-4ef1-b2a1-ba45586dddba	0	\N	\N	\N	\N	注射剂	\N	\N	限肝功能衰竭	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
地屈孕酮	ce99d4b1-9a0d-43c4-a164-43798fb6ddae	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
可乐定	49ec89c6-7a07-4fb8-8f45-294c8d85cb9d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
格拉司琼	9296f182-d439-4aa3-a57c-d14056fbc334	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
肠内营养剂(TPF)	c57e27df-ebc1-4f8c-a5a8-57cd7cf0fa39	0	\N	\N	\N	\N	口服混悬剂	\N	\N	限重症患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
赖诺普利氢氯噻嗪	fe6daa89-2a16-4d8d-bcad-ac151f8b0c56	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
阿司匹林	3f001c16-4e29-41f4-af1e-7c56a3531146	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
蔗糖铁	7eb9bb52-28a6-4be9-8f66-571de175fc01	0	\N	\N	\N	\N	注射剂	\N	\N	限不能经口服补铁的缺铁性贫血患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
哌甲酯	cf79bdd1-adc8-4eb8-9384-379bdfb5e074	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
红霉素	f3c34d63-e912-4213-9510-f4e31eeeea88	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	甲	\N	\N	\N
卡左双多巴（左旋多巴/卡比多巴）	2a045cd3-c562-4156-9932-c0d5599df912	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
复方角菜酸酯	bf325301-9401-401d-b7a6-ab9d06173e56	0	\N	\N	\N	\N	乳膏剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
腺苷蛋氨酸	19143cb1-5663-412f-bfac-49dcb3396f8b	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限肝硬化所致肝内胆汁淤积患者或妊?期肝内胆汁淤积患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
戊乙奎醚	c521f48e-48a3-4088-bc48-4b4909b3961f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
乙胺吡嗪利福异烟 乙胺吡嗪利福异烟Ⅱ	f468c1b1-508e-47dc-a0c3-40b23b3e8dbc	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
缩宫素	9225f7c6-5164-4ea5-b693-b0a4df18bc93	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
阿德福韦酯	c025dec6-e563-43e0-9d6a-b755981b46fc	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
两性霉素B	6d5de9bd-2f7b-4463-9325-3b0fc49cc3fa	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
甲地孕酮	498bd1bd-51a0-40fb-ae24-2763936459de	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
聚乙二醇	2cb5601a-e856-4383-838d-4267cbdb24a9	0	\N	\N	\N	\N	口服散剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
哌唑嗪	b32a95d5-a631-4269-9273-f2991d46e38b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
戈利木单抗	d86de17f-160a-44f7-8e90-203a5a6d1bc7	0	\N	\N	\N	\N	注射剂	\N	\N	限诊断明确的类风湿关节炎经传统DMARDs治疗3-6个月疾病活动度下降低于50%者；诊断明确的强直性脊柱炎（不含放射学前期中轴性脊柱关节炎）NSAIDs充分治疗3个月疾病活 动度下降低于50%者；并需风湿病专科医师处方。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
非布司他	d723ac45-c9c0-4be4-8cc8-8dcfe912f7a6	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限肾功能不全或别嘌醇过敏的痛风患者	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
西酞普兰	de9439ff-bc2f-4afd-b756-a70199e69dfa	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
右旋布洛芬	9fb8f42e-6170-4239-a886-49e5f558b0e2	0	\N	\N	\N	\N	口服液体剂	\N	\N	限儿童	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
氯化琥珀胆碱	24b64d44-e477-43e0-b99b-4192b5a2f95f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	甲	\N	\N	\N
异烟肼	1af148b0-c6c0-451e-98ba-d845ad5e0c98	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
尼莫地平	cf391a50-2dfd-4483-94f8-67a1e3bbb3f1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
对乙酰氨基酚	fcb4086b-7ec3-4c32-8b09-31644a90ec0d	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
班布特罗	0fd82af9-1c57-46ae-aaa0-c92fa0eb3b33	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
溴己新	893e09ca-93ee-47af-9786-e746e905b176	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
咪康唑	8bd79a7e-272e-4695-9650-7eea2b1998d1	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
二巯丁二钠	8895149f-7cee-4998-9208-e76427d54468	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
酚苄明	c5d23890-5911-4f3a-b487-89adb6a4c9c7	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
头孢唑肟	1d0ab812-38eb-47e8-939c-b9c52da45b1e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
阿托品	da4e0220-72fb-441e-9095-20b0a53cd87f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
人表皮生长因子(Ⅰ)(重组人表皮生长因子Ⅰ)	1211e5e0-46ca-4d10-af4f-51baa0a68c00	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
利福平	ec9ce08c-02ab-4824-8dbe-d8af5b99fa58	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
喷昔洛韦	bf46280c-6a1a-4f49-81a8-f287b87eeb1e	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
葡萄糖酸钙	f9f0292f-de2b-44c2-a892-beb9954234c2	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
氯苯那敏	286aa489-f38d-4390-9d54-cae68c91da41	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
格列齐特	41b1c423-19bd-4d92-87da-4fe38cfb1673	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
人生长激素（重组人生长激素）	e7e97224-0d67-4c85-a287-82abbc88f87a	0	\N	\N	\N	\N	注射剂	\N	\N	限儿童原发性生长激素缺乏症	\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
比索洛尔	32378eb1-31bd-4205-81ec-31ae4036c5cc	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
氨基己酸氯化钠	8b456f66-a154-46fb-84ef-15aafa4b50b6	0	\N	\N	\N	\N	注射剂	\N	\N	限治疗血纤维蛋白溶解亢进引起出血的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
维生素D3	868e9d1e-55d6-4207-b16c-90757ad95327	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
丙卡特罗	364ea813-b8f5-4175-8cf6-53dc7391f07e	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
莫雷西嗪	0677ed84-bfe3-483e-b910-aa782efca396	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
伊马替尼	1d30cf18-269b-46d1-91a0-b2a7b45585d1	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限有慢性髓性白血病诊断并有费城染色体阳性的检验证据的患者；有急性淋巴细胞白血病诊断并有费城染色体阳性的检验证据的儿童患者；难治的或复发的费城染色体阳性的急性 淋巴细胞白血病成人患者；胃肠间质瘤患者。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
枸橼酸钾	484ee205-74da-45ad-bee1-a9a09ced001d	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
吉米沙星	cdcf5d94-2a3d-4dba-8d8f-5fc254f6eaf0	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
曲马多	ce3c1eb7-8129-4a88-8bfe-2ca02b05d8eb	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
西替利嗪	ddf6b2a4-7996-43e0-a534-cd6d61ee9a6c	0	\N	\N	\N	\N	口服液体剂	\N	\N	限儿童	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
乙胺丁醇	1659118b-81fb-446d-aee8-ef3947484065	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
曲安奈德益康唑	c4f683bc-360a-4654-9a21-688a0f2850d1	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
帕司烟肼（对氨基水杨酸异烟肼）	1297ab72-4418-460f-adb5-f64460e47b91	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
沙格雷酯	5c2ba2cc-ac80-48fd-9928-c442ee55b6f3	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限有慢性动脉闭塞的诊断且有明确的溃疡、间歇性跛行及严重疼痛体征的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
阿莫西林克拉维酸	21c9fb99-3cad-4f01-a07d-a68809cbddea	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
腹膜透析液	6270dcf9-a727-41d7-a5ae-8ad777a181f2	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
炔诺酮	62800301-2ae9-422a-8fed-4e362d876080	0	\N	\N	\N	\N	丸剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
抗炭疽血清	4716f9e4-f894-46c8-9403-e0dfecc9b104	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
卡前列素氨丁三醇	38aaf12c-c80a-4ba3-a523-fe82574d5056	0	\N	\N	\N	\N	注射剂	\N	\N	限生育保险	\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
吡罗昔康	36f2bd93-62d6-47bd-8466-5e8aab5c5a66	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
亚叶酸钙	da2606f5-f967-4f7b-8fa7-2c458488fc99	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
多烯磷脂酰胆碱	959dff91-bc4c-406c-a843-f5afa2167cae	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
地塞米松	0643c0a2-8556-40f6-95d0-9c1a2a9f34cd	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
乐卡地平	c2e3b915-5861-4e2e-9e1f-84f6b2c7639b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
阿加曲班	daaac801-8733-4cbd-a63a-fc4f69518a1d	0	\N	\N	\N	\N	注射剂	\N	\N	限有急性脑梗死诊断并有运动神经麻痹体征且在发作后48小时内用药	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
可的松	8a798de8-ccc4-464c-924b-63a258685e08	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
青霉素V	6eb89045-e61e-4cfe-bc54-e525e4befcbd	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
硝酸甘油	5b152c63-da8c-47cd-9567-8a01f923348c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
丁酸氢化可的松	505fd3ca-5a7e-457b-8263-eb800bfb5088	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
对乙酰氨基酚	263b4073-30d6-4815-bf7f-d05194bf5b22	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
维生素C	b97addd6-02cf-4cd2-9a43-08b8467a4fab	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
重组链激酶	aaf2f271-6a42-4df5-a2c9-ce593a8602f9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
呋塞米	af5f2133-7c4e-4bdc-84b5-11c7edbb71d9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
甲硝唑葡萄糖	a49ab712-8618-4623-bddc-a572abbfa9a3	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
西格列汀二甲双胍Ⅰ西格列汀二甲双胍Ⅱ	73d71659-53b3-40bf-87d3-2886cd049636	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
银杏叶提取物	054f60a9-a93b-4065-b899-498ce12d7c23	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
叶酸	f597f2be-af17-42ba-890e-5769d8998c4f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
阿昔洛韦	ca72079b-da44-47db-be2c-bbddd7af3f37	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	甲	\N	\N	\N
妥布霉素	f8a7aaae-831e-4387-9c12-b9297efef4ad	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
法舒地尔	1986b7c9-920c-4fe8-beec-6a89f458c88c	0	\N	\N	\N	\N	注射剂	\N	\N	限新发的蛛网膜下腔出血后的患者，支付不超过14天	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
去氯羟嗪	74135193-9a15-429f-ab97-70b555ba8560	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
乳酶生	85086ab5-1673-4e98-b8a5-f5a9a7f5d770	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
替米沙坦	f4075637-aa11-404a-bbb8-884f5262847d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
庆大霉素	2ad1368a-d1e4-41a4-8e1e-3113e4953d10	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
雷洛昔芬	acd00fec-826a-48af-86ae-db4cc4c1e23a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
乙酰半胱氨酸	d2f353fd-eec9-4cd0-84c8-d906fc5d0b89	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
沙丁胺醇	f30290e8-cd84-45f2-b4ec-1d359b3cb3b7	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
奎宁	e2441fc6-d528-4a24-bfdd-4a313df74946	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	乙	\N	\N	\N
利福霉素	76521ea8-6398-455f-9204-6aa5f5f85d6b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
多塞平	6636773a-b7d0-4424-a9b1-efa6f0b8e7e8	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
氮?斯汀	b52d2e7c-591e-4052-a582-e4987b19c603	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
克林霉素	dbb8f938-382c-449c-b1ed-a8d6238f69aa	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
糠甾醇	e29db78a-7a71-4201-a594-782bc33980b9	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
利巴韦林	264c3150-18cf-42ba-a2e8-d3a2c841533a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
消旋卡多曲	04c3a933-6817-45bc-b0ba-c81c3d2f32de	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
磷霉素氨丁三醇	04eca51a-720d-446b-ac8a-adcf7fe6f063	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
比阿培南	b6a9eaf1-62bc-4c2c-b1d6-ca7a85d11f87	0	\N	\N	\N	\N	注射剂	\N	\N	限多重耐药的重症感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
法罗培南	eef703a7-2068-4776-bf8d-f30b093240cb	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限头孢菌素耐药或重症感染患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
羧甲司坦	9bba4eee-5fa0-4b71-93c3-b0297ade8cac	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
七叶皂苷	9baa1427-0337-4ca8-8f5a-9ad0e443e597	0	\N	\N	\N	\N	注射剂	\N	\N	限脑水肿的二线治疗，支付不超过10天	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
四环素	a7d36cbd-3575-4a44-b6b1-0cc8a2384b49	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
诺氟沙星	476c34ac-5e37-4334-9ef0-c43f2d7ec031	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
托泊替康	0545a08b-9dd5-4f6e-ab6b-d8e7d52d036f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
色甘酸钠	2a9a9c97-7a5d-4297-b3b2-9ff42e9a024c	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
卡替洛尔	f894530e-5812-4154-905f-ab5022a7639f	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
硝酸甘油	66c1c73f-2120-463a-be5b-6b41dafcb38e	0	\N	\N	\N	\N	舌下片剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
甲氨蝶呤	f8cb60b6-dd03-4f76-bf36-bb3b01c1975b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
加替沙星	4096df0e-6f8f-4de9-8208-a6186c6f7401	0	\N	\N	\N	\N	眼用凝胶剂	\N	\N	限二线用药	\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
布美他尼	8ec15864-899b-4a7b-bf2f-ab56650f76d9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
利多卡因	66ba97fc-8ba7-4e49-b2e0-143e2b9903c9	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
纳曲酮	09694f48-0e4a-44e4-be2e-709e629b8345	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
苯磺顺阿曲库铵	3e5a809c-1e0e-47cc-806f-212a4070ab95	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
硫酸亚铁	5c51a6c6-d255-4941-a497-01a4be911837	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
小儿复方氨基酸（18AA-Ⅰ）小儿复方氨基酸（18AA-Ⅱ）	b0683c4d-6c7f-4373-a1fa-4da2b4c09570	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
尼莫地平	f7976ba9-44aa-489c-99e2-ff2877dd983c	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
锝[99mTc]二巯丁二酸盐	c2d4c018-eed3-41b0-82ec-f0e75d0f1f48	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
异丙托溴铵	52393e53-c75b-4f11-8da9-665548f70495	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
利妥昔单抗	1a51e687-35ce-4b5f-ad24-461dfcc81632	0	\N	\N	\N	\N	注射剂	\N	\N	限复发或耐药的滤泡性中央型淋巴瘤(国际工作分类B、C和D亚型的B细胞非霍奇金淋巴瘤)，CD20阳性Ⅲ-Ⅳ期滤泡性非霍奇金淋巴瘤，CD20阳性弥漫大B细胞性非霍奇金淋巴瘤； 支付不超过8个疗程。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
奥美沙坦酯	8110eb7f-44cc-47ee-bce9-0f8d79cb582e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
头孢氨苄	606ea30c-3059-446c-80c6-5384b99b022f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
消旋山莨菪碱	1178d2e0-710d-4a53-aa23-48db19803757	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
双嘧达莫	78ac159a-9006-4b15-9783-468b3a996b6b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
舒必利	d7bce442-38bd-4bc3-8138-9d70d8b4bf4e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
肠内营养剂Ⅱ(TP)	2de278de-7dd8-4809-bbc5-c67dce1c55a2	0	\N	\N	\N	\N	口服混悬剂	\N	\N	限呼吸系统疾病患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
维生素A棕榈酸酯	f03a7c85-1f55-4337-a6e8-fc353d4fd476	0	\N	\N	\N	\N	眼用凝胶剂	\N	\N	限有Sjogren's综合征、神经麻痹性角膜炎、暴露性角膜炎的患者	\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
萘普生	8f0d1f69-0688-4833-977b-ee0ff1b6dd1c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
链霉素	61fb5132-7065-4406-90ac-7aed7572232c	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
来氟米特	4ccdc25a-d28a-496f-ad60-9e3856f8509f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
丁溴东莨菪碱	2ecd533b-0e14-47db-ad98-3da9a7456457	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
开塞露（甘油）	6f219e3d-31cf-4d21-90f7-116e52e1b794	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
重组赖脯胰岛素	fb632267-0358-401a-989d-0c37e3e6f5bc	0	\N	\N	\N	\N	注射剂	\N	\N	限1型糖尿病患者；限其他短效胰岛素或口服药难以控制的2型糖尿病患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
阿法骨化醇	24211eee-e170-45ed-b081-508f5bf151ea	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限中、重度骨质疏松；肾性骨病；甲状旁腺功能减退症	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
大观霉素	bedb3290-3b2f-4aea-aca9-3aba37f86bda	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
佐米曲普坦	bd1d05f1-5d18-4198-9526-851db7487b96	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限偏头痛急性发作患者的二线用药	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
羟氯喹	7eea6945-ceae-4744-bd8a-5a05fee2c351	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	乙	\N	\N	\N
赖脯胰岛素	d203e213-f396-42ca-ab65-0362f4e6d759	0	\N	\N	\N	\N	注射剂	\N	\N	限1型糖尿病患者；限其他短效胰岛素或口服药难以控制的2型糖尿病患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
阿扎胞苷	83573023-8f4d-47f9-a131-356d2208c4ae	0	\N	\N	\N	\N	注射剂	\N	\N	限成年患者中1.国际预后评分系统（IPSS）中的中危-2及高危骨髓增生异常综合征（MDS）；2.慢性粒-单核细胞白血病 （CMML）；3.按照世界卫生组织（WHO）分类的急性髓系白血病（AML）、骨髓原始细胞为20-30%伴多系发育异常的治 疗。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	 	\N	\N	\N
矛头蝮蛇血凝酶	8cb479fe-f514-4311-aa26-ef2f1945c0db	0	\N	\N	\N	\N	注射剂	\N	\N	限出血性疾病治疗的二线用药；预防使用不予支付	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
苯妥英钠	f956eab9-f095-4467-814d-c4631dc891f9	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
利巴韦林	7630009e-5fe3-4c6d-8806-57da9931c285	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
碘海醇	25f9abf8-fd74-4d87-bdbf-563b027d8149	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
替罗非班氯化钠	1f230546-1677-4843-aa5c-bf0277a1712b	0	\N	\N	\N	\N	注射剂	\N	\N	限急性冠脉综合征的介入治疗	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
帕罗西汀	0014bf8e-aa1a-488b-bbac-cd01f3ba6a6a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
氯化钠	ee0d5adb-4dba-403b-b466-de22a27c248f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
硫酸钡硫酸钡Ⅰ型硫酸钡Ⅱ型	829774cd-8c78-4510-a43c-f3e368f6c4ab	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
左氧氟沙星葡萄糖	44afe54f-d711-46cb-9011-d7b64329092a	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
环丙沙星氯化钠	8e48888d-465c-4d4a-b23a-234a22f9e294	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
脂肪乳氨基酸葡萄糖	959734c0-e2d4-45b2-8583-958288e3b7bd	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
布地奈德福莫特罗Ⅰ布地奈德福莫特罗Ⅱ	b9954599-b0f0-4252-9d15-2ce1a134fb6d	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
柳氮磺吡啶	dfda68c0-5f0f-472a-8158-a04f3c61e293	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
对乙酰氨基酚	2ac69b22-fbf7-47ee-8e2c-a2c3f68828b3	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
左氨氯地平（左旋氨氯地平）	8ab43dbf-3e8a-4c1d-8925-61ab9d9ca63b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
西罗莫司	7df60052-17e9-4b32-b070-18e0f654a3b1	0	\N	\N	\N	\N	口服液体剂	\N	\N	限器官移植后的抗排异反应	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
氟比洛芬	7ad2a6b3-a8cd-48e3-a7a9-4d2efca5eafb	0	\N	\N	\N	\N	凝胶贴膏剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
拉西地平	1d0b19a9-efd4-450a-84da-5fddc11f7975	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
丁丙诺啡	7fe02655-301e-422a-88a2-e18cbfd047fd	0	\N	\N	\N	\N	透皮贴剂	\N	\N	限非阿片类止痛剂不能控制的慢性中重度疼痛的患者	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
克林霉素磷酸酯	bbccd615-e05c-4470-a742-b7e672120772	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
乙胺利福异烟	c619cab7-4796-444b-a099-df98ad95a0dd	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
硫酸钡Ⅰ型	fc7d8270-e44e-441d-a8ec-eba34b007d16	0	\N	\N	\N	\N	灌肠剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
西格列汀	1a022cd5-82a5-4db7-9190-860e99521c21	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
乙酰胺	389c9458-71f8-4d6a-a509-e4e39c6602e1	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
利多卡因 利多卡因Ⅰ	dcb6151f-7f39-4324-bd80-ba55ce341e7b	0	\N	\N	\N	\N	胶浆剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
羟甲唑啉	34636ae4-04b1-46c1-8352-473b285f4864	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
艾普拉唑	e6c39778-a579-4196-a7f4-ea295385d7a5	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限有十二指肠溃疡、反流性食管炎诊断患者的二线用药	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
美沙酮	494c83ca-ea40-4d17-9b3d-6d4e1b3deb52	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
头孢呋辛酯	40cfa39a-3164-4e31-82a4-bfa7b7126000	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
赛庚啶	a604d829-f278-4b4b-9e48-42f1e63f2046	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
依帕司他	8fa89bfa-e593-46fa-80ea-5861823c5cd2	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
替格瑞洛	8d6ac7d4-bdfc-428c-b7ed-6b5a388be726	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限急性冠脉综合征患者，支付不超过12个月。非急性期限二线用药。	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
氟伐他汀	25ee3a49-4806-4c73-9308-9dbaee25c4ee	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
制霉素	cde5454b-7ae9-4419-87de-9ec54f4dadca	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
多库酯钠	e1b883f1-b366-499c-8229-32bfad7ac776	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
卡格列净	5d190511-90bb-48cd-9ac1-266a39fa262c	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药。	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
氯胺酮	56c4f71c-b5bb-45cd-af85-c8f8deb344d7	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
去铁胺	da459398-9f80-4b1a-807b-b03b2cb5341e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
贝美格	149a3809-bc7d-4a41-b6a9-bebb9cb92dcc	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
咪达普利	82e2095f-fc91-4321-bfeb-2e2fc2a913b1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
氯吡格雷	5893a5e4-4e8c-4f36-b5a3-ca729273c0c4	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
依美斯汀	1cc94882-f37c-4598-976f-c46dec140e22	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
鲑降钙素	2406fb81-0ef0-4096-8e24-dfb24d04d1e8	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
长春瑞滨	7d76d490-d279-4ec5-aeb9-619c714eb1ce	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
氯霉素	84b45779-c94f-4b46-b01b-760faae6286b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
那屈肝素（那曲肝素）	7a17e07a-ea77-46a9-a84e-36b240479865	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
复方异丙托溴铵	947b9944-8595-48bf-a519-e21a4da2b7bf	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
人白介素-11(重组人白介素-11)	8125ed70-b9fd-4464-b145-40ab8ad46927	0	\N	\N	\N	\N	注射剂	\N	\N	限放化疗引起的严重血小板减少患者	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
阿托伐他汀	b114a412-b51e-40ea-b792-bfdd3f966b46	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
氟替卡松	d5dde76d-b657-41f8-aa21-0a3d2b019be9	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
氟胞嘧啶	8e91cdea-0c29-46ae-bc7d-e77e560e4a79	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
人干扰素α2b[重组人干扰素α- 2b（假单胞菌）]	46fe8023-43a2-403e-a293-642244b017e6	0	\N	\N	\N	\N	注射剂	\N	\N	限白血病、淋巴瘤、黑色素瘤、肾癌、多发性骨髓瘤、丙肝 、慢性活动性乙肝。丙肝、慢性活动性乙肝连续使用6个月 无效时停药，连续使用不超过12个月	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
兰索拉唑	b78251f3-6470-48d9-a80c-6844b92a4d3d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
替莫唑胺	1af1ed39-0b17-4f22-884b-abfda7624e70	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限多形性胶质母细胞瘤、间变性星形细胞瘤	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
维拉帕米	f9dd0f75-a9ea-47d8-8816-32c0913c8570	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
缓解消化道不适症状的复方OTC制剂	8adffe6d-1bf3-4eaf-a672-b614b3d42f42	0	\N	\N	\N	\N		\N	\N	◇	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
氨苄西林	93c22530-f36e-44e1-842b-b5471b5bb413	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
二甲双胍格列吡嗪	57f01905-03c3-4f22-877d-a3212b432f26	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
他克莫司	112b107d-874b-49c3-82b0-55d83f8872f6	0	\N	\N	\N	\N	软膏剂	\N	\N	限中重度特应性皮炎患者的二线用药	\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
尼可地尔	ffed432d-1f1b-44a0-a7a6-e4cfd863b38e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
重组人促红素-β（CHO细胞）	340359ee-54db-4a2d-8bc8-7cf5e2e5cb7a	0	\N	\N	\N	\N	注射剂	\N	\N	限肾性贫血、非骨髓恶性肿瘤化疗引起的贫血	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
恩曲他滨	ee286cd5-878e-4213-b778-98ca53bb63e5	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限艾滋病病毒感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
紫杉醇	a23da25b-6a1d-4d1a-b8aa-cd60dc69166d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
胞磷胆碱	f9f3ff3d-aaaa-4d0a-8df3-1336d77ecf5d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
三磷酸腺苷	247349b5-8220-40bd-b8b3-6df2870095d7	0	\N	\N	\N	\N	注射剂	\N	\N	限急救、抢救	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
异福酰胺	f78a53c1-8513-4835-a0eb-8c3992ef5d9b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
伏立康唑	d01a6347-4cf6-449b-ace0-d327c8d778d3	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确的重度免疫缺陷诊断并发严重真菌感染的临床证据；曲霉菌肺炎或中枢神经系统感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
氟达拉滨	92596c35-5f03-4538-8ea6-af1125f76b9d	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限B细胞慢性淋巴细胞白血病或滤泡淋巴瘤	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
去甲万古霉素	03944944-8232-42ab-b702-8a275522122b	0	\N	\N	\N	\N	注射剂	\N	\N	限甲氧西林耐药阳性球菌感染；病原不明的中枢神经系统、心血管系统重症感染及菌血症	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
氮芥	62b1ac7e-a173-493f-9d3f-6cbd2b55848e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
甲氧沙林	8d8b0c60-da8a-487a-bd4f-fb6c3be952f6	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
替罗非班	363af88e-71b0-466d-99d7-1cf38e298f77	0	\N	\N	\N	\N	注射剂	\N	\N	限急性冠脉综合征的介入治疗	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
黄酮哌酯	bf70dfb9-0cf7-4d9a-b830-f305761c7ed6	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
环磷腺苷	b6a0d332-3a92-41f0-be6b-439dc6ff1502	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
托特罗定	a7428c4a-a1f0-436d-9405-ebce3b1fdb4c	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
羟基喜树碱氯化钠	6d786b0f-5f1d-4e80-825c-73094e416545	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
莫沙必利	86288df5-83c5-4eab-8362-be14b7852d9f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
多巴丝肼	9abcb59d-88ae-4149-9dcf-aa55c1fee4f7	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
单硝酸异山梨酯 单硝酸异山梨酯Ⅰ单硝酸异山梨酯Ⅱ单硝酸异山梨酯Ⅲ单硝酸异山梨酯Ⅳ	be0fbd68-aa30-42cb-97de-2a3b26bfc1ef	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
复方土槿皮	b4bc907a-0d8a-45d8-b0ee-3e1ac0477632	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
妥布霉素	94d81684-9978-4ed9-a1f6-689c416f6119	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
富马酸亚铁	04bd9eae-6e82-4b52-a562-169ee9ed5d31	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
糜蛋白酶	17006e73-66ec-47a8-a214-fdccbe8c2162	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
罂粟碱	e9d3074e-44a7-47ed-b7df-440942e06be8	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
硝酸异山梨酯葡萄糖	ce1d79c9-49aa-4833-ae57-cbe80b4b9c82	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
丙氨酰谷氨酰胺	5c45be7b-095b-4860-8f9e-55a410811cdf	0	\N	\N	\N	\N	注射剂	\N	\N	限有禁食医嘱的患者，并符合凡例对肠内外营养制剂的规定	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
吲哚美辛	c0e93f6a-d7f7-4a73-99b5-79c45ac2e0a0	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
氯苯那敏	af83154f-4f37-4444-a7a3-2eae77b054f1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
联苯双酯	541acf36-62f8-473e-b4c8-905728b7de87	0	\N	\N	\N	\N	滴丸剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
阿昔洛韦	24d267ea-81e2-42a8-92e3-aa6aba20a0bd	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
阿仑膦酸	c35cfbfa-61b8-44b8-99e4-1d134a5451e6	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限中重度骨质疏松	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
洛哌丁胺	c1d58478-225d-4267-afa6-4dd50fd5fdd6	0	\N	\N	\N	\N	颗粒剂	\N	\N	限儿童	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
班布特罗	132bfc0f-d960-49ac-8d38-164b37f9ec95	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
罗匹尼罗	1ef30b18-bad6-4fe1-8f07-65720d93daa8	0	\N	\N	\N	\N	缓释控释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
他卡西醇	c8ba4518-706d-428e-8981-9564254e4e6c	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
异戊巴比妥	33b91b23-b87a-4e2c-ac30-9f48612bd395	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
阿奇霉素	42834bbf-75b9-4bbf-b7df-d670d9b39049	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
氨肽素	57312516-aaa3-4d78-b775-a3c5859c4d23	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
司莫司汀	13f0381f-3ebf-4458-a2cc-64bc0e852b3b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
托吡卡胺	53252367-2188-4142-bb1b-ad57b151df28	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
格隆溴铵	0dd3375b-1c29-4d8a-a34e-6b9459deef14	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
维生素B6	cc084eb8-027e-4369-92d8-5e94d0f0df2f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
头孢地尼	f64c919d-6099-4e68-970d-c8287b3cc49d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
右美沙芬	dc678a9f-f70e-4ea8-9dfe-430b3d364c90	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
阿糖胞苷	2f57e908-7868-4e7c-afa8-e5dc134b02f8	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
丙硫异烟胺	887e1d58-0640-4573-9575-0b06c6381a99	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
特布他林	ad5b506e-68c9-4c06-98e6-ea730b73e828	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
可乐定	a316e025-1129-4eee-896e-177ac8154146	0	\N	\N	\N	\N	贴剂	\N	\N	限持续使用可乐定，且有因禁食、吞咽困难等无法使用可乐定口服制剂的患者	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
丙戊酸镁	c8e39e9a-03b8-4c36-adee-5ec8ad2a8dfd	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
加兰他敏	4fa520b7-987c-40ef-9fe5-911810567732	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限明确诊断的阿尔茨海默病	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
洛铂	4f881aee-1212-4b0c-bedf-40e0e36d7af9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
高血糖素	c0ea7858-c320-4dbb-8c27-4c499ba85537	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
阿司匹林	43b258e9-d36a-4648-af47-3cc3a2b2087d	0	\N	\N	\N	\N	肠溶缓释片	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
依美斯汀	a85d4309-b69e-4777-8090-a10ced7f05b1	0	\N	\N	\N	\N	缓释控释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
丙戊酸钠 丙戊酸钠Ⅰ	e92ad03a-5891-4c2d-b99f-1460af762712	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
卡络磺钠（肾上腺色腙）	b1297bcd-231e-4504-ac6a-37d8b35bf0ad	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
阿苯达唑	2514b2f2-942a-4666-83dc-ffd773117e0f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	甲	\N	\N	\N
曲安奈德	ae4f590d-6f11-499e-ad2a-ac8ca8157671	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
多沙唑嗪	17507a76-b326-4b66-ba71-b675c134429c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
多种维生素(12)	d9eaeb24-084a-4d7e-9ee5-9b9baea76c8b	0	\N	\N	\N	\N	注射剂	\N	\N	限与肠外营养药物配合使用时支付，单独使用不予支付	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
左布诺洛尔	5705c5dc-c53f-4133-83c0-0e8e645f13d2	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
烟酰胺	078b7f19-3473-45fd-ba7a-d49bedb1d12f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
吗啡	e9ce9a6b-854f-44d5-b834-c5ec1401e869	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
精氨酸	815cf266-b0c4-4efd-9f03-368fa8502aba	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
环丙沙星	35715ab1-9991-45d8-9570-724c67f423db	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	甲	\N	\N	\N
丙吡胺	891f2242-69f5-4eda-bda6-4c27d5283b02	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
沙丁胺醇	92f6cfbc-6a2f-4262-81f3-e77d3f19dd1b	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
精蛋白锌重组人胰岛素	a0c0d71d-3c4d-4357-920c-cd40b359720a	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
西甲硅油	d633c5e0-3412-4ea9-bab6-6508101bc2e0	0	\N	\N	\N	\N	口服液体剂	\N	\N	限胃肠镜检查和腹部影像学检查	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
氯己定	68c5d094-ae23-45da-9745-c462ca72ba49	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
双氯芬酸	bf92e0c8-4f47-40a3-9c3b-4607b8c6eda0	0	\N	\N	\N	\N	双释放肠溶胶囊	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
戈那瑞林	d4349a0f-9606-4482-91f5-b720f10ea18f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
乙酰唑胺	4de538fe-9c4d-417e-8250-59927b371c18	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
洛美沙星	60e1ad4b-481d-4266-bce4-d4c2388e17d0	0	\N	\N	\N	\N	滴耳剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
烯丙吗啡	cdbf7985-31eb-4120-97a6-2fa7cca96119	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
伊立替康	a665f598-2e6b-4fe8-8849-f62b5756da95	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
阿托品	2214882f-40f6-46f3-91a0-9f14a90adea8	0	\N	\N	\N	\N	眼用凝胶剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
富马酸亚铁	b307199b-4c06-4e4e-8974-6b2f441690b6	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
环酯红霉素	c8077d4f-886a-4ab1-989a-f384f8446e35	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
博来霉素	85d98e1b-9f39-4e8a-b610-a93cd06fef20	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
碘[125I]密封籽源	aa6ff267-9df9-49b7-a7f7-5c5bc60867ec	0	\N	\N	\N	\N	放射密封籽源	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
双氯芬酸	f91f6d47-f8a3-40df-a73e-462291722f10	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	甲	\N	\N	\N
泛影葡胺	c81e8835-23ee-471d-a5e5-2520769ac957	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
司坦唑醇	fd865f2f-1ad8-43db-9fce-87f9c205ddf6	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
羟苯磺酸	fa81bb93-f1a7-4d32-8c2c-75c01ce2f519	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
低分子肝素	7f47fc4d-115f-497e-92e5-899ecdb190d0	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
唑吡坦	d2fa6767-a4d0-411f-8432-721658f86689	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
多西环素	bd2e8070-8c26-44c9-8f10-145bd9655986	0	\N	\N	\N	\N	注射剂	\N	\N	限无法使用多西环素口服制剂的患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
奥扎格雷	501d84ab-ecbc-46d2-b117-657e83d06312	0	\N	\N	\N	\N	注射剂	\N	\N	限新发的急性血栓性脑梗死，支付不超过14天	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
毛果芸香碱	5d5d96b9-4de7-4d95-b16e-d99e4c128531	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
苯溴马隆	220025ab-a151-476b-8a42-975beaa0cc53	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
羟丁酸钠	ced6b767-8a0c-40dd-9add-946add62b61f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
布洛芬	3659ae76-8747-4ae2-a9e7-6c7bbb55608d	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
拉莫三嗪	249571e8-9aae-4370-9cfb-90c87eff496b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
维生素B1	5e4f8dee-10a6-4426-a578-be1612ffc1e9	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
两性霉素B	3a2ce272-20d8-40c6-99b9-f2e7a3c1fda6	0	\N	\N	\N	\N	脂质体注射剂	\N	\N	限因肾损伤或药物毒性而不能使用有效剂量两性霉素B的患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
多柔比星	e6ded48f-2aa3-479b-9ba4-1c5780e422d8	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
奎宁	846c0f39-ae5d-4e24-81e4-d6a03bf160d0	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	甲	\N	\N	\N
托烷司琼	25536548-408c-467f-98d4-1164446010e7	0	\N	\N	\N	\N	注射剂	\N	\N	限放化疗且吞咽困难患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
帕瑞昔布	af0f1ae1-ac65-403a-ad34-cc40ba244761	0	\N	\N	\N	\N	注射剂	\N	\N	限不能口服药物或口服药物效果不理想的术后镇痛	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
缓解感冒症状的复方OTC制剂	78809349-c03a-4441-88e8-a86389625a89	0	\N	\N	\N	\N		\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
地诺孕素	52a2673e-9a94-410f-aae7-f14f347cf4a3	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
哌替啶	f775c86e-2b55-4029-ac1d-5261e30e01c1	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
匹维溴铵	c4146837-8465-4aa2-ae0e-ab473cf258d7	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
结核菌素纯蛋白衍生物	99ed6e62-57a3-4182-953b-836ec9a4a6d1	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
齐多夫定	9f278730-b8a8-4ece-803a-0dfb25211068	0	\N	\N	\N	\N	注射剂	\N	\N	限艾滋病病毒感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
大蒜素	e365ea08-400a-42b5-98e4-24f0fc3c833a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
加贝酯	9573188a-1b78-4418-aba4-b8449e50455a	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
琥珀酰明胶	5ee62682-cafc-41c3-9863-c8019c0d2e6e	0	\N	\N	\N	\N	注射剂	\N	\N	限低血容量性休克或手术创伤、烧伤等引起的显著低血容量患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
糠酸莫米松	40d3660d-b038-4ad6-9a72-f6bf88f508fa	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
丙米嗪	de4400ee-b9ff-4658-812a-adbbfefcd342	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
泼尼松龙	03b11973-7031-4105-beb7-48763d451abd	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
六氟化硫微泡	530e7b1e-be25-408a-8f84-7e8a7a3fa343	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
头孢噻肟	85f756ba-3318-4bbc-8296-039b50291d93	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
氟西汀	147b6303-0686-43d0-9ea7-041a27cb9057	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
美沙拉秦（美沙拉嗪）	2424de42-58c4-486f-9c91-8de74df87ff0	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
硫酸镁	a7dc2db4-b1c3-441d-89a1-12e779187495	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
汉防己甲素	4a5b7191-909d-4d84-bd87-1a23b053af8d	0	\N	\N	\N	\N	注射剂	\N	\N	限单纯硅肺和煤硅肺	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
甲氧氯普胺	ae0e0caa-3b6c-41fb-a34d-0106fd3a1949	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
哌喹	395f9415-4f66-45fc-86bf-3ddd613944f7	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	乙	\N	\N	\N
右美沙芬	c50b8ef6-f7ff-4a51-baef-f1a2ee18643e	0	\N	\N	\N	\N	缓释混悬剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
泮托拉唑	394c3825-3906-4df7-a996-be3bde30ef62	0	\N	\N	\N	\N	注射剂	\N	\N	限有禁食医嘱或吞咽困难的患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
唑尼沙胺	a041b328-6948-4c6d-b054-04e5a0696907	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
维库溴铵	fc8dfc71-7bf2-4395-9b2e-07fe4fe64076	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	甲	\N	\N	\N
哌甲酯	aafd2c69-4921-44d4-ae47-b809e2e3233c	0	\N	\N	\N	\N	缓释控释剂型	\N	\N	限由专科医生采用DSM-IV诊断标准作出明确诊断的儿童患者	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
帕洛诺司琼	d62e20e6-bfc5-4360-a60c-dc730179f142	0	\N	\N	\N	\N	注射剂	\N	\N	限放化疗且吞咽困难患者的二线用药	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
开塞露	371a10e7-bada-4437-b468-7e0b5e3bef05	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
鲨肝醇	0f1ba3f6-2e03-4115-a891-34a48aed9ece	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
卡马西平	27cd0ca6-f7bc-4f85-ad53-62e980ce916e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
谷赖胰岛素	00187109-803c-4d6d-b840-50203d754af4	0	\N	\N	\N	\N	注射剂	\N	\N	限1型糖尿病患者；限其他短效胰岛素或口服药难以控制的2型糖尿病患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
泼尼松龙（氢化泼尼松）	67382fb7-a6a5-4c06-b21e-daf152e1ba9e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
环吡酮胺	48397b4d-c17e-4915-9f3e-31b254e9dda1	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
孟鲁司特	109f1a97-990a-43eb-b1a5-5328d063b23b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
阿奇霉素	2de37c69-2b2f-437b-a28c-fffd97a46b3d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
地蒽酚	097141bb-d2fe-4299-b550-b86634e711b6	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
水飞蓟宾葡甲胺	c9ead79e-3eb7-4e1e-bb43-6e922a5ec65d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
A型肉毒毒素	d4c2a373-8898-4c69-ad54-5375f07a6425	0	\N	\N	\N	\N	注射剂	\N	\N	限工伤保险	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
咪达唑仑	0780f832-bad2-4a12-907c-b46c921816bf	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
依沙吖啶	d3f2d1c7-9c51-4094-89ad-f31171e108e7	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
贝前列素	d0b8b49b-8d7c-4fca-bd1f-c51414603c0d	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限有慢性动脉闭塞的诊断且有明确的溃疡、间歇性跛行及严重疼痛体征的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
头孢克洛	8cf1225f-6603-415f-88a2-029e731ac684	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
色甘萘甲那敏	f0844ce8-c6a2-4795-a4ba-7f2db4ab5ca3	0	\N	\N	\N	\N	鼻用喷雾剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
精氨酸布洛芬	7d71668d-5789-4cae-a411-938481f846ae	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
埃索美拉唑（艾司奥美拉唑）	ccc86d89-162b-49ba-a169-0e7b782b61e6	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
利血平	b018bfbf-2a62-4499-8adc-9f9e5fe6e24b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
多种微量元素 多种微量元素Ⅰ多种微量元素Ⅱ	b89966d0-29bd-483d-b65e-6e994cfa0d76	0	\N	\N	\N	\N	注射剂	\N	\N	限配合肠外营养用	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
高三尖杉酯碱氯化钠	7dda7cff-9f5a-4d8e-b2ed-e11e5d6e2112	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
卡比多巴	e5d7cac1-9c5a-4857-b48e-7f6275dad063	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
福莫司汀	d41e3007-32d9-43a7-9e34-8093537f3805	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
门冬胰岛素	635c86f6-fb2d-4b46-a465-4100b90bb3ef	0	\N	\N	\N	\N	注射剂	\N	\N	限1型糖尿病患者；限其他短效胰岛素或口服药难以控制的2型糖尿病患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
哌拉西林舒巴坦	fe546f29-8df0-4292-9bcc-dd99030b6537	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确药敏试验证据或重症感染的患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
鱼精蛋白	a855b536-0b42-46a4-88e4-b0f3b9ff49e5	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
肠内营养剂(TP-HE)	4eb38892-adc8-4760-91ec-a03dd20b7572	0	\N	\N	\N	\N	乳剂	\N	\N	限重症患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
抗人T细胞猪免疫球蛋白	694adafd-e978-4451-8464-e385bc716c59	0	\N	\N	\N	\N	注射剂	\N	\N	限器官移植排斥反应高危人群的诱导治疗；急性排斥反应的治疗；重型再生障碍性贫血；原发性血小板减少性紫癜。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
炔雌醇环丙孕酮	462e0ac9-b695-43b9-858f-efd8b081d65e	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限多囊卵巢综合症	\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
维生素K4	bf999fc9-25be-4249-a857-972504c147fb	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
萘哌地尔	55b5fa25-1308-41fb-b15c-dd00627dd1c9	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
亮丙瑞林	0be69db9-57fe-4ba2-91bf-48be95db16aa	0	\N	\N	\N	\N	缓释微球注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
氨基葡萄糖	f0346121-a6aa-441f-85a8-7cc4f4c0e774	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限工伤保险	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
利多卡因	7fb81f5b-11f8-4528-87cd-6154567f707b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
地拉罗司	fbfcd6bd-c1ce-401a-ab63-8ed1f744c361	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
氯氮平	62ee65a7-0b38-4d7c-b8c1-ff4570bcda68	0	\N	\N	\N	\N	口腔崩解片	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
过氧苯甲酰	1193cb0c-9d94-4a07-928d-0bcd65c4202b	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
环丝氨酸	e1c73561-4e37-4011-a0c1-526be610d7d1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
汉防己甲素	0cdd02b1-6c2e-4250-9530-b58128f0f80a	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限单纯硅肺和煤硅肺	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
咪唑斯汀	51caddab-1f7b-4e95-b4fa-e9d5ab6049c8	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
罗库溴铵	3cd0de79-dd19-4030-967e-02a0278071e3	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
氟桂利嗪	73e12b46-47c4-48f9-9aca-265cb1700dda	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
卤米松	1cd9abab-b92f-406a-9563-c7e0b8e554df	0	\N	\N	\N	\N	乳膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
硫糖铝	70a57d31-dfd7-4f53-99e9-d8eeeb399fee	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
罗红霉素	872cb5bf-60fd-42b1-a275-a0371d48693a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
佐匹克隆	7489aeb6-4fcc-4070-9aad-e708f3a7953b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
人纤维蛋白原	0f0bff3e-a92e-4549-bfae-e8f0b7779507	0	\N	\N	\N	\N	注射剂	\N	\N	限低纤维蛋白原血症致活动性出血	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
平阳霉素	bfa9dc63-ddee-463f-92bd-197633ef7154	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
帕米膦酸二钠葡萄糖	52dd0d27-0772-4c28-95dd-cfd58ca3975f	0	\N	\N	\N	\N	注射剂	\N	\N	限癌症骨转移	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
喹硫平	a62b6ee7-b25a-4643-9368-f1e83d781aa4	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
丁螺环酮	caa08412-081e-4ed8-972e-1e1fa6c5602f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
地塞米松	96cda5fe-3584-42b7-b937-d6cfcd1fa8e9	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
人狂犬病免疫球蛋白	9a4c1317-f3bc-4f01-9b84-ef9648b02c18	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
二氧丙嗪	96373332-2593-4fea-8b63-ee534d577800	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
替加氟氯化钠	9c92c39f-a0d5-495d-bbe5-19dba932c2d5	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
沙美特罗	48678727-942e-4112-9861-209aa4bcf882	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
赖诺普利	fa9f5b03-8cf6-48b5-b64b-a273b1d7521a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
硫糖铝	e8292176-5edc-4a40-bb57-59c61298af6c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
雌二醇/雌二醇地屈孕酮	aae5aad2-3bbf-4e6b-8de9-0bfffa0d8390	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
碘克沙醇	f8c4fdf1-37c6-4cee-8079-e3dbf3e9ea7b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
美法仑	3237ce99-e275-4e78-8c52-febcc34ff5b2	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
泛昔洛韦	24bf9e96-f341-491f-b405-2a43fb230ec9	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
色甘酸钠	974c0e95-74e1-486b-8ad3-1a53ced7daab	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
索他洛尔	8bb424c1-11c4-47b2-9906-6c0413297e32	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
头孢克洛	c0548ea5-dfc4-4878-9aa8-b96a988c8187	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
达沙替尼	3ee8ff0c-192d-47bc-bf59-9f78210b0b12	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限对伊马替尼耐药或不耐受的慢性髓细胞白血病患者	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
硝呋太尔制霉素	a1922d7c-1c30-410a-a321-e06314ab44c0	0	\N	\N	\N	\N	阴道软胶囊	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
法莫替丁	5dd65e9a-f563-46f3-a012-0fde4edc4744	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
西尼地平	4eee6a3a-5cde-4065-97ea-b01c93ad5b95	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
酮替芬	08922706-8d98-4862-aed6-dbcca19b80d9	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
阿昔洛韦	e9c56a50-e17e-42e3-ac1a-f9e900602fd7	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
单硝酸异山梨酯	ec05c413-90ef-4501-b53c-004e28b63004	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
洛贝林	95741f49-1ba2-4106-b709-91507f42bbd5	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
普拉克索	a3649772-d37b-4b21-b276-be51a295a053	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
沙丁胺醇 沙丁胺醇Ⅱ	2cd9e34e-ba85-461c-bd49-775581a6a7b1	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
左奥硝唑氯化钠	21e35a62-631a-4f8b-bcb5-71ace7d0f3a6	0	\N	\N	\N	\N	注射剂	\N	\N	限二线用药	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
阿罗洛尔	88155307-0f98-4cf7-a646-7c1adcc49b3f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
林可霉素	ea36e517-1365-41cd-82df-b2bbc9c5e36e	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
曲伏前列素	9f941849-66c2-4938-a1cf-e4444600622b	0	\N	\N	\N	\N	滴眼剂	\N	\N	限二线用药	\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
中/长链脂肪乳（C6-24）	30bedfb6-0401-4a0d-92cc-8ecaeb7714ba	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
依西美坦	952b72aa-1173-4e6b-94e8-149c4564d671	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
醋酸钙	e4b015e8-24f7-4c28-b120-5d487b09261f	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限慢性肾功能衰竭所致的高磷血症	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
恩曲他滨替诺福韦	2217011f-9354-44af-984c-dbe83bbf7a9a	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限艾滋病病毒感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
氯喹	9fd75fb5-567b-4ed9-9b85-6d0bfb42f61f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	甲	\N	\N	\N
复方氯解磷定	2d9c473b-c1a7-4d32-a4aa-1cda8f4dfd70	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
环孢素	38218762-5c05-4890-8772-26480ba1f6a8	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
乳酸钠林格	9c27a3fc-60cc-4388-ac5b-a6dc0545c620	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
生物合成人胰岛素	b93ca822-26d2-49d4-9dfe-e9b5240f8202	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
甘露醇	c323e125-0d91-464c-9770-d87ff299a37b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
美司钠（美司那）	453b0598-f394-4e9f-bef3-e21ccec93b02	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
二甲硅油	cab6482d-ecd8-4003-9a22-e7417ba2aca6	0	\N	\N	\N	\N	口服液体剂	\N	\N	限胃肠镜检查和腹部影像学检查	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
氟哌利多	7ac84590-c783-402a-8e3f-dc554498427b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
美西律	33382013-f7c8-4936-a1b2-4e83432cb622	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
沙格列汀	61a0b389-e5ca-462a-84d2-33b1f0877881	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
环丙沙星	faed2c0f-d46c-4ec5-beba-c89771b80594	0	\N	\N	\N	\N	滴耳剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
环孢素	6ceed8c9-c13b-4e5c-bb0c-942f838b7c85	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
丙泊酚中/长链脂肪乳	67bfaf66-2c92-43dc-8535-5d67aecaa4eb	0	\N	\N	\N	\N	注射剂	\N	\N	限丙泊酚注射剂不能耐受的患者	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
替吉奥	0451c8ba-59f6-4ccb-9600-1d25dec1c34c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
异丙嗪	8c651f16-c2d9-4a84-a779-978a4729afc3	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
鱼腥草素	f8fb291d-a2f5-4e46-be7b-b299eecb0086	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
利格列汀二甲双胍Ⅰ利格列汀二甲双胍Ⅱ	a8225006-566f-4c31-a1a1-3bfbc1a01828	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
利扎曲普坦	6cd11e0d-245f-425f-8955-371d19e96089	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限偏头痛急性发作患者的二线用药	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
阿夫唑嗪	68d6e78e-f492-4e5b-9d30-33a92c06a48f	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
阿米卡星	ba85d5ea-c087-41ab-93fe-28c7663a2700	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
布洛芬	78ef8e87-6e4f-4e44-a6f3-be1526d3201e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	甲	\N	\N	\N
维生素B2	95e58ff8-56ac-4f7e-adfb-08cbf15f7b50	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
替硝唑	da92a631-f939-4bb2-9c22-bc5873a3ce75	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
抗银环蛇毒血清	55918f10-7c33-44e5-801b-4cf59ce18b7d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
格列吡嗪	e00befd6-09f4-4c27-9155-840044fb1776	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
普罗帕酮	98eceb43-5c69-4098-8b95-050498779bfe	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
羟嗪	6e3b8dc3-1325-43e3-bd7d-6c70c71bf3a2	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
复方利血平氨苯蝶啶	cdbdc518-8786-4057-957f-807e611549ee	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
多沙普仑	523f6a07-7b81-408c-8bf4-d91ebea669e5	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
烟酰胺	775ef11f-ec95-46e1-9772-eb38a0d53fcb	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
普芦卡必利	3b22b60a-9c55-4f3a-acd7-68c77d4e850f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
卡泊芬净	bb03e743-7fdc-4fc0-93a5-b73d60598dc4	0	\N	\N	\N	\N	注射剂	\N	\N	限三唑类衍生物无效的念珠菌血症；其他治疗无效或不能耐受的侵袭性曲霉菌病的二线治疗	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
溴新斯的明	f8b0953a-9a74-4f9a-95ad-1f95890e8c68	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
叶酸	71d5a0cc-5bb9-46a1-b1f5-862788da8bca	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
青霉素皮试剂	6f953d00-6c21-4a7b-aae4-ac3647261201	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
利福平	6307d844-e82f-45c3-8fe1-0990d01f16b6	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
青霉素	7e81b9e3-0253-4efe-ab7f-04b0d4c08204	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
碘普罗胺	3c4b723a-8e5b-47c8-9ad8-7c5df6147751	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
胶体果胶铋	be03802c-66f9-44cd-9ee0-4359dafcde06	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
奈达铂	467c5b02-cb2b-4b74-9acc-d5eecdf7efa3	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
吡柔比星	7e1b7e56-c4fd-44b2-9027-17bf9fe4f8be	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
替米沙坦氨氯地平	2a881a41-3614-4c6c-8e6b-d326a00ac679	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限对其它血管紧张素Ⅱ拮抗剂治疗不能耐受或疗效不佳的患者	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
维生素B2	5b642b4a-3b05-4a1d-80b8-ed963b468b44	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
瑞波西汀	847df253-b66a-4046-8cc5-b77c6c17c166	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
硝西泮	a67309c8-f1db-4874-8f30-9c389345dafe	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
七叶皂苷	4a3ab9a6-2bfa-4f42-a95c-050519f45714	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
氯普噻吨	5a5dcb8a-1b4c-4a2f-a947-7c103ecc9470	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
氯诺昔康	62228412-c2ac-402c-b5a4-805d10d8fcff	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
克林霉素	fd8980cf-5a1b-4f9f-bdfc-50ca74d18e12	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
纳美芬	f7943c57-1715-4dfa-9134-7ab84a134164	0	\N	\N	\N	\N	注射剂	\N	\N	限急救抢救	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
戊酸雌二醇	833b98e7-5fda-4c49-b888-10bddf1a62be	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
齐多拉米双夫定	815ce366-9df1-4787-ac4c-d67f854d3af2	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限艾滋病病毒感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
丁溴东莨菪碱	408defb5-d3fb-45ae-9344-61e0ec9e462f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
哌嗪	801873a0-780a-4dcc-8137-512d440c604a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	乙	\N	\N	\N
卡泊三醇倍他米松	0c034297-14a8-42cf-b935-0ffba2cd8ce5	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
中/长链脂肪乳（C8-24） 中/长链脂肪乳（C8-24Ve）	86285648-94d3-4bd6-916a-4953321d10b7	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
复方α-酮酸	5f6f949b-a46b-41a1-864e-95690d3266d0	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
复方利血平	2fcfc34c-4dd6-49bb-a586-90a61d8c53c0	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
肠内营养剂(TPF-T)	6617f10a-e2aa-4a49-a4c7-3065d1096a5f	0	\N	\N	\N	\N	乳剂	\N	\N	限肿瘤患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
阿立哌唑	abfb8764-182e-4ab1-ab56-03882e8fcc0f	0	\N	\N	\N	\N	口腔崩解片	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
人粒细胞巨噬细胞刺激因子(重组人粒细胞巨噬细胞刺激因子)	8f9dfa43-a391-4e2c-9cb9-a2cecb4bfd51	0	\N	\N	\N	\N	注射剂	\N	\N	限放化疗后的骨髓抑制	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
氟伏沙明	94e48a8b-843a-4993-9b52-7130240a407d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
磺胺醋酰钠	89343d3d-42c2-4820-a91c-4971370e3d74	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
亚硫酸氢钠甲萘醌	95759cb7-35f6-4244-b494-bcb8e51c9622	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
复方氯唑沙宗	eb3c5f93-1ddb-46ad-b15f-052c43ee0717	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
文拉法辛	73507f4d-6e6a-4ae3-ae4f-2a20cbbfca4d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
生理氯化钠	bf9b8896-3f33-4a34-9729-9876e61a9700	0	\N	\N	\N	\N	冲洗剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
精蛋白人胰岛素混合(50R)[精蛋白重组人胰岛素混合(50/50)]	6f4632c3-2ca6-43cc-81e2-57823b067e5a	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
锝[99mTc]聚合白蛋白	ead14ed7-d53f-495f-8eee-b98eee0b1fd7	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
奥美拉唑	1c04d150-5ad0-4742-b6a3-14c61c12a1dd	0	\N	\N	\N	\N	注射剂	\N	\N	限有禁食医嘱或吞咽困难的患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
羟苄唑	6c8db3f3-3ae7-48f7-9520-906c4bb4243a	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
乙胺嘧啶	9bad7588-2d52-48cf-87df-d70819bc74d6	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	甲	\N	\N	\N
长春瑞滨	c41d124d-20d7-4ae4-8a5f-ea455ae5b298	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
血液滤过置换基础液	f36dd139-a638-494d-855d-63a6804a28b2	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
阿昔洛韦	6712168b-622e-4397-a918-530e2fd84383	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
昂丹司琼	3545af98-248d-4f13-9995-fe52f28fb769	0	\N	\N	\N	\N	注射剂	\N	\N	限放化疗且吞咽困难患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
可待因	c697db06-b833-4af0-92f8-8b225f77f615	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
丙戊酸钠	fb80162a-197a-4af8-b228-fc01e3a173da	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
对乙酰氨基酚	a5e2c283-4fff-4aa6-9210-23df2c0e07f8	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
复方倍他米松	dee6b972-80e6-4c0e-a00a-b6b94b32b0ae	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
氯化锶[89Sr]	23e2ac18-fff6-4811-917a-5acc8b3a11f1	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
地氯雷他定	3a1f9a8c-9dc6-4750-a810-3fccc196b870	0	\N	\N	\N	\N	口服液体剂	\N	\N	限儿童	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
贝那普利氢氯噻嗪	f184a84b-9010-435c-8e73-23811e65d8b6	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
头孢哌酮舒巴坦	9ef00aff-2745-4564-9950-c3b0dbbf6d02	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确药敏试验证据或重症感染的患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
左旋多巴	de482d99-00b7-4b3b-9b46-85c2dfe08623	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
维生素D2	91070fe1-6ae6-48bb-a356-2d58c39af691	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
二甲双胍 二甲双胍Ⅱ	8aeeedb9-9ca9-4f3f-8277-a17bb2efec0e	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
非洛地平	bb4096b6-2e13-44cf-acc3-47962d07c23b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
司维拉姆	e9f23fa4-bfc8-4fa2-bf6d-c46f1493c6bf	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限透析患者高磷血症。	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
地西他滨	ea156db1-3f77-43fc-be3c-a666f05b8d6f	0	\N	\N	\N	\N	注射剂	\N	\N	限IPSS评分系统中中危-2和高危的初治、复治骨髓增生异常综合征患者	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
尼尔雌醇	4c38334c-cd8c-42e9-893f-97254752462f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
瑞巴派特	f01ba3b3-9cf3-43f4-a586-dcf1f25ec4c1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
阿莫罗芬	9ee0d4f3-aa40-4aeb-b942-ff8fe1318e1a	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
青霉素V	299351ec-8264-471f-b28b-04dac7b1b7ad	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
色甘酸钠	13c94614-2d0c-442e-aeba-155448c989a0	0	\N	\N	\N	\N	滴鼻剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
维生素D2	ec5dc550-f03d-4701-a8d4-09343f15c556	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
胞磷胆碱葡萄糖	eada2412-0592-46d0-a89a-16987da35866	0	\N	\N	\N	\N	注射剂	\N	\N	限出现意识障碍的急性颅脑外伤和脑手术后患者，支付不超过14天	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
米安色林	1b0be829-2805-4951-95a8-10ec4b737bf8	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
伊曲康唑	aed9bb0f-a0d4-45cb-96f6-58548b45174f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
复方甘草	c92d39cc-1f94-415d-8ae5-60191a873ac9	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
艾拉莫德	90973087-ea19-4e5e-b880-60fe0f06cdbd	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限活动性类风湿关节炎患者的二线治疗	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
奥美沙坦酯氢氯噻嗪	7291b592-067e-4d11-a328-6c6ce41a8c48	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限对其它血管紧张素Ⅱ拮抗剂治疗不能耐受的患者	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
普萘洛尔	d2a0f840-ad9d-4813-ae17-a10dd2cdd081	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
咪达唑仑	6af32ccd-a8c3-4a93-b271-7fea23ea331a	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
人表皮生长因子[重组人表皮生长因子（酵母）]	4ecaac4b-92b9-4303-b0f1-61454a40ce70	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
索他洛尔	eb8de808-740f-474e-bdca-e8bda3459aa0	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
坦洛新（坦索罗辛）	8945094b-fe4a-4cef-a25b-80789be3a217	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
塞替派	c95266ac-36b2-4497-9dc0-8602954d489e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
替硝唑	368b232b-e8f4-44df-b6e1-d43211190939	0	\N	\N	\N	\N	阴道泡腾片	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
硝酸异山梨酯	b22bba3e-8304-42a1-8015-5244b07d219d	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
柔红霉素	e8bab60f-66a9-4bc2-bafb-9694fd3f8dcd	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
奥卡西平	820d3672-c6a8-4ea7-a139-163cd767828f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
普罗碘铵	79860d7e-57c3-4b60-8db8-991e22f883d8	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
泼尼松	873fa76f-7d3f-46c7-aa31-4804f81e144a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
抗狂犬病血清	00c394ac-87ed-4e85-8dc9-d7934e61da7f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
奥美拉唑	23d29d16-3c6f-4d8b-8c25-57e6a1de6bd8	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
咪康唑	08530f3a-e1c5-483d-a907-0d07160ea696	0	\N	\N	\N	\N	阴道片	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
乌拉地尔	a253091b-3b35-4695-9c6c-dc9988f126c5	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
奥昔布宁	852d294f-98b4-412a-8bda-37d9296f6a95	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
托莫西汀	4794a446-ead6-42eb-ae25-22339ff9b38c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
门冬胰岛素30	f16b70bd-aece-473a-921e-b83e062a77ec	0	\N	\N	\N	\N	注射剂	\N	\N	限1型糖尿病患者；限其他短效胰岛素或口服药难以控制的2型糖尿病患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
利多卡因	7603b1b1-0189-4ac8-b974-f5bf56838bf6	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
法莫替丁	eb3e8ab8-f0fd-4891-b53f-7f3d55e5eec1	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
氯雷他定	98df0db4-dd87-41e8-8f0e-40270ac1b831	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
恩他卡朋双多巴 恩他卡朋双多巴Ⅱ恩他卡朋双多巴Ⅲ恩他卡朋双多巴Ⅳ	7df28461-a07c-47e1-8b31-329841f3f0af	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
扎来普隆	f185ddc1-3010-4482-a411-26db05792910	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
伊布利特	cd6708df-4efb-4c76-9eb3-0e7388e7d277	0	\N	\N	\N	\N	注射剂	\N	\N	限新发房颤转复	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
双氯芬酸 双氯芬酸Ⅰ双氯芬酸Ⅲ双氯芬酸Ⅳ双氯芬酸Ⅴ	7ae49495-f22d-4323-b5fc-c31cc81c86c9	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	甲	\N	\N	\N
多索茶碱	0043a09f-a392-409a-8442-26f0e2dd4d99	0	\N	\N	\N	\N	注射剂	\N	\N	限无法口服且氨茶碱不能耐受的患者	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
多价气性坏疽抗毒素	156b9a62-91b0-4420-bffc-5c9667788e1f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
苯海拉明	6edc40ee-5b04-47af-b462-8adcb0ddebe9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
人血白蛋白	42441b63-9e3c-472b-9953-9e29f773674d	0	\N	\N	\N	\N	注射剂	\N	\N	限抢救、重症或因肝硬化、癌症引起胸腹水的患者，且白蛋白低于30g/L	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
人白介素-2(重组人白介素-2)	461c3f90-af25-4fe7-a96d-62996a5a7989	0	\N	\N	\N	\N	注射剂	\N	\N	限肾细胞癌、黑色素瘤、癌性胸腹腔积液	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
聚苯乙烯磺酸	82d2f6c2-4511-4420-9397-0ed1645f1d13	0	\N	\N	\N	\N	口服散剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
伐昔洛韦	0ae0d1bd-ebf2-4054-9a99-8c4a2034d8a4	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
卡络磺钠（肾上腺色腙）	4127884a-ad18-42bf-aafc-425472d057e9	0	\N	\N	\N	\N	注射剂	\N	\N	限无法口服卡络磺钠（肾上腺色腙）的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
制霉素	d24d4981-025d-45a6-94b8-5578898050a0	0	\N	\N	\N	\N	阴道泡腾片	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
沙利度胺	9e8ab422-b5b7-49e0-8adb-a77f5e015bba	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
阿米替林	a817aa01-ff3a-4f9e-95b8-9d871995caed	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
青霉胺	8d9aad23-c7a7-45a0-acb9-3dded2fcb90e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	甲	\N	\N	\N
胞磷胆碱氯化钠	0d980f82-9cb6-4830-8964-2e671d185599	0	\N	\N	\N	\N	注射剂	\N	\N	限出现意识障碍的急性颅脑外伤和脑手术后患者，支付不超过14天	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
多潘立酮	f223e489-27e7-4c06-85f4-e4ea84798029	0	\N	\N	\N	\N	口服液体剂	\N	\N	限儿童或吞咽困难患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
布比卡因	800dda75-7dd6-4cd0-8395-7d46b5b1c1b1	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
樟脑	eff4dfaa-a23d-4e22-9132-e26dc01d012d	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
环孢素	6637b084-886b-472a-8045-c8097b72fd91	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
羟乙基淀粉130/0.4电解质	b682d654-3eee-40fe-b934-3517492d9b77	0	\N	\N	\N	\N	注射剂	\N	\N	限低血容量性休克或手术创伤、烧伤等引起的显著低血容量患者。	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
丙戊酸钠	aa9c94fc-382d-4360-9b0e-9a90dd48984f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
尼美舒利	3aa49666-c14c-4696-ad7d-a2b51943e03c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	甲	\N	\N	\N
奥洛他定	0141a9da-e1a2-478d-a244-43ad6c9856a9	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
罗匹尼罗	dd6020b8-10a0-4b65-91a4-f8f344872834	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
克霉唑	b56e7c6b-07c1-4bf7-b0c7-21553e595d57	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
舒马普坦	8709a7d7-2327-40cc-8252-16b699c0c200	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限偏头痛急性发作患者的二线用药	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
林可霉素	75738e7a-c5dc-4fc3-a945-de153135f034	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
钆特酸葡胺	a7ebb9cc-5b6a-48c8-9c97-166288238a58	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
硝呋太尔	91585452-daa5-496f-9d0f-f33e8349446e	0	\N	\N	\N	\N	阴道片	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
茶苯海明	04ceddca-f766-49ec-b363-b40a9db26017	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
利培酮	966baa54-dfef-4044-a72c-a85e59328c49	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
促皮质素	f3cc666f-cfa3-4078-b71e-e0426e410100	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
异帕米星	a101d2c0-ee6f-4a44-a326-648a8adf9f31	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
辛伐他汀	385f77ef-d844-4e9e-9e7b-439431db9940	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
氨酚曲马多	408c0bbc-4adc-4dbc-958b-7650227bc698	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
聚乙二醇化人粒细胞刺激因子（聚乙二醇化重组人粒细胞刺激因子）	e71aa144-deb7-49f8-a713-68ab553b962e	0	\N	\N	\N	\N	注射剂	\N	\N	限前次化疗曾发生重度中性粒细胞减少合并发热的患者	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
舒巴坦	d1d7f0d3-f7eb-4861-be3a-aaf57b3710f3	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
美洛昔康	85a69727-ccf2-4b1f-93bd-20cd810778c4	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
硝呋太尔-制霉菌素	064af4dd-da9a-4c57-91d2-70f5c8ae619a	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
亚甲蓝	28508fa9-8963-4699-839e-689bae10c9c4	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
奥昔布宁	3c902881-f8c9-459c-9fa3-4acd2d1c764e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
氟哌噻吨美利曲辛	b9fee002-6b9d-4bef-a462-f8676d3cc835	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
头孢克肟	f06003bf-b5bf-4815-a299-905340269490	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
头孢吡肟	80499c1d-8d43-46de-992e-e4b39ee2ddea	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确药敏试验证据或重症感染的患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
呋塞米	e0f9c35d-5be1-462d-be59-2594449777c8	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
重组人白介素-2（125Ser）	ffe77048-ee2b-4385-b967-583f41c32fe6	0	\N	\N	\N	\N	注射剂	\N	\N	限肾细胞癌、黑色素瘤、癌性胸腹腔积液	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
胰激肽原酶	f0a28a0c-6160-49de-abea-cb85ce7cdbfa	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限有糖尿病诊断且有微循环障碍临床证据的患者	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
咖啡因	80615577-ea55-4e6a-a9a0-06858a5d163b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
氯倍他索	6d277464-2bb0-403b-b443-111bbfaf9a48	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
硼酸	79eebfe6-27bc-4e25-9b00-14de96533833	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
精蛋白人胰岛素混合(50R)（50/50混合重组人胰岛素）	9085a66c-512c-4d78-ae48-83c3a503720a	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
复方磺胺甲噁唑	005cf800-fe9a-4abc-b8f4-5c74142fc083	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
洛芬待因	5afd97a6-7779-4ffe-a368-238ac939159c	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
伏格列波糖	8024cb2f-8582-4366-a4e7-085733346a49	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
复方罗布麻	ce0cac64-9063-419a-877a-2bb6a7ab01f1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
洛哌丁胺	0341d25a-3704-4738-9a1c-bf0b4f540ce9	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
布洛芬	c0440243-af0f-428b-8821-abd72bb140d1	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
阿普唑仑	1e311f95-e5d6-4463-8b1e-f7526a6974fb	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
破伤风抗毒素	59b9518d-1f28-4dab-8362-e71267802e11	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
氟尿嘧啶氯化钠	37751f9b-45ad-41b3-a302-ef95d17fd5ee	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
碳酸钙	66c5c92f-9eb8-4c00-92a4-708bc958011e	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
甲苯咪唑	20ede2d4-ad60-4a41-a30e-dd857499b4d5	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	甲	\N	\N	\N
胆维丁	2f2bdfa8-71be-4963-986f-efc0a6f50cc5	0	\N	\N	\N	\N	口服乳剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
罗通定	5ebdca15-043d-4d5b-8b28-35ae27239ea4	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
地巴唑	6cbf2c95-2662-4359-a230-19ae9c7bee99	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
艾司西酞普兰	c36480e4-8477-42b0-ab94-ab709b209df7	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
替加氟	daa7f7dd-7e4b-4a28-ab27-206d7ad828e1	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
复方氨基酸（6AA）	01628e03-ff62-4fb0-9170-66de2920adf9	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确的肝硬化、重症肝炎和肝昏迷诊断证据的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
氨磺必利	9fc45d5f-dfe0-4a9c-95a0-7760eef38a27	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
门冬酰胺酶	e472ba53-2e18-47a6-b53d-548643c2017a	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
放线菌素D	0df1142e-e599-4e90-acd4-548059d9e3d7	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
氟奋乃静	ef3ee56a-f5e5-4bed-841e-f3b79e17c192	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
奥沙利铂甘露醇	11dcc8c6-68da-402b-a818-55009605725b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
己烯雌酚	cbe5e28c-0e4e-48e4-a885-f51f4d11ff81	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
地高辛	05003c21-19dc-4755-af39-d1e4b741e1c4	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
氟康唑氯化钠	6af70f24-ff2a-45e2-87a9-9fc7914aee11	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
复方铝酸铋	5de39812-28b8-4a0b-8800-2651f06f38f1	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
地特胰岛素	ce67ca16-ed5b-406b-8781-1a9f04287a69	0	\N	\N	\N	\N	注射剂	\N	\N	限1型糖尿病患者；限中长效胰岛素难以控制的2型糖尿病患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
依那普利	386142f3-cc43-436f-88a4-87d6476cef4b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
非那吡啶	cad0586c-bd67-4cee-847f-dc7aa8471153	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限膀胱镜检查使用	\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
万古霉素	91155ae1-a4cd-4634-ba2c-2579f350b733	0	\N	\N	\N	\N	注射剂	\N	\N	限甲氧西林耐药阳性球菌感染；病原不明的中枢神经系统、心血管系统重症感染及菌血症	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
碳酸锂	7173c77f-340f-4f97-92fa-943dbaedcfb5	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
头孢替安	8b12466f-7fc6-4d16-b544-1899284a524b	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确药敏试验证据或重症感染的患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
苯巴比妥	39a7b5e4-bb11-4d2f-be29-57e79d62d411	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
肼屈嗪	8cf57b0a-d31b-44fc-9ec3-59ec3e4400b1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
抗敌素（硫酸黏菌素）	814ea120-759c-4233-829e-42ac71f6e8f9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
红霉素	9d4c1e56-1df4-4f5b-9a3b-108783471ff9	0	\N	\N	\N	\N	眼膏剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
氟比洛芬酯	de4ae0a3-c212-4c7d-a281-fc7c9b468335	0	\N	\N	\N	\N	注射剂	\N	\N	限不能口服药物或口服药物效果不理想的术后镇痛	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
牛碱性成纤维细胞生长因子(重组牛碱性成纤维细胞生长因子)	460b247d-b77f-4fbf-83d0-57a435a2a256	0	\N	\N	\N	\N	外用冻干制剂	\N	\N	限Ⅱ度烧伤	\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
哌罗匹隆	343f50a7-51b4-4cfe-9526-4a60146bfa9b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
依替米星	581b8d66-919e-415a-9bd4-692747429a42	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
人表皮生长因子(重组人表皮生长因子)	b877b82e-5cf2-4bdc-922c-9ebd2716fc31	0	\N	\N	\N	\N	外用冻干制剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
可的松	c1beafbd-4d00-4c6d-b2a9-6c9cb0714fad	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
培哚普利吲达帕胺	e8d4c77b-06b1-45c2-aa51-70ed6c7c9848	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
双羟萘酸噻嘧啶	5afff94f-9ad3-4f43-bd43-97bb716c670e	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	乙	\N	\N	\N
炔雌醇	974d48d7-8edb-4748-b612-00db27dda951	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
酮康唑	6e548214-f2b3-4510-ad48-5d5d5a4323f4	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
环孢素	d410fb78-38e3-444c-8a7f-14c9be97e181	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
二氢麦角碱	86cf9f52-1561-4385-8d89-f3f72233a6bb	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
氯膦酸二钠	1231715e-71f5-4826-a222-a3f420157ba3	0	\N	\N	\N	\N	注射剂	\N	\N	限癌症骨转移	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
人白介素-2（I）[重组人白介素-2（Ⅰ）]	f8684a5a-c3ca-4970-8198-37f142268e7e	0	\N	\N	\N	\N	注射剂	\N	\N	限肾细胞癌、黑色素瘤、癌性胸腹腔积液	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
环丙沙星	5fb56309-ed01-4793-923b-17012a43f5af	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
枸橼酸铋钾	2bed0abc-c0ce-4e00-b226-4e2717227e98	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
碳酸钙D3	7c94a242-35b3-4f25-bfaa-26a668f1e247	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
倍他司汀	bfdd96fd-5a74-4c8f-abc6-7a96bc7a3edd	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
维生素AD	bfe8503e-c64c-4701-964e-b1274f329e00	0	\N	\N	\N	\N	口服液体剂	\N	\N	限夜盲症、儿童佝偻病	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
荧光素钠	137abc9c-c4f4-4850-b6ad-50fad08a5689	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
拉贝洛尔	bd3994d3-097e-4897-aeb9-bb3dff44b096	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
米托蒽醌氯化钠	c8b19ea8-6d58-4301-9418-05800cfadb25	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
榄香烯	4e9a9c04-29e4-4903-9bee-aaafb0344bdd	0	\N	\N	\N	\N	注射剂	\N	\N	限癌性胸腹水患者	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
肠内营养剂(TP)	cef48f67-9112-4b6e-a2d9-ddd9704aa918	0	\N	\N	\N	\N	口服乳剂	\N	\N	限重症患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
苯海拉明	96076a49-19c1-4954-86e0-ee4609048f76	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
硝呋太尔	4f1bbccd-8fc4-4d06-9a3e-c99ab149e9c2	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
氟替卡松	5721331a-f094-45a4-95dd-7713a6ba61be	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
伊达比星	64945d7b-2870-4a65-a6d2-1e5981068c76	0	\N	\N	\N	\N	注射剂	\N	\N	限二线用药	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
多西他赛	47c6c7c9-c88a-475c-ba17-9c0c63cd5752	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
去氧氟尿苷	fac35b47-b9fd-41e9-8765-9505031a5d5f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
环丙沙星葡萄糖	75c5b571-7fb7-4f72-89fc-e826f27d0891	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
布地奈德	4cb95593-3b1f-4e79-8139-8dbbc16dc312	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
双歧杆菌四联活菌	d36e11d6-5334-4165-b505-7e3b142af33d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
吉法酯	3bedd967-81f1-4224-babd-1243d4e181c9	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
肠内营养剂(TP-MCT)	290785dd-bb4f-453c-b8f4-48864630201a	0	\N	\N	\N	\N	口服混悬剂	\N	\N	限重症患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
高锰酸钾	e25cb84f-6f0c-4bab-affa-dc19b6a47714	0	\N	\N	\N	\N	局部用散剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
氯沙坦氢氯噻嗪	9a21f2e6-7c9f-4b81-a964-9ed24ebc07c9	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
硫普罗宁	be53fbf7-416b-4cc9-9a4c-613a6a773989	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
联磺甲氧苄啶	33f6853b-65a8-4f35-ae10-04e13bd7846c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
地奈德	cf6a8832-87d2-4cfd-a474-1d88cf44d9ba	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
蒿甲醚	26df915b-a0b3-4930-a888-257a5234cdf7	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	甲	\N	\N	\N
氨溴索	6aa8bc23-ee4c-4311-88aa-bcb49aec5a42	0	\N	\N	\N	\N	注射剂	\N	\N	限无法使用氨溴索口服制剂的排痰困难患者	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
头孢羟氨苄	a499b13a-84e7-4998-8fc5-3cebf5f9860f	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
维生素B6	8c169d83-a3cd-40f7-b5f5-3b8427eb228b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
罂粟乙碘油	fdfa905f-87a4-4292-b689-7de0a2155f45	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
氨苄西林舒巴坦	026937bb-5ab3-46c1-b19d-9f38263e9be2	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
乳酸菌	0ae66915-f589-4760-968d-d17a83449c7f	0	\N	\N	\N	\N	阴道胶囊	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
他扎罗汀	c6b80e1b-6071-4173-9ada-a2d154f5f82d	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
西罗莫司	546a9f48-da45-48b1-bb27-52e7eeba631c	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限器官移植后的抗排异反应	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
左乙拉西坦	b05746f7-21ed-480b-82f9-df15e4021bd7	0	\N	\N	\N	\N	口服液体剂	\N	\N	限儿童	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
氧氟沙星	098ef9de-dd04-42a1-ab95-2b2430d68556	0	\N	\N	\N	\N	眼膏剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
别嘌醇	a8e4e4d2-7e05-4054-8025-9a1bd00abd9e	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
多巴酚丁胺	da14cdd5-90da-4ff0-870d-2dcb70242bc5	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
氯普鲁卡因	e0183f86-6e94-49d3-bde0-85428bb118dd	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
伊伐布雷定	9bd59c78-d242-404e-abd7-899f02f51b30	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
普萘洛尔	ed2c716d-bfa9-4aff-a068-0fcc2a58debe	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
利福平 利福平Ⅱ	b3cf273a-dabc-457e-a392-9e83433e5e58	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
己烯雌酚	4119a8a2-b6c6-42d6-ba7c-f3f387546717	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
坎地氢噻	ca9ad7da-4365-4996-bfa2-8aa8989be23a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
血液滤过置换液	ebe4bbb2-cdce-47e8-b036-1405f96f40de	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
罂粟碱	fc22f095-7b6b-4339-a08e-becea94e47e1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
头孢氨苄	b004ce12-1e58-4e61-bff9-d2e9b15bb18e	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
右美沙芬	9fec0b76-274b-4451-9cbf-6af789e1076f	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
依托泊苷	c756f11a-772c-4fda-b38e-e8970db836db	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
聚甲酚磺醛	4339c526-8004-41a3-9b93-fbe9c1c7dd10	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
重组人碱性成纤维细胞生长因子	e35ec383-082c-4a03-b1cc-a887004bf05f	0	\N	\N	\N	\N	外用冻干制剂	\N	\N	限Ⅱ度烧伤	\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
十一酸睾酮	7a65623b-6859-436b-a4dd-74730d9d3635	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
吗替麦考酚酯	00a9060e-b88a-4236-a378-e2c8719d0465	0	\N	\N	\N	\N	口服液体剂	\N	\N	限口服吞咽困难的器官移植后抗排异反应	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
甲氯芬酯	d5a549bc-bbe2-4955-9cc5-6ebfe64d8f71	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
葡萄糖	ddad634f-396b-4313-afd3-67276865beea	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
碘解磷定	d8e5a7c8-6a75-4985-af8e-9506f634a4dc	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
复方氨基酸（9AA）	100a0055-dd37-4e49-9ff3-1c04216cfe5d	0	\N	\N	\N	\N	注射剂	\N	\N	限肾功能不全的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
米那普仑	3aed573d-8c17-4caa-acdc-0586888e0e62	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
溴己新	008f4425-79a0-4bd1-afca-590ab017fec5	0	\N	\N	\N	\N	注射剂	\N	\N	限无法使用溴己新口服制剂的排痰困难患者	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
磷霉素	a73827ff-8556-48ea-b8b2-1f22db38d57e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
人胰岛素(重组人胰岛素)	3346eaab-dfeb-4453-81b2-7fc6ec350d96	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
甘油	a64a0fa2-0130-4f46-94b9-7cb192eb265c	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
金刚乙胺	f187cceb-2df9-438d-8178-85fa71b7e776	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
多烯磷脂酰胆碱	15ef7bbc-3e31-47eb-987b-b86edda97160	0	\N	\N	\N	\N	注射剂	\N	\N	限抢救或肝功能衰竭	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
环轮宁	ca477ae9-4cd8-4689-8d21-43239ba63082	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
胰蛋白酶	abe9fa4c-cc34-4b85-9568-f092b68c0225	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
氢氯噻嗪	b9628b2a-5807-4ea4-9f91-b9a8e828818c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
苯丁酸氮芥	b422f24c-7e9c-4128-a65b-20a8a8a6f592	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
双歧杆菌活菌	f59673e3-1a20-40a2-924b-a7bb5de975b3	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
阿达木单抗	3c67ebe4-94e8-4cb3-95af-98a3e9afd549	0	\N	\N	\N	\N	注射剂	\N	\N	1.类风湿关节炎。本品与甲氨蝶呤合用，用于治疗：对改善病情抗风湿药(DMARDs)，包括甲氨蝶呤疗效不佳的成年中重度活动性类风湿关节炎患者。本品与甲氨蝶呤联合用药，可以减缓患者关节损伤的进展（X线显示），并且可以改善身体机能。2.强直性脊柱炎。用于常规治疗效果不佳的成年重度活动性强直性脊柱炎患者。3.银屑病。本品适用于需要进行系统治疗的成年中重度慢性斑块状银屑病患者。4.克罗恩病。用于充足皮质类固醇和/或免疫抑制治疗应答不充分、不耐受或禁忌的中重度活动性克罗恩病成年患者。5.葡萄膜炎。本品适用于治疗对糖皮	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
卤米松/三氯生	6f77e8a4-38c3-4b8f-903b-0016443b2cef	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
地塞米松磷酸钠	e1587730-a12f-4066-8ad1-983cf9b5d18f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
羧甲司坦	6c802fe7-ca78-4e7f-be9e-d9a8117f15a7	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
单硝酸异山梨酯	37e24017-9c2d-4629-a498-993c5a4e2020	0	\N	\N	\N	\N	注射剂	\N	\N	限无法口服硝酸酯类药物的患者	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
右佐匹克隆	78dc068f-c785-4c42-a19a-033a06799902	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
咯萘啶	6881877d-79d7-409b-8506-fd6e6091bc52	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	乙	\N	\N	\N
美沙拉秦（美沙拉嗪）	647d4674-f720-43e8-9a23-e00b968b1578	0	\N	\N	\N	\N	灌肠剂	\N	\N	限直肠乙状结肠型溃疡性结肠炎急性发作期患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
头孢克肟	dc6ddce3-5955-4a8f-9b27-f1dec9ad7796	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
结构脂肪乳（C6-24）	5573d323-ccfc-4c09-a56a-6d53eb59a6f7	0	\N	\N	\N	\N	注射剂	\N	\N	限肝功能不全（严重肝功能不全者除外）患者的二线用药	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
葡萄糖酸钙	ba8c2f55-7e27-4b76-9aff-1fe4ca895e8b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
异维A酸	b3bf531d-0e81-4464-810e-6c3b1db3d272	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
复方氯化钠	4c40b649-910f-43d1-bbcf-fc40992f9def	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
小儿复方氨基酸（19AA-Ⅰ）	d39059e5-b44a-4b9e-80b8-53ba19281c8b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
更昔洛韦	87568f27-3c81-48ea-ad30-19abe8a5cfdb	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
舍曲林	df392081-c6c3-4643-b8e5-3105bc956062	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
右旋糖酐铁	bf43638e-2dae-49f7-b598-b0f9fb87f969	0	\N	\N	\N	\N	口服液体剂	\N	\N	限儿童缺铁性贫血	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
克林霉素棕榈酸酯	1115bff3-1df2-45e6-a686-2e4669665527	0	\N	\N	\N	\N	口服液体剂	\N	\N	限儿童或经口鼻饲管途径给药	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
依折麦布	0b0eac11-31ed-46ab-b4fd-a855c6eb4290	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限他汀类药物治疗效果不佳或不耐受的患者	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
重组人粒细胞刺激因子（CHO细胞）	9d54aeec-5098-4c4a-b44a-f7f12c29500a	0	\N	\N	\N	\N	注射剂	\N	\N	限放化疗后的骨髓抑制	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
泮托拉唑	5a3f9483-ca19-4153-bae8-2db71508ee7f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
紫杉醇(白蛋白结合型)	526c0f0c-9c29-4e8f-8256-dc49d64ffc64	0	\N	\N	\N	\N	注射剂	\N	\N	限联合化疗失败的转移性乳腺癌或辅助化疗后6个月内复发的乳腺癌患者	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
十一酸睾酮	1752c7c5-f720-43b4-887f-ff3fc27b1fbb	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
阿奇霉素	f52a8318-0490-43d2-a756-49f92a6040a7	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
琥珀酸亚铁	3dc37d3e-e4b0-41e5-9a1f-74b810f837de	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
舒林酸	e65192f7-b520-4089-b8fd-c320a09e42fa	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
克霉唑	9e7106dd-5909-41ea-aaac-6f22d56772b8	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	甲	\N	\N	\N
柳氮磺吡啶	5128b407-0f65-4f96-b7de-8a5b03d64827	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
富马酸亚铁	9c0ffe51-3fcf-43fc-b1f3-087a5e0207e1	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
头孢拉定	48e61457-1273-4600-a190-665105049624	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
双羟萘酸噻嘧啶	769ed26c-158e-470e-b36a-3b36fb44527b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	乙	\N	\N	\N
复方水杨酸	ab3bba88-1c95-4569-9dfc-dffd84d61050	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
甲氨蝶呤	f44efd04-610d-4e55-9ce5-d5f342f84603	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
熊去氧胆酸	f0bef686-885a-4673-bcf2-38adc0b32e46	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
氯解磷定	a13b9bdc-0af6-41df-8e39-d7f7e0cc119f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
双重造影产气	02173af3-7b52-448f-b31e-366d5437d521	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
天麻素	58987b75-187a-4bad-8bf8-7ab2908e69cc	0	\N	\N	\N	\N	注射剂	\N	\N	限无法口服的血管神经性头痛或眩晕症患者，支付不超过14天	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
氯膦酸二钠	2c62cdec-6c56-417d-8921-cc37c5530806	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限癌症骨转移	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
米诺环素	1926c438-fc24-4ac4-a0a2-79ea1828b4c3	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
替考拉宁	716f86ee-bca1-4ed8-8d69-fa44ee4019d2	0	\N	\N	\N	\N	注射剂	\N	\N	限甲氧西林耐药阳性球菌感染的二线治疗	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
氧化锌	469dd338-5937-4294-a03c-5ea0128c3613	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
氨溴索	4457a8d2-171a-482c-a7be-2ab066d785e4	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
妥布霉素地塞米松	48719cfa-8dac-42d9-bd3d-70e30da94b44	0	\N	\N	\N	\N	眼膏剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
氯法齐明	bc02fad4-8221-4313-8f7f-fc65522eec81	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
加替沙星	45a094ae-b6d1-42f2-a600-a4d7726e5b29	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
硝酸异山梨酯氯化钠	7ce6f768-5cc1-4ada-bc5c-ac33436ffa6e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
烟酸肌醇酯	a5aac4f2-cd22-4613-bdea-5dd4d5728b99	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
氨甲苯酸	ef135be6-afbb-4525-ba5d-ac91368ec6c7	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
奥司他韦	22cc5fdd-0e69-4c5c-b8b9-6a5b1fc906e9	0	\N	\N	\N	\N	颗粒剂	\N	\N	限流感重症高危人群及重症患者的抗流感病毒治疗	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
阿魏酸哌嗪	89f7ae55-796b-43f0-a00e-ab49f6a12c68	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
尼卡地平	4a142731-fdb6-4b03-aea0-cecf4a6e1c1b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
碘佛醇	fcb169de-1097-4069-b728-6e04262d92c8	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
西吡氯铵	5f2f6425-3935-4dd1-ae0c-9a2fb51ea1a4	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
沙美特罗替卡松	831a7a12-fca0-498f-b4a6-de0caa04b1e4	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
膦甲酸钠	c1c8ed11-b0aa-4948-8e36-5652e6ed2370	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
左卡巴斯汀	8c866e12-7cab-4e81-9948-7ed59b4cc905	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
辣椒碱	36820f81-271b-46a0-8337-e898222f2336	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
头孢呋辛	a8f2fdf9-b155-4708-9f2b-70ed4d5db873	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
伊曲康唑	983784ab-52e5-4050-998d-7d468b7a4507	0	\N	\N	\N	\N	注射剂	\N	\N	限重症侵袭性真菌感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
二甲硅油	640aeee1-a830-4531-a8aa-1d01580c51ef	0	\N	\N	\N	\N	口服散剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
人粒细胞刺激因子(重组人粒细胞刺激因子)	045a203d-d29d-4f3f-afaf-dccfa9487715	0	\N	\N	\N	\N	注射剂	\N	\N	限放化疗后的骨髓抑制	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
艾司唑仑	b6d2f1ad-e7a0-48ad-8a97-13e018034e90	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
卡泊三醇	4517dcf4-c34d-47bd-99d2-e00319197a53	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
达那唑	5d44a06c-6177-44ad-9b5c-039c8e0539c6	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
对乙酰氨基酚	609c3be4-2bee-48bf-a429-3387800e850f	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
高锰酸钾	a6292af7-61e6-495b-a2a8-91799b632621	0	\N	\N	\N	\N	片剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
普罗布考	37669712-938d-4930-828d-c731c7a42cfd	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
榄香烯	b7dca4bc-51b9-4e02-b3c4-2b2ca0c977de	0	\N	\N	\N	\N	口服液体剂	\N	\N	限晚期食管癌或晚期胃癌改善症状的辅助治疗	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
多奈哌齐	741f2022-06b0-4d63-969a-c33378e75899	0	\N	\N	\N	\N	口腔崩解片	\N	\N	限明确诊断的阿尔茨海默病	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
地塞米松	3892ca2a-9361-4bfa-b989-24fe6bfaa1ce	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
缬沙坦	8d21cad0-ae35-4437-8930-776b1b9f04f8	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
维拉帕米	8cf874c8-fa4f-469f-9a3f-4f3b840374e2	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
羟喜树碱	6b068a47-6319-4193-a6ab-c88ec9f49127	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
金刚乙胺	ed2163e7-8fcb-4c97-94ef-fca2a599db85	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
黄体酮	95e3d3fe-9041-41fa-a54a-36baa7d8d558	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
枸橼酸钾	8220203e-e015-4cd2-ba9f-5c84649521d3	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
琥乙红霉素	b4037b0e-8a54-4b6b-838f-8abaac1ddd51	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
他克莫司	da7c71cf-e714-4e71-8715-0a00d0dea326	0	\N	\N	\N	\N	滴眼剂	\N	\N	限有眼睑结膜巨大乳头增殖的患者	\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
氯化钾	11a24332-d1c0-4dd1-b32d-2813728b60fc	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
琥乙红霉素	110643a4-a2e5-4819-9b28-781ae16ceca0	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
硼酸	bd763b9c-3a71-4a30-9add-6bd29dcba029	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
水溶性维生素	81db1273-78a3-4a75-b758-52c581c5f814	0	\N	\N	\N	\N	注射剂	\N	\N	限与脂肪乳、氨基酸等肠外营养药物配合使用时支付，单独使用不予支付	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
丙酸睾酮	891bbbb4-4e7b-4c30-85af-03c0f610e2ce	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
山梨醇铁	e7237760-4439-44f5-90b2-52db5905a579	0	\N	\N	\N	\N	注射剂	\N	\N	限不能经口服补铁的缺铁性贫血患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
哈西奈德	cce7bd6a-5f58-4bdb-839b-d18b556536fb	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
氟尿嘧啶葡萄糖	8e1b97d4-7acf-4c62-bdca-32521ccfc14e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
劳拉西泮	1787bb17-19be-4bf4-9a8b-cf31f5b14018	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
利托君	349eb1f0-fa42-4409-b21a-11c8b43a0f38	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
诺氟沙星	440b7245-b2db-4990-ac71-b8d07004ae4d	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
利巴韦林	50c570be-71fc-4078-9cbe-4f6ccd586cd1	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
曲马多 曲马多Ⅱ	c6b4f0f3-f469-4532-bf95-9dbca6cb32c9	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
重组人Ⅱ型肿瘤坏死因子受体-抗体融合蛋白	6070ad12-d647-4dcf-b1dd-67cab5208c09	0	\N	\N	\N	\N	注射剂	\N	\N	限诊断明确的类风湿关节炎经传统DMARDs治疗3-6个月疾病活动度下降低于50%者；诊断明确的强直性脊柱炎（不含放射学前期中轴性脊柱关节炎）NSAIDs充分治疗3个月疾病活动度下降低于50%者；并需风湿病专科医师处方。限成人重 度斑块状银屑病。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
孟鲁司特	173ec926-6bb1-4d2d-b9a0-a25aba4a989d	0	\N	\N	\N	\N	颗粒剂	\N	\N	限儿童	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
头孢唑林	3b81cdb5-97d1-4ba6-b262-0fc2f8268b50	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
尼群洛尔	ec5465b7-0301-40a0-bc80-58199b2a1e8e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
人干扰素α2b[重组人干扰素α- 2b（酵母）]	d0511346-4faa-446e-a076-93ffb8c80f3d	0	\N	\N	\N	\N	注射剂	\N	\N	限白血病、淋巴瘤、黑色素瘤、肾癌、多发性骨髓瘤、丙肝 、慢性活动性乙肝。丙肝、慢性活动性乙肝连续使用6个月 无效时停药，连续使用不超过12个月	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
奥美沙坦酯氨氯地平	e07778de-201f-46de-9eac-0ae1d6fae6bd	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限对其它血管紧张素Ⅱ拮抗剂治疗不能耐受或疗效不佳的患者	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
氯喹	8e5bc760-3514-41be-b8ae-d64c2138db91	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	甲	\N	\N	\N
左西替利嗪	0cc38d3f-6a92-41a7-be44-cc1eb10a75d0	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
雷米普利	2a9ed385-ee32-4265-ba6a-db109537cd44	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
莫西沙星氯化钠	68d87698-6617-4893-a6ee-79c130104f77	0	\N	\N	\N	\N	注射剂	\N	\N	限下呼吸道感染、社区获得性肺炎；有明确药敏试验证据的如下感染：急性窦炎、复杂性腹腔感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
那格列奈	721f2ea4-374d-4940-8936-f222a238f172	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
羟考酮	e7b4e533-9685-4d74-946c-552a50451db5	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
氟康唑	8553f492-acba-4261-8a8e-95322d85a7f0	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
诺氟沙星	1e810252-f18e-4f0b-ae4b-11b10205b7a5	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
胰激肽原酶	85de97c8-1cd7-4a72-b64e-8c684b71e187	0	\N	\N	\N	\N	注射剂	\N	\N	限有糖尿病诊断且有微循环障碍临床证据的患者	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
维生素A	d2b64ebd-14d1-48a4-ae3d-b08b10b53f95	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
桉柠蒎	c81c709f-5ac8-461e-a3ea-edf76f61c3b9	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
噻吗洛尔	885fa86b-b3a0-4dcc-a303-5482abff507d	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
乙酰半胱氨酸	b98dfe30-1718-4512-a760-655f6e9f8988	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
法罗培南	598dcb57-bee6-4aea-b43b-e584ca98978a	0	\N	\N	\N	\N	颗粒剂	\N	\N	限头孢菌素耐药或重症感染儿童患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
钆贝葡胺	b23655e7-327b-4785-a534-74a00c2ec9e0	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
丁卡因	7034d224-50a1-43ec-8a80-abaf84c8f283	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
二甲双胍	44dca08f-5ea0-4d3b-83e8-3c86f2aa46d5	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
米多君	0f367494-afdb-4873-9e5e-94f3023c86be	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
硫酸锌	373c019c-099c-4529-ae70-055b61fcc9b3	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限有锌缺乏检验证据的患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
头孢克洛 头孢克洛Ⅱ	02b9e356-d276-4f65-9eb8-bf15317c543b	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
利培酮	6195d368-22a6-4638-a9f5-da8abc4a6217	0	\N	\N	\N	\N	微球注射剂	\N	\N	限不配合口服给药患者	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
吲哚菁绿	2f3f056d-f4c7-4a5b-9ec0-7fa0445c26cd	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
甲硝唑	7f07b9da-d0d6-44b8-8c29-cf240d9a6a75	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
氯丙嗪	366ea417-391a-4606-96d1-9e6ba8783249	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
颠茄	8168fc59-4fb2-451d-bc10-e1bd7be5be0a	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
三氟拉嗪	1977fd26-a26f-4573-a81b-8c86f73a4e23	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
还原型谷胱甘肽（谷胱甘肽）	f4c2cfb7-1fba-4d42-acd8-1ed6fb9031cb	0	\N	\N	\N	\N	注射剂	\N	\N	限药物性肝损伤或肝功能衰竭	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
阿曲库铵	3eaf9271-86f5-438a-90db-b3d3c725591e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	甲	\N	\N	\N
瑞芬太尼	10341033-8800-455d-90b2-9fd5178da910	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
坦度螺酮	a66b117a-a65e-4690-885d-2c525a96c957	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
肝素	4f4d6789-6e5a-4dcc-9b4a-9fc233c7c512	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
毛果芸香碱	327d2e6a-1ad8-4657-8d6a-ec359d235132	0	\N	\N	\N	\N	眼用凝胶剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
复方乳酸钠葡萄糖	6c0bd706-b9bb-467f-a975-f8f7ff045be8	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
布洛芬	5942bdba-183c-408e-9610-44c8c62b035d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
克拉霉素	1f6c269e-49be-4180-926f-026edb8f1f49	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
阿莫西林克拉维酸	e0b48792-c3d7-48cb-ba31-921291c100c8	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
曲普瑞林	b893ac74-2dd4-4756-8372-6c144fe91fdc	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
氨甲苯酸	995ee122-86ad-42fa-a10a-40e03462304f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
吲哚布芬	f8018cfc-87a4-4717-9229-30523513f844	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限阿司匹林不能耐受的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
环丙沙星	88a63896-8549-4ea3-b3f0-1ae9dfe29cf4	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
米氮平	a5935f33-29c1-4b88-92d0-5ef6cb55a201	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
毒毛花苷K	2a2764a1-fe36-4c5d-b481-49e4dd69f500	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
双氯芬酸二乙胺	72dc3be0-ac42-47f7-8951-44e0cb300946	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
长春地辛	b2f3badd-1954-4312-a8fb-b66e58c7a775	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
夫西地酸	2a029e23-a20e-4fcd-994d-84ad6ba1a271	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
复方甘草甜素（复方甘草酸苷）	dd719f0e-703c-4de9-9947-a7d34c028314	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
地尔硫䓬	d38c20bf-7259-44e5-bb23-6ce86ce2450f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
右美托咪定	89aa212a-6180-40e5-9c6f-26a9fd9e2f10	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
氨茶碱	7b8bfdae-6407-4797-85ba-9b26fb4ef676	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
乌拉地尔	13439afb-d7f0-48c2-b188-362d5d9c4f60	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
伏立康唑	d82b7349-bf36-4ddb-9d36-bdbddac7df64	0	\N	\N	\N	\N	口服液体剂	\N	\N	限有明确的重度免疫缺陷诊断并发严重真菌感染的临床证据；曲霉菌肺炎或中枢神经系统感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
溴芬酸钠	61a65276-b993-4b1d-b3e3-09628e518a69	0	\N	\N	\N	\N	滴眼剂	\N	\N	限眼部手术后炎症	\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
阿维A	78c3104f-f9d6-4363-a03d-b0a432d7944c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
米格列醇	f0603f58-f5bd-46f2-819e-4f1edaa7f07a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
氢化可的松	df273bc4-7165-4c21-8e55-cd666dc3ba73	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	甲	\N	\N	\N
尼莫司汀	3f399a17-c8e5-42b1-bede-5a7aa75f5133	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
玻璃酸钠	0a8270b9-e37c-4457-88f8-5b742581add2	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
氯化钾	6a79924d-7bd9-45a0-b449-0c0fbbc2a493	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
复方磺胺嘧啶锌	21a595ec-032d-4b97-a653-efe1081057cf	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
氨溴索	d0b35ed7-b832-4d52-a6f3-6d55f6134b7e	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
利可君	9322fedc-0a4f-4026-8731-38a62f2f6f86	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
鲑降钙素	33ff6772-dc98-4bef-9e83-caf54546c2fe	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
制霉素	e4c0bb34-88c7-4f0f-91fe-c352cceef920	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
氨基己酸	3046ace2-dda7-487c-9036-360b945a4853	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
阿立哌唑	db2671f9-9353-4b5d-ace9-15f2a29ff1d0	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
帕米膦酸二钠	9e7e1fe3-83a4-4bfb-b939-dbd3ec4f9d8b	0	\N	\N	\N	\N	注射剂	\N	\N	限癌症骨转移	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
格列喹酮	2e4ff25f-d344-4cb6-b9ff-0135f4a3c35f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
锝[99mTc]亚甲基二膦酸盐	99ab1ea3-e9c8-4b21-961d-90805ef7babc	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
琥珀酸亚铁	48d5587f-3d38-49ac-aeda-3b493335b68d	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
非那雄胺	3afbb416-6e7f-4c92-bcc2-2c0ddf9fafda	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
金霉素	d2e7dc51-4c95-4c07-9e01-b87f228ee497	0	\N	\N	\N	\N	眼膏剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
谷胱甘肽	6cb5f43d-c732-4888-afeb-fb4ce1a03295	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限肝功能衰竭	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
双歧杆菌三联活菌	ba59a961-96bf-4c86-8e56-00f7f5529379	0	\N	\N	\N	\N	口服散剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
肠内营养粉(AA-PA)	356386e3-1ddc-4cae-b97b-9e3d1014faab	0	\N	\N	\N	\N	口服粉剂	\N	\N	限经营养风险筛查，明确具有营养风险的1岁以下住院患儿 。	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
包醛氧淀粉	babaa1f8-87b8-406b-9e74-c579183c420e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
地西泮	6303bdbd-e19c-4a86-ab21-9f2c0b7ba6e9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
头孢硫脒	38420aa2-862d-4d4a-9c28-1eb8551b3cbd	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确药敏试验证据的患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
丁卡因	e05e7f9f-f3ad-4dad-b904-aa2fb3c3a4b4	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
瑞格列奈	9552da07-ca78-4c16-b351-7602aae992a8	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
水杨酸	d4d266a6-aa05-44dc-94b2-238412490a1a	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	甲	\N	\N	\N
复方氢氧化铝	7fb64b95-3b71-4540-8b00-16360e3d008e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
阿比多尔	f5b6d12f-1609-40ec-8aea-2047511fa20f	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限重症流感高危人群及重症患者的抗流感病毒治疗	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
曲美他嗪	8ad7a54b-c537-41d2-943e-94116a2b143e	0	\N	\N	\N	\N	缓释控释剂型	\N	\N	限稳定性心绞痛患者的二线治疗	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
普瑞巴林	5f3b3716-333f-480e-b876-388760324abe	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
纳洛酮	6ac38ba3-3394-4dba-b3f8-ee5a569f7301	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
复方氨基酸（15AA）	4bc98e60-6c35-415c-928f-7df5e2aab6cf	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确的肝硬化、重症肝炎和肝昏迷诊断证据的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
硫鸟嘌呤	6ebed97e-fba0-433a-8029-922e59295700	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
缬沙坦氢氯噻嗪	2d04f97e-5397-4057-99f0-02398e88d3b1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
碳酸氢钠	1e3484af-5b89-4aef-8261-4f9ef0b9bc36	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
洛芬待因	92182409-8845-4032-a063-0c547a357bc0	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
蒙脱石	7dcaa568-d02e-4960-9003-bff4f8ac07a5	0	\N	\N	\N	\N	口服液体剂	\N	\N	限儿童	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
利鲁唑	253fd2c5-4952-44cd-89d5-2d8256224f92	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
硫糖铝	17b9c024-0f14-4212-9948-a650288c28e1	0	\N	\N	\N	\N	混悬凝胶剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
普罗雌烯	cc0aa9d4-15b5-4fd5-ac00-2f5951547e81	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
氟尿嘧啶	af184b2b-26d9-4e80-8a2d-83fdea97b4ba	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
生理氯化钠	258048a0-3c64-4f3d-8ad7-9b278fc17d9d	0	\N	\N	\N	\N	溶液剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
维生素K1	2482d23f-f612-42d6-85fb-da1f70145f02	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
替加环素	b1809167-37f6-4ecc-8e1a-cfe35456e9cb	0	\N	\N	\N	\N	注射剂	\N	\N	限复杂性腹腔感染、复杂性皮肤及软组织感染、社区获得性肺炎的重症患者，以及多重耐药的鲍曼不动杆菌或碳青霉烯类耐药的肠杆菌感染患者（不包括中枢神经系统、尿路感 染）	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
蒙脱石	a804ab83-7136-48f7-856b-800cd3906a3f	0	\N	\N	\N	\N	口服散剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
赛洛多辛	243f32d0-f539-41c3-bdb7-fb64fb264d3e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
帕罗西汀	3e001c32-a464-4fd8-b1ba-a7009db3ad31	0	\N	\N	\N	\N	肠溶缓释片	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
舒芬太尼	41343537-03ea-408b-8faa-9f176a1893dc	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
吡美莫司	6504bffc-825d-4c53-9db3-15da95e945e9	0	\N	\N	\N	\N	软膏剂	\N	\N	限轻中度特应性皮炎患者的二线用药	\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
癸氟奋乃静	775c9e87-ac73-43dd-a92b-778b99816c1d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
卡马西平	7e8da4e9-fcee-45a9-bba1-4218da1ab295	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
地高辛	ff638aa0-163b-4dae-ba5d-9b6c6db0dad4	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
去甲肾上腺素	ff3b468d-de37-4669-9aa5-b5427fae4485	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
肠内营养剂(TP)	8d99b345-7000-4fd0-a114-a317bd2e14e3	0	\N	\N	\N	\N	口服粉剂	\N	\N	限重症患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
多西环素	334d3d10-a319-4316-ac28-33c275570ec5	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
硝酸甘油	70ba1142-d0f9-4696-9d73-fcf9850184f2	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
多奈哌齐	36bfc05e-f4d0-4ac7-a8cb-84be06b3d96a	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限明确诊断的阿尔茨海默病	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
吡格列酮二甲双胍	2fabde5a-fbe6-4804-b42f-eaddca1f4a39	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
绒促性素	59c2f551-1452-4957-b58e-7f371800daf9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
青蒿素类药物	732a960e-8a4e-4a94-8b73-3e50c9e81dc9	0	\N	\N	\N	\N		\N	\N	◇	\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	甲	\N	\N	\N
卡贝缩宫素	f7f19645-b39b-48dd-9813-76561ca4adca	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
奋乃静	a3c81847-dc86-4a54-8d69-7069b072952b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
秋水仙碱	b4efcc0d-28a5-4d3c-967c-bcd47f6595a7	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	甲	\N	\N	\N
复方阿嗪米特	8f8a64a2-7509-4bfa-963a-94c8f3e75ccc	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
旧结核菌素	631d1283-f8cf-4e14-bbe7-81c02bb32109	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
富马酸亚铁	79ce4e3b-c9b1-4de3-9c9a-3ee905cc4106	0	\N	\N	\N	\N	咀嚼片	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
巴利昔单抗	7ddec663-460c-4c67-bbe3-267f394a3a57	0	\N	\N	\N	\N	注射剂	\N	\N	限器官移植的诱导治疗	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
尼群地平	e1e2528e-8a3f-4e44-adbd-9a958c30ef3f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
小儿复方磺胺甲噁唑	a9a3c91d-f14d-4c7d-af3a-55534d767a39	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
重组人白介素-2（125Ala）	9a912377-c07f-4a5a-bca5-33dea86afc1d	0	\N	\N	\N	\N	注射剂	\N	\N	限肾细胞癌、黑色素瘤、癌性胸腹腔积液	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
甲氧沙林	dbce11a5-6597-4ee9-b04b-672bac4dfdcd	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
哌甲酯	a3a5164c-319c-4d97-9292-ac2262d3ebad	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
硫唑嘌呤	51e71bf1-572e-4df2-9d16-91d755ac72eb	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
对氨基水杨酸钠	d26f9e5c-24fc-4869-b842-e7add2c3f57d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
氨酚双氢可待因	1e8d74d3-8f50-4705-9e5f-c6ae3fc256d5	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
吲哚美辛	c6267864-243e-43b2-bcee-44c8e9c2d2a1	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
凝血酶	24b83ff3-151d-4b95-81a4-72a5a477570f	0	\N	\N	\N	\N	外用冻干制剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
金霉素	b8553c3f-b549-4bf0-b2c4-810504540965	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
醋甲唑胺	2cccd91c-20f8-4023-8e08-e2356b319974	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
尼可刹米	438b597f-9b3d-4f5d-8a56-b742e54c60b2	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
吡格列酮	39fcf59c-b008-43bf-b0b1-095aa4ee6305	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
银杏叶提取物	a2730b4e-ae94-4105-bcc8-e2ea5793194d	0	\N	\N	\N	\N	注射剂	\N	\N	限缺血性心脑血管疾病急性期住院患者；限耳部血流及神经障碍患者。支付不超过14天	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
甘油磷酸钠	6fec6013-ff74-4e51-84d2-29ef69abb116	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
甲巯咪唑	1701a265-8f4d-453d-9337-0636ef690daa	0	\N	\N	\N	\N	口服常释剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
利福喷丁	a3916a07-4c34-4269-806a-3fc3a385ecf7	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
阿昔洛韦	186af54d-3dd7-4ae2-935b-ccaabe0355ff	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
替勃龙	c4332d74-3ec6-4915-943e-d398d80cdf18	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
甘草酸二铵	b1ade9da-97d4-4675-ab5f-ccdcd0d25067	0	\N	\N	\N	\N	注射剂	\N	\N	限肝功能衰竭或无法使用甘草酸口服制剂的患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
丙氨瑞林	886b29c3-2d29-4487-9e6a-44e11ee893a7	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
曲唑酮	806f7cc8-c941-4ca1-a26e-0a6254c4388c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
己酮可可碱	8361227b-d696-431c-9f55-8f646357a56f	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
顺铂氯化钠	c2e4b17c-2808-466b-b506-35c298538323	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
莫匹罗星	22bd598a-a59d-423f-9dd6-ded44ed4090d	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
克霉唑	91333d10-fd96-4970-90af-da7980fa66ed	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
左西孟旦	41b3c78a-17b2-4339-ad2f-a2bff1a1c632	0	\N	\N	\N	\N	注射剂	\N	\N	限规范治疗效果不佳的急性失代偿性心力衰竭短期治疗	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
去痛片	cb001bb1-00c4-49b8-9497-c0d878f66a67	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
维格列汀	c04b2cd4-e07c-47ce-8229-326ba0e44e8c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
肠内营养剂(TP)	bc0a124b-e181-42e9-967d-32550b8478ef	0	\N	\N	\N	\N	口服混悬剂	\N	\N	限重症患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
克林霉素棕榈酸酯	d4834d19-5334-496a-b81b-2ea948991054	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
磷霉素氨丁三醇	8889adbb-8e9b-4a00-99f7-c3038d8b7aa1	0	\N	\N	\N	\N	口服散剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
洛索洛芬	4c099549-0a8c-432a-9772-717a338dbdd1	0	\N	\N	\N	\N	贴剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
头孢丙烯	cc33385c-e74c-4260-b411-00b1fd9bb851	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
司可巴比妥	8734d4dc-cbf6-446c-bb4b-a25160083cba	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
苯甲酸雌二醇	d874294f-8143-411a-8dba-430f088eaed9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
甲泼尼龙	52d6fece-80e9-43a7-b683-9e57a94c88f0	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
银杏达莫	fa47e1ba-2092-4a20-946b-2dc9f9d27f8b	0	\N	\N	\N	\N	注射剂	\N	\N	限缺血性心脑血管疾病急性期住院患者，支付不超过14天	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
氨氯地平贝那普利Ⅰ氨氯地平贝那普利Ⅱ	cae37f9f-17c7-4c33-835a-17643fe63c9f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
氯雷他定	23abdc39-fcae-439a-b112-ffccd8e77770	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
班布特罗	8499abbc-9b84-41bb-a054-0b4bee2e52c5	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
咪唑立宾	248c46e0-d6a1-488b-835d-311fb5bbcef5	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限器官移植后的排异反应	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
二羟丙茶碱	d8ca8a41-279f-4fd8-9d19-5e9c23ea6701	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
倍他洛尔	0125fd4f-b913-43a9-b4be-4d5c9bb10092	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
安吖啶	6f27bbb6-7855-458d-bce4-dc4342a10f34	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
聚卡波非钙	d3a06307-e77b-4fca-a5a1-6e177bb85e14	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
联苯苄唑	0c2a6821-2163-4baf-9c76-fe04512d66eb	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
西那卡塞	bddb8f6f-1ee9-4e8d-b134-35e541c49c9e	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限血透且有继发性甲状旁腺功能亢进的患者	\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
去乙酰毛花苷	1c546450-bc74-4231-8d46-d5e43ca9b98c	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
人干扰素α2a[重组人干扰素α- 2a（酵母）]	81b016d7-17ff-4a51-9a2a-dedd7945dc59	0	\N	\N	\N	\N	注射剂	\N	\N	限白血病、淋巴瘤、黑色素瘤、肾癌、多发性骨髓瘤、丙肝 、慢性活动性乙肝。丙肝、慢性活动性乙肝连续使用6个月 无效时停药，连续使用不超过12个月	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
羟考酮	cfb41725-bc6b-4489-b3c6-827a34f7b4a7	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
曲马多	71fc1ebe-8d97-42ec-bcf0-ea07e2bb968d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
苯扎贝特	dd6cbfa6-ef3e-4995-bc0e-ba33b2e5eeca	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
地氯雷他定	15a92e1a-4a10-40de-95bc-563c51acc925	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
哈西奈德	6240c07a-6e27-43a4-acf2-e0a9b7480993	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
甘露醇	b6038acb-f3a1-44b5-8047-93b77e7d59ff	0	\N	\N	\N	\N	冲洗剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
肠内营养剂(SP)	ff4fff2f-314c-4e9b-ac73-808f86babb3d	0	\N	\N	\N	\N	口服混悬剂	\N	\N	限重症患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
消旋卡多曲	2bbe8058-0f58-401c-b6e3-5da0a922443a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
双氯芬酸钠	fb6febb6-492f-45d7-81df-7132419a755d	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
磷霉素	cc5c0642-2630-4c5e-92ff-ac92a2b9a009	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
普鲁卡因青霉素	0865df0f-7d37-4876-b0a0-4b930968409e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
卡托普利	b90a304f-4a59-495e-ab64-10cda19977f3	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
人白介素-11[重组人白介素-11（酵母）]	98371908-b4fc-460d-b96b-7481994c7719	0	\N	\N	\N	\N	注射剂	\N	\N	限放化疗引起的严重血小板减少患者	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
甲氧苄啶	ab823d72-39a0-469e-8767-287309388a89	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
复方多粘菌素B	5043f9b8-22cd-4dbc-8ea4-eb64b941a86e	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
亚硝酸异戊酯	e1a980a8-7fd2-49c0-a24d-81e069a60162	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
氯丙嗪	071b52bc-e819-43fa-bf1d-85ded6aa2b7b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
别嘌醇	9750a7d9-42d4-4022-8532-6154e7de82b4	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	甲	\N	\N	\N
多粘菌素B（多粘菌素）	683c4418-8dbc-4bb4-a5c7-8fd60c2aeab5	0	\N	\N	\N	\N	注射剂	\N	\N	限有药敏试验证据支持的多重耐药细菌感染的联合治疗	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
抗人T细胞兔免疫球蛋白	f5f911a1-f455-40d1-94a7-8fda4dd5c17a	0	\N	\N	\N	\N	注射剂	\N	\N	限器官移植排斥反应高危人群的诱导治疗；急性排斥反应的治疗；重型再生障碍性贫血	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
甲萘氢醌	6c6ad2eb-4597-471b-85cd-b94d8f43b922	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
氨基己酸	aa17d605-1cf2-4bce-ad74-7b2fb8992a32	0	\N	\N	\N	\N	注射剂	\N	\N	限治疗血纤维蛋白溶解亢进引起出血的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
葡萄糖酸钙	4f7fffe6-431f-40cb-b578-25be37c34b6b	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
雷替曲塞	954a3967-ff6b-4471-957e-bcabefbb9b41	0	\N	\N	\N	\N	注射剂	\N	\N	限氟尿嘧啶类药物不耐受的晚期结直肠癌患者。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
膦甲酸钠氯化钠	f219d7c2-77af-4712-bf44-70bfa3134532	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
卡莫氟	4e6c68b6-2da2-4396-8b5f-237741199ac5	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
肠内营养剂(TPF-FOS)	f588e2cc-4fac-42df-8608-80483afeb752	0	\N	\N	\N	\N	口服混悬剂	\N	\N	限重症患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
胰岛素	e33f22b2-dff3-47d2-97bc-d7702a08f126	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
右美沙芬	f2167fbf-a4c1-4143-9e2f-3edb231e36c4	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
尿激酶	3d9fb883-7fa1-490e-9f82-35194e8422d9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
地塞米松棕榈酸酯	87f2370d-6350-445f-874d-42aa49055fec	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
双歧杆菌三联活菌	7a9a2cef-84f4-4e24-be75-2362c702598a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
氟哌啶醇	5a3d192b-a1cf-4772-8343-279548bbb045	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
布替萘芬	035e03ef-5673-4461-93d9-c39f60fffea8	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
甲硝唑	4a14c1b6-a417-49e0-9d90-168aa838cb4c	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
布林佐胺	a47c55de-128b-46b8-a789-42116164a8aa	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
葡醛内酯	8207b089-8601-451a-9a59-a31dddc19ddf	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
阿莫西林	ea85dd7c-3dee-489e-9b55-92e917c0d376	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
氯沙坦	3062a490-6290-43c5-91df-c9c375091080	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
甘油	168fe325-09b9-4b35-8c3c-59e711b0c9f1	0	\N	\N	\N	\N	灌肠剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
吗啡	18b408f4-4f7e-4df7-8877-5eb819cd6008	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
阿比特龙	04e51da7-7142-4494-97bb-67768d9a0183	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限转移性去势抵抗性前列腺癌、新诊断的高危转移性内分泌治疗敏感性前列腺癌	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
肝素	e9a6def6-02bc-4b14-bfcc-0ff86cac5fe0	0	\N	\N	\N	\N	乳膏剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
复方甘草	19b2cc50-2efb-481d-a112-2c86ab1c38de	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
开塞露	f73998f9-6789-4ffa-81fa-8b70b49bf5db	0	\N	\N	\N	\N	灌肠剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
多索茶碱	acee6ef7-ed2d-424a-ae35-cfeaeef159c5	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
格列齐特 格列齐特Ⅱ	f9796e1d-a269-42c6-bd68-65f2d926bd43	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
补液盐Ⅰ补液盐Ⅱ补液盐Ⅲ	aad157ff-3502-45ae-9e96-cf29bcde0fc4	0	\N	\N	\N	\N	口服散剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
白消安	fd2217f8-d2d6-45e5-9a40-5b35ad8fbb75	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
曲安奈德	cd626ece-b4eb-4bc0-a7eb-1958ec3e5b3a	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
硝酸异山梨酯	c443e660-af9a-48ad-b920-3190c6ebcb52	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
新霉素	5db7e034-9dfc-4500-b2ae-bdb522d5657c	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
倍他司汀	c4e32c87-9f90-48ab-b79f-09e2df44674c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
抗艾滋病用药	ce0652c5-1493-4f1b-b10b-92fefea89367	0	\N	\N	\N	\N		\N	\N	◇	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
文拉法辛	add0400f-347e-4064-bd6f-e47ab833fd3f	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
克罗米通	19a4543e-84d7-4537-857b-63a81eb92db9	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	乙	\N	\N	\N
曲克芦丁	eb8b24e2-4d21-40d0-8e1d-7c7323f23198	0	\N	\N	\N	\N	注射剂	\N	\N	限新发的缺血性脑梗死，支付不超过14天	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
托烷司琼	76ea8c64-4d30-41fe-9396-8c8e1b79bfbe	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
奥布卡因	eeeebdc0-a201-4e4e-a260-decce844fd25	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
氨糖美辛	177b1f6d-9686-4a33-8f53-f71b47e3ce43	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
格列吡嗪	4d9a60af-828c-4290-8534-f05b64f0891d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
厄贝沙坦氢氯噻嗪	020112cf-6d1a-45ec-89d4-318ea3b27ffc	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
普罗雌烯	f5895a72-119d-4ef1-975a-b74e777957cc	0	\N	\N	\N	\N	阴道胶囊	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
德谷胰岛素	0af2cd7b-a980-4577-be0d-4c69bcad5ce1	0	\N	\N	\N	\N	注射剂	\N	\N	限中长效胰岛素难以控制的2型糖尿病患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
泛影酸钠	cc6bcfe4-5268-462d-b3b1-683fe766ec6c	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
庆大霉素氟米龙	21d5e813-5aec-410a-8aef-102cfe6ee4db	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
更昔洛韦	45e38ebd-37bb-4127-9ab4-76932f57308b	0	\N	\N	\N	\N	眼用凝胶剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
葡萄糖	65bfd541-08f6-4be2-9ad0-5b9058bacdae	0	\N	\N	\N	\N	口服散剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
奎尼丁	8c6a9c10-930a-441d-83c8-a101ebbefa0d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
葛根素	a1736c48-8b9c-4e4f-a9a7-af7b58554e72	0	\N	\N	\N	\N	注射剂	\N	\N	限视网膜动静脉阻塞或突发性耳聋患者，支付不超过14天	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
头孢米诺	a9c447dd-fca0-44c6-b0fd-c0442df66231	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确药敏试验证据或重症感染的患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
甲钴胺	414cad99-6260-4148-a93c-3f8eddcebe74	0	\N	\N	\N	\N	注射剂	\N	\N	限维生素B12缺乏的巨幼红细胞性贫血且有禁食医嘱或因吞咽困难等，无法使用甲钴胺口服制剂的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
骨化三醇	f381f81d-d0fb-4ac3-82ea-7faccadaa964	0	\N	\N	\N	\N	注射剂	\N	\N	限肾透析并有低钙血症的患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
重组人碱性成纤维细胞生长因子	ea5085a4-85db-4bd3-8253-3570b52195c2	0	\N	\N	\N	\N	凝胶剂	\N	\N	限Ⅱ度烧伤	\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
碳酸锂	0221e7a3-d4e9-405f-9dc0-e8f7e14b0bee	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
阿那曲唑	4441b6b1-4f13-4bfc-befb-d9c49aa893e1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
复方托吡卡胺	7cd4c101-8664-47d2-96a9-bc9d1f7a502e	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
金刚烷胺	45c8afcd-a039-48d7-8efc-cc59d9f77685	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
奥曲肽	41014104-8b60-46a7-a131-e454cc2b9003	0	\N	\N	\N	\N	注射剂	\N	\N	胰腺手术，支付不超过7天；神经内分泌肿瘤类癌危象围手术期，支付不超过7天；肝硬化所致的食道或胃静脉曲张出 血，支付不超过5天。	\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
阿达帕林	641e08ee-bb93-4439-946c-3e1484d59298	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
伊曲康唑	c4cc1f39-7013-4c83-937b-201789c807af	0	\N	\N	\N	\N	口服液体剂	\N	\N	限有HIV诊断或免疫缺陷患者口腔或食道真菌感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
左氧氟沙星	755ead37-433f-40db-92ca-1e0a09c7da63	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
米卡芬净	c7aac970-3a5b-4ef9-8733-74ad7b681453	0	\N	\N	\N	\N	注射剂	\N	\N	限三唑类衍生物无效的念珠菌血症；其他治疗无效或不能耐受的侵袭性曲霉菌病的二线治疗	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
异福（利福平异烟肼）	9038f339-fe37-4769-bb92-677af42ec98f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
氟维司群	4099df07-7361-4fa2-824a-4f12ecbeeb6d	0	\N	\N	\N	\N	注射剂	\N	\N	限芳香化酶抑制剂治疗失败后的晚期、激素受体（ER/PR）阳性乳腺癌治疗	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
洛莫司汀	45617c2d-0a72-409c-95ef-188fe21d56b0	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
格列本脲	ef19941d-b2ac-47c8-aef4-9fa906c64aaf	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
去氨加压素	cfcc972e-d1aa-4575-b29d-5dbb1acb3c2f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
溴莫尼定	26844a64-ad05-4f9f-bc53-d6ca6b77df24	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
溴米那普鲁卡因	5bcae63b-c84f-43e4-9711-8d8ef4d0bd31	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
利伐沙班	1db44d2a-1afa-4430-a566-a9694fdadba1	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限华法林治疗控制不良或出血高危的非瓣膜性房颤、深静脉血栓、肺栓塞患者；下肢关节置换手术患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
莫西沙星	9099062d-4f6d-4630-95d9-c9b3d977000f	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确药敏试验证据的如下感染：急性窦炎、下呼吸道感染、社区获得性肺炎、复杂性腹腔感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
川芎嗪	d9ead49e-72d3-4133-9255-079db64cfcfe	0	\N	\N	\N	\N	注射剂	\N	\N	限急性缺血性脑血管疾病，支付不超过14天	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
替硝唑葡萄糖	d1ce157e-501d-4b42-9672-608015baf49b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
白芍总苷	b165a21d-6bc2-4dd7-8ca6-6ece74385919	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
来那度胺	09a1026c-fffb-48b0-bfe8-e4e7fcb5ffa1	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限曾接受过至少一种疗法的多发性骨髓瘤的成年患者，并满足以下条件：1.每2个疗程需提供治疗有效的证据后方可继 续支付；2.由三级医院血液专科或血液专科医院医师处方。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
甲基多巴	873bb312-77ed-41c4-854d-66572f9a1763	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
巴曲酶	b49a7c40-8d93-4cc8-9103-f288d7fd333d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
复方硼砂	e01aa0f4-248c-4bfb-b446-270ecc4d81ef	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
牛碱性成纤维细胞生长因子(重组牛碱性成纤维细胞生长因子)	ba598d18-f68f-4f99-93e3-abcd814f68a8	0	\N	\N	\N	\N	凝胶剂	\N	\N	限Ⅱ度烧伤	\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
利托君	4cf70d39-c134-46d6-92dc-8a144e2b6580	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
氯霉素	f8fe04a6-4f50-4ea6-9d26-2ade8f35d768	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
水飞蓟宾	0f1ab19b-c8e8-4014-88c5-8ec775815728	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
左氧氟沙星氯化钠	111e78c7-e486-498f-96f2-e4d23dd14b9e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
磺胺嘧啶	5f07fbd5-80fd-4d87-8195-95f94c4462e5	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
复方甘草甜素（复方甘草酸苷）	f317b8e7-bae0-4466-bdf2-344d9cd9aceb	0	\N	\N	\N	\N	注射剂	\N	\N	限肝功能衰竭或无法使用甘草酸口服制剂的患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
伯氨喹	6e540a1f-88d8-42c2-ab1f-608a2a2aa854	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	甲	\N	\N	\N
拉考沙胺	3b5ef1ce-6d31-49c0-a4f0-93eee0e3cc14	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
吡哌酸	20e26da1-76af-4272-9d19-36e77df00bab	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
阿扑吗啡	69d289e7-e6cc-49e8-a395-f3e224a2f9ce	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
贝伐珠单抗	fd8eef18-7629-4e82-977a-7b3e69daa40a	0	\N	\N	\N	\N	注射剂	\N	\N	1.转移性结直肠癌：贝伐珠单抗联合以氟嘧啶为基础的化疗适用于转移性结直肠癌患者的治疗;2.晚期、转移性或复发性非小细胞肺癌：贝伐珠单抗联合以铂类为基础的化疗用于不可切除的晚期、转移性或复发性非鳞状细胞非小细胞肺癌患者的一线治疗;3.复发性胶质母细胞瘤(rGBM)：贝伐珠单抗用于成人复发性胶质母细胞瘤患者的治疗。4.肝细胞癌 (HCC)：本品联合阿替利珠单抗治疗既往未接受过全身系统 性治疗的不可切除肝细胞癌患者。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
米曲菌胰酶	c4ca2ccb-6a61-4085-9329-fa192c9104d3	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
枸橼酸铋钾	51fbba96-661b-42d7-88a7-9036f18dc30d	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
小儿小檗碱	250828f8-6f82-4d1d-9c07-3eb30121df28	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
缩宫素	a1d9b959-bdc8-4f98-9d82-06c607a7d2be	0	\N	\N	\N	\N	喷雾剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
米索前列醇	67c02940-2976-4d09-98a4-06162a3fdbfc	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
硝苯地平	98b7f5d8-9119-4a5b-93bc-4ae22f427cdf	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
小儿复方磺胺甲噁唑	c28b5e7a-0af0-48b4-91e0-083201c3e457	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
磺胺多辛乙胺嘧啶	4123316d-b42f-466f-8440-fcd035d9b2e6	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	乙	\N	\N	\N
奥沙利铂	0e1f5fdc-28c6-4b84-85e1-d9f118d302af	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
氯唑西林	07cdc4be-466b-49fb-9c76-8942b679b91b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
硫酸镁	7c92d82f-76db-42b8-97de-d250ccf21b03	0	\N	\N	\N	\N	口服散剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
伊托必利	23f2e3b5-023f-4c20-ade0-6f5013ea47cf	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
重组人凝血因子IX	666f5f74-a710-4f4f-bc49-c84b8e624e9d	0	\N	\N	\N	\N	注射剂	\N	\N	限儿童乙（B）型血友病；成人乙（B）型血友病限出血时使用	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
克林霉素棕榈酸酯	026dd47d-3826-47b1-90d7-8aa629e19522	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
亚叶酸钙	fca46129-44aa-411c-b813-58697c623980	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
特布他林	8e89cbe9-0110-41db-b631-ae4f25ebaed7	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
腺苷蛋氨酸	7a94deaa-f261-4054-85fd-da1188e0f0f8	0	\N	\N	\N	\N	注射剂	\N	\N	限肝硬化所致肝内胆汁淤积或妊?期肝内胆汁淤积，且无法口服的患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
地尔硫䓬	fb2b2f99-cf2d-4a31-8c78-af40d844389a	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
帕利哌酮	746c85b4-8d95-4d9c-9806-9edd7f150aeb	0	\N	\N	\N	\N	注射剂	\N	\N	限不配合口服给药患者	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
麻黄碱	d3fac31a-bf19-486c-be55-a1899c73b2c8	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
天麻素	ea093642-6a16-4dc1-81c1-c5fa199146cc	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
普伐他汀	2c5584cc-53ad-4d30-8e5a-957f2a10d071	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
屈昔多巴	8dc91858-f1fb-4355-a64c-c0e0642ef249	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
ω-3鱼油脂肪乳	d5ec201f-e77a-459e-a19c-24a00116335a	0	\N	\N	\N	\N	注射剂	\N	\N	限重度炎症及感染的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
氟奋乃静	a37e45aa-02f2-44a5-bf9b-bee6c18a5908	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
阿戈美拉汀	cd890626-a970-46be-9631-79d9d8106747	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
氢化可的松	8d7dc4a8-e1d3-429a-a6cf-ffd4810397ac	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
尼麦角林	99ecf0a8-9ce1-4a4c-9caf-3941a71cf85f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
小檗碱	37db1586-e87e-4dce-ad59-e45169030a9f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
昂丹司琼	bacd782b-da64-4a16-a0b4-8b509caa2a37	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
酮替芬	f426b48f-ba05-4e72-983d-15d9ed7a050c	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
地诺前列酮	e7ec1c6e-94b0-432b-b8fe-16cfcf639ac7	0	\N	\N	\N	\N	栓剂	\N	\N	限生育保险	\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
美金刚	046b22a1-cc76-45f0-bafe-0ba2398935d8	0	\N	\N	\N	\N	口服溶液剂	\N	\N	限吞咽困难且明确诊断的中重度至重度阿尔茨海默型痴呆	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
磺胺嘧啶银	ba90de40-5f0f-434c-9227-db5b6e9889b2	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	甲	\N	\N	\N
异维A酸	d91e5c32-6be8-48c0-9b79-99719a47ee26	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
肠内营养粉(AA)	31d4a0c2-94de-40c2-9701-201b4e59b5d4	0	\N	\N	\N	\N	口服粉剂	\N	\N	限重症患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
倍氯米松	e6c74fe0-5832-4048-bd08-420d7000bd06	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
精蛋白人胰岛素混合(50R)[精蛋白重组人胰岛素混合（50R）]	332d5c6d-0274-4fa1-9622-58c5fc79408e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
二巯丙醇	bc13b74e-aacd-4e74-a431-85eeb6a786c0	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
地高辛	139a6739-d1e5-49e5-b965-aaf2d93205b1	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
替硝唑	3b97829a-ab78-427e-bf51-1ba098962665	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
鱼石脂	da439cde-61fd-418c-99ad-b504047dfce5	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	甲	\N	\N	\N
双氢可待因	e590c002-f812-4390-9612-158bc9e98a36	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
普拉洛芬	8fbb6314-6652-4f10-b352-d0c2c64e4c72	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
薯蓣皂苷	aa0703ec-92c4-457a-988d-777b1da948e0	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
人凝血因子Ⅷ	6a99b855-5554-49d7-82e9-30023f6d7467	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
厄贝沙坦	67bacc06-54a1-439c-80a2-2771aacc5819	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
纳布啡	bf951968-d19a-44a8-9a44-bff3c74eb990	0	\N	\N	\N	\N	注射剂	\N	\N	限复合麻醉	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
阿卡波糖	fdab3653-4c32-467a-9630-5de425d1cd56	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
安乃近	9296f532-0fdc-4006-a0f3-ac69bf852995	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
卡莫司汀	33f8fa1a-bc60-4313-956d-293b3d315275	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
芬太尼	7cf78231-cdfd-4db9-91d0-2ae3ce923a92	0	\N	\N	\N	\N	贴剂	\N	\N	限癌症疼痛患者或其他方法难以控制的重度疼痛	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
茶碱	cccb2c85-83cf-4410-a5fe-400e8ff96a63	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
硝卡芥	6db9a92b-7fc9-4cfb-83b1-aef296af820f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
美罗培南	d7aea413-3208-451b-bc63-33677b381fc0	0	\N	\N	\N	\N	注射剂	\N	\N	限多重耐药的重症感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
依沙吖啶	8d47db2b-f557-4eba-ab4e-2ddd2a763a91	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
白眉蛇毒血凝酶	eddc31b5-e319-4b53-adb2-a535e28186bd	0	\N	\N	\N	\N	注射剂	\N	\N	限出血性疾病治疗的二线用药；预防使用不予支付	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
酚苄明	7db96f69-c801-4a07-ac40-e62ffd7467ee	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
异丙嗪	425df3c5-e313-4a5b-811e-8eb9eb935fb2	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
异丙肾上腺素	7c45529d-acc7-4d5a-91f3-8d49ac29c44c	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
锝[99mTc]喷替酸盐	a33e4262-7bdd-4495-add9-d355e52988a1	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
司来吉兰	63b7ce75-1cbf-4ab8-8d50-8a5d9abd07fe	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
磺胺嘧啶	d755c0b8-eb56-41c0-a041-daefc708e118	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
丙戊酸钠	ed9024a5-fe5e-43cb-a8cd-2102034b19ec	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
硫普罗宁	71713647-8a3c-4f77-984c-0e48453d6b2b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
酮替芬	7b07bd21-0c6d-47a9-9ab3-bd050f6e687a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
氟米龙	4ba8da28-f121-4eee-ade8-0333eb221d7f	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
氨茶碱	6c8f58f6-f684-4622-9fd4-cfcb2816c7bf	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
卡维地洛	513101e9-e1a2-4117-95e8-a817e751f19d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
利奈唑胺	b32d0bcd-e133-4fb3-9a63-3d31a1c8fb49	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限万古霉素治疗不可耐受的重症感染的二线治疗；限耐万古霉素的肠球菌感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
肾上腺素	675fdb82-048a-44a3-b204-8f2e19f5aa16	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
托拉塞米	a421a63b-9117-44ac-9bce-3d8e0c8824e7	0	\N	\N	\N	\N	注射剂	\N	\N	限需迅速利尿或不能口服利尿剂的充血性心力衰竭患者	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
普拉克索	50968c5a-4427-4b0b-9c3e-f703b8e15669	0	\N	\N	\N	\N	缓释控释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
利福布汀	0d2aed68-ca3a-4e0d-8716-5745abb85f32	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
阿托品	c9215544-2590-4091-b328-eacd404b3cbf	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
乳杆菌活菌	8741a76a-6ea5-4881-a4ec-0c3b83c544fa	0	\N	\N	\N	\N	阴道胶囊	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
乙哌立松	bde5349c-953a-4d61-a343-852b04cdc6cc	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
氯化钙	3c69edc8-cbb3-4309-a42f-2732b0267168	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
双歧杆菌乳杆菌三联活菌	607e05ce-bed5-4473-a722-529d4ec5f83a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
布洛芬	0d2f9446-00ec-4906-be15-81f432a3990a	0	\N	\N	\N	\N	乳膏剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
利奈唑胺葡萄糖	7fcf629c-de92-4984-a83c-d1332f8ef6aa	0	\N	\N	\N	\N	注射剂	\N	\N	限万古霉素治疗不可耐受的重症感染的二线治疗；限耐万古霉素的肠球菌感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
米力农氯化钠	fc199730-df65-438e-bb4c-dd5bcc2c4a42	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
奥氮平	d8f47e1f-d629-4db3-8099-aa875a5e7d92	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
斑蝥酸钠维生素B6	1726bb1f-2f8b-423b-88c4-240efd7d5436	0	\N	\N	\N	\N	注射剂	\N	\N	限晚期原发性肝癌、晚期肺癌	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
萘普生	27f296dd-93aa-44d3-b89f-7180126b195e	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
氨苯蝶啶	0558e426-3a14-436b-a074-dd0b1ae37a4c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
葡萄糖氯化钠	89dab6ff-82d1-456f-9844-a741dea8b333	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
吲达帕胺	8f661754-5831-450f-a577-e50ef70f8fae	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
厄洛替尼	a475b3b9-582c-46e6-b2d9-29b7de6084ef	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限表皮生长因子受体（EGFR）基因敏感突变的晚期非小细胞肺癌患者。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
硫必利	4bac1336-13bb-42a0-ab11-f04b73b45be1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
腺苷钴胺	74d070c9-da0f-4ebd-8b45-b99ae25d5356	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
培美曲塞	66690067-be72-48bc-bdb6-9c50c3df1e6a	0	\N	\N	\N	\N	注射剂	\N	\N	限局部晚期或转移性非鳞状细胞型非小细胞肺癌；恶性胸膜间皮瘤	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
贝尼地平	4a0adf92-0fc3-4d38-810f-4ef0c98e6269	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
阿法骨化醇	fd94c08e-4dad-4331-a360-ceed03c77504	0	\N	\N	\N	\N	口服液体剂	\N	\N	限新生儿低钙血症	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
精蛋白人胰岛素(精蛋白重组人胰岛素)	2bbf0f0e-5b9b-476d-b089-fb68fcb3f7bc	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
间苯三酚	6689dcf6-6bdd-4c3b-9d02-7f102b72a288	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
卡络磺钠（肾上腺色腙）氯化钠	1055d6aa-7015-43ae-b886-3539c98adf92	0	\N	\N	\N	\N	注射剂	\N	\N	限无法口服卡络磺钠（肾上腺色腙）的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
维生素B12	1f9816b3-4423-4038-a626-aa22405dc5c6	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
美沙拉秦（美沙拉嗪）	a952c6a9-4381-4565-bb72-61d88adfaf81	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
复方氨基酸（18AA-Ⅶ）	9f09411b-08bd-463e-97c1-f7c9b102c075	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
碳酸氢钠	ce813820-3a50-44e3-860d-1b57033bac48	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
苯海索	794df7b5-5305-4391-978d-2c8e5c49c6ab	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
曲美布汀	86413831-e09a-4509-9c63-83dabfc2f765	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
埃索美拉唑（艾司奥美拉唑）	075cb133-c7b4-4298-96ac-8cf165f5b624	0	\N	\N	\N	\N	注射剂	\N	\N	限有禁食医嘱或吞咽困难的患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
环丙沙星	a46aa64a-8d59-46a7-8785-8f416c614cb5	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
他莫昔芬	98439cab-55da-4cf9-9e68-5fb1b3477752	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
奥沙西泮	60ecd0aa-1a6c-4a4c-97ca-0f6c0e599380	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
氨甲环酸	481366db-16b4-4067-a0fa-781e53bc6f43	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
甲硝唑氯化钠	7e4dd5f7-8067-4742-849b-86bde6d2fd2d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
大蒜素	870bcce9-ec45-4fab-8043-1e5f2911f15e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
雌莫司汀	575d2225-4653-4fcd-8f3d-03f709510895	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
利福昔明	42cc80fc-a7a4-4736-ad7c-9fd55e2d3683	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
阿魏酸钠	2d18ebb0-f8e8-4692-ab14-74bdbf59d9f5	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
甲状腺片	2cb98db6-4338-46ef-a987-d76e16656459	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
酮咯酸氨丁三醇	3ca7fa1e-5c26-462c-a4c0-68b72e51c5f9	0	\N	\N	\N	\N	注射剂	\N	\N	限手术后疼痛或严重急性疼痛的短期治疗	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
马破伤风免疫球蛋白	03307295-57d7-4162-88a8-121b781bd389	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
吡贝地尔	066e0d97-3e39-4f59-9cef-c6f6aa9c7f94	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
亚胺培南西司他丁	16438295-f653-4a67-a4e2-a08331683417	0	\N	\N	\N	\N	注射剂	\N	\N	限多重耐药的重症感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
七氟烷	3894760a-65a8-4d30-817d-722dd7fe86d9	0	\N	\N	\N	\N	吸入溶液剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
沙丁胺醇	7c241a30-5547-4cde-bc16-70aa19af063c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
氨甲环酸氯化钠	57c1723b-ee5e-4e62-aa3f-2952c4b7383c	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
表柔比星	5682cc30-8642-44db-ad97-4095c9537cd1	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
氟伐他汀	285d9de3-da82-485b-b220-bff4f5ae382f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
依沙吖啶	65df3467-1941-46fd-8d26-b93445943aa4	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
替加氟	7e034fba-adc6-4559-bc1b-eca5c2b8520b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
头孢拉定	32466a1d-eb15-4361-958c-3cfdd8497733	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
氯氮平	44139c9f-1a54-496e-bf85-133605944507	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
人用狂犬病疫苗（人二倍体细胞）	bfab69f7-dbc5-4bc6-b479-d9ae7b27e40a	0	\N	\N	\N	\N	注射剂	\N	\N	限工伤保险	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
白喉抗毒素	ba3baa2f-d0d3-4afe-96b9-8eb25b500c26	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
洛索洛芬	966dfd2a-22e8-4bd7-a2ad-32087665b9c5	0	\N	\N	\N	\N	贴膏剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
布托啡诺	9df3c804-93a7-4d06-a87c-083caa137078	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
伊曲康唑	ce0d731e-37dd-42ed-81a2-c5a2d89668c7	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
丙卡特罗	392f07cb-25ab-4024-9bcc-49c73e4e6e90	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
尿素	f05feb05-8e71-4281-b224-aaa95846f02d	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	甲	\N	\N	\N
胞磷胆碱（胞二磷胆碱）	4d292af7-bed7-46be-a7bd-d519482fb0fb	0	\N	\N	\N	\N	注射剂	\N	\N	限出现意识障碍的急性颅脑外伤和脑手术后患者，支付不超过14天	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
人用狂犬病疫苗（鸡胚细胞）	943bd53c-4d65-4cf8-afd5-9c9718e2d49d	0	\N	\N	\N	\N	注射剂	\N	\N	限工伤保险	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
酚妥拉明	1a92dba8-bb2d-4870-9bdd-4240610e87af	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
头孢呋辛酯	81aa32fa-9978-49fa-a1c0-1caa9739edfd	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
精蛋白人胰岛素混合(30R)[精蛋白重组人胰岛素(预混30/70)]	6afe1697-41e9-4c8d-9505-dc9ccd702f0b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
地尔硫䓬 地尔硫䓬Ⅱ	490497ff-8c1c-4684-a990-9ea876e488e6	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
克林霉素	7e0b3bed-ab7b-4d8e-b8d4-c65d2f8104a9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
托珠单抗	04f9365d-7ddd-441a-b1b0-bbc73422f011	0	\N	\N	\N	\N	注射剂	\N	\N	限全身型幼年特发性关节炎的二线治疗；限诊断明确的类风湿关节炎经传统DMARDs治疗3-6个月疾病活动度下降低于50% 者。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
异烟肼	da93cfb0-0ebe-4045-b838-86dfa64be55d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
短肽型肠内营养剂	93e78c03-3755-472d-a484-d6e1d160dd35	0	\N	\N	\N	\N	口服粉剂	\N	\N	限重症患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
头孢呋辛酯	d759ba12-a861-4f83-b44c-48bc8d73ee2d	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
托法替布	c61c7ece-daab-4eec-b0b1-c1dfcacbee3d	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限诊断明确的类风湿关节炎经传统DMARDs治疗3-6个月疾病活动度下降低于50%者，并需风湿病专科医师处方。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
妥布霉素	2eb7139e-9c82-44a1-8e31-dc51794a1211	0	\N	\N	\N	\N	眼膏剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
碘比醇	5cf3a5a2-df84-4e45-b7f8-e04a8c6ea312	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
赖氨匹林	26357662-2718-4a3e-a727-7717af63a5a8	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
替硝唑氯化钠	543334df-6720-44a9-bf0f-cccf17a35423	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
奥卡西平	95927f21-e9e0-4950-8762-117f17f2aee4	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
吡拉西坦	a9c23703-3368-460f-944f-4f98d4210bab	0	\N	\N	\N	\N	注射剂	\N	\N	限脑外伤所致的脑功能障碍患者，支付不超过14天	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
碘化油	0ef51ed6-d278-4b7c-a1f3-00ad7d7bd966	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
酚磺乙胺	75b64a90-1952-45d0-b1e4-741351698a35	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
替扎尼定	20440384-22f2-44f9-abe2-6afcd58de75c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
低精蛋白锌胰岛素	a4b87fa1-8e8b-40e6-b8d2-95e31f107b16	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
氯硝西泮	7aaf7092-d064-47c1-bcaf-71044121a989	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
甲泼尼龙	11f4b00a-6051-40be-9976-8e9ff9bce2cb	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
去氨加压素	9ad4e927-2a88-4985-907e-ec6d43744658	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
双羟萘酸噻嘧啶	4efc140c-6914-4e6a-bc3e-15a85a78020b	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	乙	\N	\N	\N
氢吗啡酮	1dbb48f1-37d1-4c69-90ab-0df45b81eb21	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
磺达肝癸钠	dcb0372b-1eba-4079-b11c-c24924f51cba	0	\N	\N	\N	\N	注射剂	\N	\N	限下肢关节置换手术患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
左氧氟沙星	86cd5b46-e6d4-4503-847c-c2a1ab6b311c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
卷曲霉素	db3e647f-1025-4596-b048-eb465668fd55	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
米力农葡萄糖	c82c2a7f-066a-43d4-9098-9cce14025971	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
氨溴索	5debc398-b3c5-4001-b596-41cf15abe50f	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
卡铂	49d302cf-ba90-42d5-8e93-bed9d23d07e3	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
红霉素	bd138c74-41cc-41d1-ac55-5c9538c9cfda	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
腺苷钴胺	49ae83a0-aba6-481f-b8a5-3936f8778db2	0	\N	\N	\N	\N	注射剂	\N	\N	限巨幼红细胞性贫血且有禁食医嘱或因吞咽困难等，无法使用腺苷钴胺口服制剂的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
甲硝唑	4cd7ba2a-6fd7-48ee-89a6-d7e0271f60cc	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
硝酸甘油	d6b04c18-b290-4877-b5cc-a351204f736f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
依诺肝素	21f03302-46a7-4df9-89c7-97eada33e0d2	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
左乙拉西坦	dca42f5e-4ec9-44f7-acbf-bb74fc25f44d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
吡喹酮	e52d5fc0-bc59-40d3-b24d-9770b6fa8051	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	甲	\N	\N	\N
米托蒽醌葡萄糖	0fadee69-11ba-4617-8183-515bab92a6c7	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
达肝素	66d75244-1e24-4c5b-b42c-6c6b4afe35e6	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
依替巴肽	11736dd7-5987-4386-a8ca-7f481d0653ca	0	\N	\N	\N	\N	注射剂	\N	\N	限急性冠脉综合征的介入治疗	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
奥硝唑	5d69b7b5-eeb8-499d-b508-b7465f584683	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
奥司他韦	6ecbc5cd-4b4e-458e-872c-c8e0d4240bc8	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限流感重症高危人群及重症患者的抗流感病毒治疗	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
氧氟沙星	dfa3f236-0889-44a2-bcf5-021673662409	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
肠内营养剂(TPF-D)	5ac7704d-ebde-4aac-8d73-347482446f84	0	\N	\N	\N	\N	乳剂	\N	\N	限糖尿病患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
东莨菪碱	81900f9e-301e-4e5d-b26f-d8a387daea9c	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
拉坦前列素	a788a214-1477-4c61-9ad8-135088e0d336	0	\N	\N	\N	\N	滴眼剂	\N	\N	限二线用药	\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
肝素	d82a6e9d-fc7f-4942-b7a9-ca8059f95662	0	\N	\N	\N	\N	封管液	\N	\N	限血液透析、体外循环、导管术、微血管手术等操作中及某些血液标本或器械的抗凝处理	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
苯巴比妥	1bf93b42-07b2-407c-b283-4fc66ceb429e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
拉米夫定	44a1dcb1-754e-4f91-b3b1-fc48f5512613	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限有活动性乙型肝炎的明确诊断及检验证据或母婴乙肝传播阻断	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
炉甘石	ee5aa5c8-03fe-474c-9917-bf915c75e5dc	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	甲	\N	\N	\N
地衣芽孢杆菌活菌	c62d8f4e-f6bf-4dca-8fc3-3b35b5de0f28	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
齐多夫定	62985f41-6398-4a8b-a23e-bf9c54d5e071	0	\N	\N	\N	\N	口服液体剂	\N	\N	限艾滋病病毒感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
乳酸钠	9537cf90-0c0e-437e-b602-8da705d3d143	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
多塞平	d2976832-c2f2-4961-bed9-f1a084b9f573	0	\N	\N	\N	\N	乳膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
维A酸	28f31552-37a0-44fa-899f-491cb1b5fc48	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	甲	\N	\N	\N
吡非尼酮	39ee230b-cd1e-4757-8318-b4000e27c519	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限特发性肺纤维化	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
氟他胺	85244561-a49c-4717-8374-14ea661430f0	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
阿昔莫司	14f4777c-50e2-423d-9162-096018854283	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
孟鲁司特	cd03fccd-4b89-40e2-a95b-d1f880bac671	0	\N	\N	\N	\N	咀嚼片	\N	\N	限儿童	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
氨茶碱	d9607554-b1c7-42f6-8c34-0de1afc62e1b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
卡泊三醇	643d9a9c-89ad-4a9a-bba8-e6dff83e337d	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
美托洛尔 美托洛尔Ⅱ	23aa49e9-cd35-41fa-b01a-18b08e6c7f52	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
谷维素	9e24451a-8974-4b2b-878c-623a9571fe2a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
牛肺表面活性剂	7eba1c52-8488-4854-b3a8-6b8ba187be1f	0	\N	\N	\N	\N	注射剂	\N	\N	限新生儿	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
倍他米松	543b19d1-edf4-43b1-bfa3-94bb26d20ba5	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
二甲硅油	bc07644e-3a80-4f47-b040-e4f1fc975d2a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
氟马西尼	bae19fb7-404b-48c7-9b74-2f803dbda1e3	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
聚乙二醇干扰素α-2b	dbbb8acd-0cf9-4920-a074-7cdaca425104	0	\N	\N	\N	\N	注射剂	\N	\N	限丙肝、慢性活动性乙肝，连续使用6个月无效时停药，连续使用不超过12个月	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
门冬氨酸钾镁	9dfead0d-05f8-43d7-97b9-ef5895bffa38	0	\N	\N	\N	\N	注射剂	\N	\N	限洋地黄中毒引起的心律失常患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
硫酸亚铁	b6f516eb-1720-4d37-98b9-d62d9303e6d4	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
阿伐斯汀	4992164f-1280-4ec2-88c7-4217de1520a1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
复合维生素B	5cc90703-30c2-4c06-99aa-8910496bb0a2	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
拉氧头孢	8adb8603-8a1a-4149-b2aa-b63e7417fb8c	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确药敏试验证据或重症感染的患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
依地酸钙钠	fac50acb-25bd-4259-8108-c9e0a68f80da	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
去氧肾上腺素	e0d0f063-9a1b-40fc-a887-af45ef07ad99	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
阿夫唑嗪	df9c88d1-a3a6-4ffb-a581-bf427f129cae	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
奋乃静	568d0f9a-4e8a-43aa-93be-1c4db050aa8a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
东莨菪碱	211bf19c-a34c-4cf8-b117-6bc929dc3a30	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
重组人凝血因子Ⅷ	3d7bba11-d327-405e-8adf-72c63977c5a8	0	\N	\N	\N	\N	注射剂	\N	\N	限儿童甲（A）型血友病；成人甲（A）型血友病限出血时使用	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
吉西他滨	27ca934b-dbd6-4308-b04e-58e72a14caf2	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
联苯双酯	07de34cd-ebfc-4e35-8d65-141cc27fca7f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
特拉唑嗪	29006449-d322-4029-8ebe-43a2458e2bf7	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
赛洛唑啉	e0baecfb-70e4-405e-960d-2fc691e62aaa	0	\N	\N	\N	\N	滴鼻剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
双环醇	325657cd-fc38-447e-9a25-4aaa08468d56	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
喹硫平	30fa1b9d-1a06-45f6-aac6-abbd009e34eb	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
倍氯米松	0c9e9b37-ac6b-46cb-bca3-2a0d6125935c	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
吲哚美辛	e42b0a7c-355f-44e9-a4aa-9ec8dcdcb8dd	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	甲	\N	\N	\N
恩格列净	0d5f9d06-e148-4e97-bcdf-0c003c51d8eb	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药。	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
吡嗪酰胺	4b779222-e5d3-4693-8c5e-828049715c48	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
他克莫司	02ec7b31-0fa8-4f43-ab38-c76978c1d816	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
特比萘芬	900bbafe-08ff-414c-b862-0d3fc1ec61c9	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
美沙酮	d89fe6a4-0c33-4822-a721-49b1ab093543	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
亚硫酸氢钠甲萘醌	4aaa1256-6c26-4e46-9486-5938498e2d42	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
替米沙坦氢氯噻嗪	3b418440-b193-486d-b18d-a128a70c6a03	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
长春新碱	3c43bd9d-1884-4a97-a862-d560c7d6503c	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
达卡巴嗪	2c8c4c3f-d80b-404f-ab4e-8b1920951365	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
甘精胰岛素	878050a6-523f-4703-91da-90149e0e6149	0	\N	\N	\N	\N	注射剂	\N	\N	限1型糖尿病患者；限中长效胰岛素难以控制的2型糖尿病患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
二氢麦角碱	8d0b9b31-26b3-4a36-a054-0703997ac5a5	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
克拉霉素	f9a356de-80fc-4b96-b019-5360114924ba	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
芬太尼	ce4c6aa7-2fdf-49cb-a71e-a52280aa4777	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
雷沙吉兰	544bbfe1-dacb-42f2-af53-3506e63cc5a7	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
左西替利嗪	5261a6ea-e01a-4931-b815-4092cc0789a4	0	\N	\N	\N	\N	口服液体剂	\N	\N	限儿童	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
肉毒抗毒素	72117beb-ba21-4457-8257-948997ec4844	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
鬼臼毒素	f085012f-f3d7-4d7c-b162-4825e3980b50	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
环磷酰胺	d85426cf-285d-4457-b398-57f0e88914d7	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
左卡尼汀	13efef10-d272-40ef-a5d3-45aac1c3100c	0	\N	\N	\N	\N	口服液体剂	\N	\N	限原发性肉碱缺乏症患者或因罕见病导致的继发性肉碱缺乏症患者（以国家相关部门公布的罕见病目录为准）	\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
氟康唑	2b1c999b-bd31-40f3-bbe5-bb3b97907758	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
克林霉素磷酸酯	e1eb144f-6f4a-4986-86ce-e670b29d791e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
林旦	b36ee338-4677-42fc-9f5a-f320e66832ac	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	乙	\N	\N	\N
巴氯芬	b35abe28-1f12-4a8f-a027-e0e0d97c70e8	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
精蛋白重组人胰岛素混合(40/60)	1a8d2052-35fe-4de3-9144-08793653fa7d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
碳酸钙D3	db9a1fba-c228-4ac9-9c1c-c6bcf444f308	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
卡巴拉汀	3f10ac29-1676-4f7c-9a01-83b3f84a47f7	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限明确诊断的阿尔茨海默病	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
利匹韦林	af5d53c4-902d-43fe-9753-e8eacede6e02	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限艾滋病病毒感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
七氟烷	41632873-2e51-47c0-9e56-d33d2ed66720	0	\N	\N	\N	\N	吸入用溶液剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
新霉素	07f27a41-70be-410d-bb45-c89f23b5736e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
吗啡	ea8c7957-6c94-4a05-8fc4-9b60c3c5bac1	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
索拉非尼	fb9a448b-8708-49d5-bed0-8751d3632475	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限以下情况方可支付：1.不能手术的肾细胞癌。2.不能手术或远处转移的肝细胞癌。3.放射性碘治疗无效的局部复发或转移性、分化型甲状腺癌。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
烟酸	d9ba570d-5167-4e6c-8f7b-045cff740456	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
托烷司琼	71090f53-3abf-4327-a137-507e2f1ebaa8	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
地塞米松	aba5f982-9909-4c53-9eeb-f54f54172525	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
小儿复方磺胺甲噁唑	051a0fa9-e311-4b37-b216-e86d600b57e0	0	\N	\N	\N	\N	口服散剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
糠酸莫米松	3dca4f68-d518-4ad5-8327-17aceddc090f	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
克霉唑	91bf11ff-66ba-45c7-af09-479daee5e8da	0	\N	\N	\N	\N	阴道片	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
锝[99mTc]依替菲宁	0af141d9-328d-44c3-9cc0-7b6ec1bb0c7b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
红霉素	85af0f19-c77b-42fd-865c-8c0701120e62	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
猪肺磷脂	196ebec3-d26d-4edb-ab79-a9f15d734d31	0	\N	\N	\N	\N	注射剂	\N	\N	限新生儿	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
硫代硫酸钠	a1e638b2-1ce4-4885-8e54-7a5f1eb12e7b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
曲美他嗪	eb3ec4eb-1929-44c7-8611-e2c81866db1f	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限稳定性心绞痛患者的二线治疗	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
人干扰素α2a(重组人干扰素α-2a)	4750349e-7b77-40a0-b975-b2164e562aac	0	\N	\N	\N	\N	注射剂	\N	\N	限白血病、淋巴瘤、黑色素瘤、肾癌、多发性骨髓瘤、丙肝 、慢性活动性乙肝。丙肝、慢性活动性乙肝连续使用6个月 无效时停药，连续使用不超过12个月	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
布美他尼	fa9ebb4e-a1fa-4e8f-9044-d25a21c91ce2	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
六甲蜜胺	ec65496d-0da3-4e73-9189-e211878ecf0c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
磺胺多辛	b7f0981c-1de5-49b8-a9b9-f8af535f3bb7	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
地塞米松	7e7c9bd4-87b6-490a-a931-f0eb28fd452e	0	\N	\N	\N	\N	植入剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
倍氯米松福莫特罗	205f8121-aaab-4df8-8c19-35d78dd9d608	0	\N	\N	\N	\N	气雾剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
罗哌卡因	79fd8d48-8b9a-43b1-9b93-dd9b81a83a19	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
莫西沙星	1908cf64-91f0-4336-8fb7-4afd92658eac	0	\N	\N	\N	\N	滴眼剂	\N	\N	限二线用药	\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
达比加群酯	3cb8c756-ad1f-4606-8ab8-794bc9c9cceb	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限华法林治疗控制不良或出血高危的非瓣膜性房颤患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
地芬尼多	b68d7775-4277-49cd-81e7-094a9bdbff92	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
吲哚美辛	f14b5cb4-4bc0-4af8-9081-3dcb804056be	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
丙卡特罗	dc0e58c8-3514-4dd0-894a-fe8a2c5176e9	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
羟考酮	564d7a40-e9af-47c4-8710-8ba96d16a910	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
石杉碱甲	f9e20db1-4c3a-4b3c-ad79-56c31d065fec	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
阿洛西林	a1c6ed0a-c044-4da3-8734-56ba890f6844	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
己酮可可碱	96491cff-61be-426f-984d-675237fb25a8	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
重组人酸性成纤维细胞生长因子	55cfc892-f159-4e1d-a36f-6241c3fec037	0	\N	\N	\N	\N	外用冻干制剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
纤溶酶	21db375c-4229-49a9-8298-fee5e9c4a56c	0	\N	\N	\N	\N	注射剂	\N	\N	限急性脑梗死的急救抢救	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
乳果糖	c8eed775-837a-440d-af6e-c9a371c01d70	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
尿促性素	3ecd52c1-2262-4e72-823f-6dcfcc7941ca	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
醋氯芬酸	2332b527-a314-4f46-881c-6951e71f4f8c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
煤焦油	621be064-a301-47b3-99ca-823ed8584201	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
降纤酶	647fca82-04b2-4f33-9d26-d6fa1b26f18e	0	\N	\N	\N	\N	注射剂	\N	\N	限急性脑梗死的急救抢救	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
普适泰	f550dbce-eaa0-464f-857a-ecb7a6e36c6a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
美托洛尔	7653ea63-2fa6-4151-bc73-b73eb3da5189	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
黏菌素	b1d730a3-25a3-4407-8e58-0ece225c6d96	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
兔抗人胸腺细胞免疫球蛋白	756d59a3-309e-4066-84c6-acd7d375f0a2	0	\N	\N	\N	\N	注射剂	\N	\N	限器官移植排斥反应高危人群的诱导治疗；急性排斥反应的治疗；重型再生障碍性贫血	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
氯米芬	333ecb1f-5a09-4e39-96f0-4c258baeacdf	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
复方角菜酸酯	5bb4a3c7-421a-439b-9f5f-0c43757497fe	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
聚桂醇	e5445fc5-4249-4508-9acc-549ac13f6d2c	0	\N	\N	\N	\N	注射剂	\N	\N	限消化道严重出血	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
奥硝唑葡萄糖	84eca9a0-fa10-4eef-ae5b-8e3736728bf9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
碳酸镧	83f5d073-0ee3-4cdf-a65d-819a90b5ffa6	0	\N	\N	\N	\N	咀嚼片	\N	\N	限透析患者高磷血症。	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
阿莫西林	9bcc7188-df15-4335-a0d2-ee0c7790861e	0	\N	\N	\N	\N	颗粒剂	\N	\N	限儿童及吞咽困难患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
吡拉西坦（乙酰胺吡咯烷酮）	a2765f98-54e8-4bc8-9381-565633049b5c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
曲安奈德	8420c975-5c7a-4719-99d9-8954ea862de7	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
茚达特罗	7c05b450-caa8-4f35-9429-610e6a8f4249	0	\N	\N	\N	\N	粉雾剂	\N	\N	限二线用药	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
比卡鲁胺	6556cf70-4a15-48c2-a3bc-a09483551ac0	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
头孢克洛	9dbbb9d2-69cd-48cd-97ea-a1c1c79c95e6	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
恩他卡朋	efc3bbe8-a494-411e-abec-d30d93400fb1	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
羟基脲	e7d0ec79-913d-42c7-942a-1de2b2121d6d	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
麦考酚钠	6747996b-b2d7-47ad-afef-468a6491ff16	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限器官移植后的抗排异反应	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
丙泊酚	f962a35e-1c13-49ad-a6a2-dfcb47f5bb5d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
复方阿司匹林	48e9e633-ba1d-48f9-abff-715730d65c58	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
环丙沙星	63dede04-afad-4e22-98bc-cb50922b6561	0	\N	\N	\N	\N	眼膏剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
左甲状腺素	9df4e3c5-7e62-443c-a918-e5a017a39bac	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
哌库溴铵	9df0529d-2de0-4c6e-85a3-08854371c709	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
胶体果胶铋	6970155d-7258-4f37-84eb-0991c20f5131	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
氟哌啶醇	5afb1c1c-5716-4e71-8bed-771eb5144cf4	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
洛伐他汀	e97e9993-12f0-434a-89fd-8909783c8111	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
吲达帕胺	63f63779-7d18-46a4-87cd-365f7b4400ec	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
喷昔洛韦	37f76f81-2109-431e-a265-0735e200ff59	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
特比萘芬	a86a78f2-2d67-4be1-a5d8-b8446febeb54	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
氟尿嘧啶	14ef0bee-7b77-4c6c-9d8c-b4a6bc1767c9	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
特布他林	64327c4f-90b1-4a50-8669-3cddd4126434	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
氯普噻吨	fc713c62-2003-479a-b18e-9bf8a0b58610	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
硫酸锌	cab9d84b-dd4d-4c68-a477-7d9e94cb94bc	0	\N	\N	\N	\N	口服溶液剂	\N	\N	限有锌缺乏检验证据的患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
托特罗定	937d838a-8ced-4358-b4ee-630fed1a32c9	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
替卡西林克拉维酸	3e999e0c-b77b-406b-992c-628e834af557	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
罗格列酮	49f4f80a-bad4-4851-aade-c48973de69db	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
浓氯化钠	ce738f45-dc35-4683-a8bf-859377c8dc4b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
西替利嗪	b559f22d-521d-47e7-8bd4-d59327a892a6	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
硒酵母	97ce1adb-0ec3-4066-a656-80a8fd858b9b	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限有硒缺乏检验证据的患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
咪康唑	763fdc76-51c5-4e68-bb5d-4843e8c38370	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	甲	\N	\N	\N
氯硝西泮	ae953f55-c034-4335-9d53-3ff52a92d102	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
瑞格列奈二甲双胍Ⅰ瑞格列奈二甲双胍Ⅱ	c1e349e1-2732-4822-8d9e-2c877682efee	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
过氧苯甲酰	2d463e7b-12cb-4146-aa9c-9ba8f86d189e	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
地奥司明（柑橘黄酮）	1eb09481-dcf6-46ed-b94b-6fefdfc6a081	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
硫辛酸	55ed6354-bc06-448a-970a-81adfa811ffd	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确神经电生理检查证据的痛性糖尿病外周神经病变诊断的患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
消旋山莨菪碱	3d971938-f245-4950-abba-b43e374762fb	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
门冬氨酸钾镁	473d9e36-3998-479f-bb64-b21269102360	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限低钾血症引起的心律失常或洋地黄中毒引起的心律失常	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
依那普利叶酸	d1730e53-8571-4409-9632-7b98fb5a4092	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限有明确同型半胱氨酸水平升高证据的原发性高血压	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
樟脑	ccf4c99b-e999-4d29-a8ac-528656947275	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
肠内营养剂(TPF-DM)	d0d2d282-958c-4fe3-8770-c93327c4e1e9	0	\N	\N	\N	\N	口服混悬剂	\N	\N	限糖尿病患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
西洛他唑	4f8ba343-58f5-4ba9-83de-d42edade6e0b	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限有慢性动脉闭塞症诊断且有明确的溃疡、间歇性跛行及严重疼痛体征的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
更昔洛韦	6840f9ac-2667-4f97-82ba-c31abf243a8c	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
鞣酸加压素	5e22e71f-2209-491a-820a-cf98bdbaeeaa	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
小儿异丙嗪	bd1ac0eb-3ab8-45d6-b555-763aae16087e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
福多司坦	e5d4cdbe-4a0a-4eb9-ac86-c67ccf564b3a	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
亮丙瑞林	4247d083-70f2-4c7b-ae1d-027785a4e483	0	\N	\N	\N	\N	微球注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
高三尖杉酯碱	5dbdaf86-125d-4aea-944a-df80c5d60f22	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
贝美前列素	730cb43a-4909-4e7c-867b-a84407a64381	0	\N	\N	\N	\N	滴眼剂	\N	\N	限二线用药	\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
联苯苄唑	005c128c-e99e-4ab7-af4e-992e6d0be158	0	\N	\N	\N	\N	外用液体剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
阿替洛尔	b550480e-c156-4b43-a847-77fdf670770f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
烟酸	be7271a5-1e33-4b71-b288-a88838eb77b0	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
马普替林	4181dea6-e452-4df1-8b57-12e58332b454	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
左卡尼汀	771ecc54-f486-40a3-a316-65e5556b71b9	0	\N	\N	\N	\N	注射剂	\N	\N	限长期血透患者在血透期间使用	\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
鬼臼毒素	52706cdf-ff32-422e-8458-26a507727d0c	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
泼尼松龙	cbacb365-9709-45cb-9418-7e9e6862ca54	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
培哚普利	691c9afb-71e5-445f-8ffa-0ec0781c6e6a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
加兰他敏	df7547b7-926f-4436-b095-8f82dee47964	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
丙硫氧嘧啶	5dd14472-7aad-4496-a42d-66edfa93b3f6	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
氯喹那多普罗雌烯	dce478ef-20c9-480f-bf2e-2a158046e14a	0	\N	\N	\N	\N	阴道片	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
托吡酯	64c9bac7-c533-44be-b84a-ab5f7a67a662	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
氟比洛芬	ad789591-81ff-404d-ba5c-c17b362b1209	0	\N	\N	\N	\N	贴膏剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
利格列汀	df7eba36-7935-43f2-8a92-e26ad06c5ad1	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
过氧化氢	9a61b7d6-f4aa-452e-b20a-1b4adb21546d	0	\N	\N	\N	\N	溶液剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
罗通定	d231b813-5183-48fc-9fe7-796f6e96ec7a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
精蛋白人胰岛素混合(30R)[精蛋白重组人胰岛素混合(30/70)]	e165c57f-9432-4d3c-8819-e409eefec22d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
庆大霉素	28ef43d2-212c-4c19-ad9d-8c6ba1f146d6	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
骨化三醇	3b27a43d-8fb9-4c7b-9227-9d8ab8de1327	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限中、重度骨质疏松；肾性骨病；甲状旁腺功能减退症	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
头孢克肟	379a3e7e-b869-4f71-981f-3e874aeeb150	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
二羟丙茶碱	14abb303-2748-474d-842d-7a453daffc57	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
肠内营养剂(TPF)	035a4f49-49c7-4564-804f-1c6f60849d98	0	\N	\N	\N	\N	乳剂	\N	\N	限重症患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
沙格列汀二甲双胍Ⅰ沙格列汀二甲双胍Ⅱ沙格列汀二甲双胍Ⅲ	d9b1c730-6bf8-409f-b6f4-3c46c3e83dc9	0	\N	\N	\N	\N	缓释控释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
苄星青霉素	5645936b-6b8e-4591-96b8-4a99f4bf67bf	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
蚓激酶	e10682fb-4c30-4541-b963-6834b04cb368	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
曲安西龙	c11af48f-fffc-48a8-89b5-6c8a69326301	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
二巯丁二酸	3b008c53-c671-419f-8e6f-da9760ab4cc4	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
复方甘油	309f326f-abbb-47b5-b82d-ef09c854884b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
达托霉素	ce690def-fa48-4870-ab38-61f0f35747b0	0	\N	\N	\N	\N	注射剂	\N	\N	限有证据支持的金黄色葡萄球菌菌血症（含右心心内膜炎）	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
美托洛尔	874ef1ac-2640-4762-bc25-c20f77b7bb54	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
地衣芽孢杆菌活菌	79164925-e56a-4acf-88b9-39201d44565e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
甘草酸二铵	ef496627-6741-4540-952f-60b35282dd47	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
草分枝杆菌F.U.36	a7d73a26-a889-4b49-9027-3d62227d0fb5	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
整蛋白型肠内营养剂	9410bbfb-a3b6-447c-96c8-c470d6f95604	0	\N	\N	\N	\N	口服粉剂	\N	\N	限重症患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
奥硝唑氯化钠	69939df4-6236-4b8f-8abb-ee3bb1051d0a	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
氟达拉滨	6d35458d-cea8-4e9c-a972-4f822cd48be0	0	\N	\N	\N	\N	注射剂	\N	\N	限B细胞慢性淋巴细胞白血病或滤泡淋巴瘤	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
脂溶性维生素Ⅰ脂溶性维生素Ⅱ	8084cc0b-ef60-482a-960f-10e97638b714	0	\N	\N	\N	\N	注射剂	\N	\N	限与脂肪乳、氨基酸等肠外营养药物配合使用时支付，单独使用不予支付	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
多磺酸粘多糖	4b05ab92-376f-4937-8224-94401ba7b032	0	\N	\N	\N	\N	软膏剂	\N	\N	限由静脉输液或注射引起的血栓性静脉炎	\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
萘丁美酮	20b9da6d-c60c-4bf8-8a45-bc9676f0edf5	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	甲	\N	\N	\N
乙酰半胱氨酸	f2c83129-7578-496f-8678-0c0e27194f1b	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
亚硝酸钠	643454e5-76c6-469f-9df7-1ed0130bd42a	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
人用狂犬病疫苗（Vero细胞）	65068801-dacf-46df-a554-7ecd57746771	0	\N	\N	\N	\N	注射剂	\N	\N	限工伤保险	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
塞来昔布	54cf64d0-7126-4f27-9199-41da1ea3038b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
碘美普尔	bb0405df-e3d3-417d-b4c8-4e3adcb1d340	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
甲氧氯普胺	3c3a72ec-0117-41d0-a479-b107b29b2cb5	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
螺内酯	d20dc719-51b3-47db-9283-4fed2e120047	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
索利那新	7b433d1d-f6f9-4034-85b5-ef331bdcf749	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
环丙沙星	337e0706-6d1e-4409-9299-e4fb84d870e3	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
奈替米星	83939118-1095-448a-8799-73bbf44826f4	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
头孢羟氨苄	a8b2052c-81b7-4b62-a0a5-92187e628cbb	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
莫西沙星	6ba4e30f-2fc6-4b69-893e-11d3cc379b15	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
洛匹那韦利托那韦	72c12b4e-1aea-47de-bf4b-78d2a171933e	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限艾滋病病毒感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
米格列奈钙	64b571b5-2634-482d-b18b-fa20a3e18a83	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
阿莫西林克拉维酸	89a0b497-5f03-458e-8ba1-5b94e6c01241	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
甘油果糖氯化钠	d6fdbfb8-8a02-45fb-945f-a0c36f339b91	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
人凝血酶原复合物	16a258e3-5366-4b07-a088-a9f2f23e6983	0	\N	\N	\N	\N	注射剂	\N	\N	限手术大出血和肝病导致的出血；乙（B）型血友病或伴有凝血因子Ⅷ抑制物的血友病患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
硫必利	e29e7579-2b45-4c9f-b855-9352ed8fa38d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
烟酸	1ffe8c81-599b-4173-b816-6299047fe908	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
小儿对乙酰氨基酚	96728eb6-f43a-4ece-b3fc-82784d91d0ce	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
己酮可可碱	40320353-8ef8-4d52-bb58-4f008b44bb72	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
硝苯地平 硝苯地平Ⅰ硝苯地平Ⅱ硝苯地平Ⅲ硝苯地平Ⅳ	94c89928-06f8-4313-87fd-a71dbf976bbe	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
人促红素[重组人促红素（CHO细胞）]	baa41828-154a-4fac-b1bb-30c5e4c4256b	0	\N	\N	\N	\N	注射剂	\N	\N	限肾性贫血、非骨髓恶性肿瘤化疗引起的贫血	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
舒必利	4bcd2e19-25a5-4a34-8c36-4fd13cb54f5b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
碘[131I]化钠	74631065-5e19-4e99-b5f9-11ad43578123	0	\N	\N	\N	\N	口服溶液剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
托拉塞米	6efceaff-1ca4-4e05-ba62-5f12d18d84a6	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
氨苯砜	585d71c3-03c3-4455-87ca-16be347092ed	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
庆大霉素	2fa61845-fdda-4560-aaa9-2bc6ab338cd9	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
毛果芸香碱	422819df-0ba1-4a4d-bd8e-62b053b78815	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
阿托西班	9b2b070f-2e80-425e-a788-9ff05533a919	0	\N	\N	\N	\N	注射剂	\N	\N	限妊?24周到33周，且有明确早产指征者的二线用药	\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
胸腺法新	df8baa19-64bb-468f-ba00-e2718d43b81c	0	\N	\N	\N	\N	注射剂	\N	\N	限工伤保险	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
雌二醇	4b290ff1-400f-4b9c-8a81-aaeebc750521	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
腺嘌呤（维生素B4）	bcf6ea5b-85a2-4a60-b3be-3be4b4bcb9dd	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
美金刚	873ad066-b35b-4ff4-ad46-3ca42559441c	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限明确诊断的中重度至重度阿尔茨海默型痴呆	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
林可霉素	4e624ab6-b110-4b4d-9ac9-1fc703c146b8	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
瑞舒伐他汀	e05fdbee-30f4-46f1-902f-3dc4dc8c8013	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
恩氟烷	901ec0ad-869a-4457-b166-7fd94ca287fa	0	\N	\N	\N	\N	液体剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
吗啡	1beecedb-8fa2-4004-adbd-c2a5d717876e	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
福莫特罗	4e444736-ec77-4fee-bb5b-5b34466d9421	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
乙酰半胱氨酸	c1f8adcd-97d7-44c3-9882-2e7e30acd588	0	\N	\N	\N	\N	泡腾片	\N	\N	限有大量浓稠痰液的慢性阻塞性肺病（COPD）患者	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
多潘立酮	084c7cf3-4129-446c-a20f-b1094f020243	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
利培酮	d3cba4a8-1723-4c18-849b-5a604fee1a51	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
帕利哌酮	5f8c4c01-8eb9-4510-b30e-151615ed962a	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
美沙拉秦（美沙拉嗪）	8a637f45-974d-4420-b83a-ee8e1de415bd	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
氧化亚氮	2a2819c4-740b-4657-9953-f2b8072cbbfc	0	\N	\N	\N	\N	气体剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
福辛普利	998deba5-3d8a-4e2e-8a51-ed17144581a5	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
非洛地平 非洛地平Ⅱ	be45aba3-9c08-4c7e-8064-861b5ebad4e4	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
恩替卡韦	e62e5416-d919-46c9-900d-6492256338b2	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
哌嗪	caf22cec-62d2-4668-97ff-705e1fbfec32	0	\N	\N	\N	\N	锭剂	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	乙	\N	\N	\N
溴吡斯的明	fd2e16b8-232a-474a-87c5-2e77ce9bee6c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
氮?斯汀	1c2e0304-0999-461c-9e7a-dcd5167e8db8	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
葡萄糖酸锑钠	a685bb5c-3a5f-4676-aa6d-f5d7f2bf2a96	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	甲	\N	\N	\N
齐拉西酮	4182f9b8-104b-4d4a-87f9-b45b3f42fc54	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
垂体后叶	dfd78c11-5b8a-4a83-bb63-89d6741678e9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
复方氨基酸复方氨基酸（20AA）	42286642-28fb-4dd8-9ffd-78068464e83d	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确的肝硬化、重症肝炎和肝昏迷诊断证据的患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
吡嘧司特	c16d48d3-fefd-4954-a16b-0290383c3e6d	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
抗眼镜蛇毒血清	a43755a4-4bbc-4043-9194-93908d7fb1a2	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
阿托品	097c937f-3e02-4e6d-b988-bb2fab1eb532	0	\N	\N	\N	\N	眼膏剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
脂肪乳（C14-24）[指大豆油]	3ef3abd4-ebfa-40dc-ad06-4581ec2cd624	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
白消安	24f0ed75-954a-4be3-b678-e6f373f81e23	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
夫西地酸	e977b1e2-c7e1-402a-8ba4-68600b7f9839	0	\N	\N	\N	\N	注射剂	\N	\N	限甲氧西林耐药阳性球菌感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
安立生坦	93943554-555e-45d4-9652-a151e141946c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
利斯的明	7046efd2-e9da-4571-adfe-68e55023134c	0	\N	\N	\N	\N	贴剂	\N	\N	限明确诊断的阿尔茨海默病	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
氯化钾	4b468c35-ff7e-4202-ad75-2258deb32f34	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
结合雌激素	87841f5a-3ab9-4fcb-83bb-3828d70fb97a	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
妥布霉素地塞米松	39324235-39f0-4eb7-aa4f-06590119883f	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
阿昔洛韦	75a034a3-b5cd-4e4f-8a9c-1e64e69fed35	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
喷托维林	d5401dc7-e0e5-4903-848f-217ea998fa65	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
枯草杆菌二联活菌	46a0b6c5-34b0-4575-9a0f-60813b8ff848	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
双氯芬酸	e6417d00-eead-4d50-bbc1-567f60eed2b1	0	\N	\N	\N	\N	肠溶缓释胶囊	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
呋喃唑酮	bb30a318-b4c7-4dcb-a3bf-30aacc26d728	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
维A酸	1a4302a8-bf99-499d-98bd-a41adb811c1b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
米力农	a08590e4-e74e-413c-b533-7f3c4adf8227	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
维生素B1	576b396b-3338-42aa-b41f-c9381eb82264	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
吲达帕胺Ⅱ	1826044e-bbda-4b3d-b56a-229e21ffa054	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
琥珀酸亚铁	1c6aa188-b5b0-4075-b6fc-40a6d234b2fa	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
左乙拉西坦	57e246e7-dec0-41a7-9046-dd5fabc4c72d	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
精蛋白生物合成人胰岛素	4ab93c55-2282-4cd5-a11c-988787a1a434	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
甲钴胺	5fac8f7e-5afb-4d5a-b327-b963fa7b85f6	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
依降钙素	490aa7f1-5f81-4ad6-98c6-932f084d26b3	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
灭菌注射用水	e1b17588-5034-4609-a607-22a710639f5b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
氟康唑	53b87d65-dfa6-4a64-93ac-a2a612b680a3	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
人免疫球蛋白	75c9e1e0-bb56-4ac7-a25c-bff272dc01d3	0	\N	\N	\N	\N	注射剂	\N	\N	限麻疹和传染性肝炎接触者的预防治疗	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
卡泊三醇倍他米松	9a463e2a-823e-4119-a668-c4ceb69a4c4f	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
药用炭	628a4561-65da-4056-90df-3325b8ca7062	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
头孢他啶	e73f2a12-f1ef-44ad-9e34-2868376ca41f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
果糖氯化钠	a2cea690-02f7-474f-a116-b797e01f3645	0	\N	\N	\N	\N	注射剂	\N	\N	限因胰岛素抵抗无法使用葡萄糖的抢救患者，果糖总量每日不超过50g	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
草乌甲素	749d1d9d-f97a-44fa-be67-6844eb508952	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
美沙拉秦（美沙拉嗪）	b2298fbc-8a1a-4b63-8b24-b23248f37c4a	0	\N	\N	\N	\N	缓控释颗粒剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
孕三烯酮	4bc27793-c7d2-4da1-840c-bf9a3e4d6d9f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
羟甲唑啉	aab4a100-6cd4-43ea-a1d8-7843efc8393e	0	\N	\N	\N	\N	滴鼻剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
艾瑞昔布	adf9d9cf-a003-40bd-bc61-9260538b868f	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
培哚普利氨氯地平Ⅰ培哚普利氨氯地平Ⅱ培哚普利氨氯地平Ⅲ	c26795a6-2cc1-48e3-b51a-4cd20de7e0a8	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
维生素C	b946040d-bf04-4689-8ebb-b6c4bf4e03db	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
亚叶酸钙氯化钠	0f179cf6-2646-4356-a1a9-3fec76722d93	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
生物合成高血糖素	876071ba-317d-4830-bdd2-3de106045891	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
复方泛影葡胺	5c1e9251-1c77-4ce3-af00-a353079a44c7	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
哌泊塞嗪	9d2eff3e-9772-44c8-89dd-7f5250017c4e	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
新斯的明	0234a7fc-cf02-4787-9981-2acaa12880ce	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
地氟烷	c8ef1997-f4f9-404f-b385-3be7cc31a77f	0	\N	\N	\N	\N	溶液剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
金刚乙胺	3e1cd8c6-d69d-40be-b3f4-7d46986d3e1e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
左布比卡因	e064a633-fcea-48d6-bba9-85ebe9dd6806	0	\N	\N	\N	\N	注射剂	\N	\N	限布比卡因注射剂不能耐受的患者	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
贝他斯汀	4b9d2681-0ae6-4ec3-ade9-5f1db88155c7	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
奥洛他定	b6d21524-a73a-4ae2-9aaa-b5e98a1a9599	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
依地酸钙钠	a604560f-6c00-4cb3-90ca-e57b911b7dfb	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
小儿布洛芬	4bd3cdaa-8a1b-48f0-bbe5-033d2a567ae1	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	甲	\N	\N	\N
生长抑素	1e433b15-ea8f-43d5-bd73-6a055625b839	0	\N	\N	\N	\N	注射剂	\N	\N	限胰腺手术，支付不超过5天；严重急性食道静脉曲张出血，支付不超过5天。	\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
氨氯地平阿托伐他汀	99ebe3e0-34ae-4a07-8876-2a14600c5e96	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
氨甲环酸	f37b2534-a4a1-4fb8-a630-e37b287eb30f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
益康唑	1078af82-190e-44f8-96b9-6e379e4afffe	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
唑来膦酸	5eadc434-722b-4dcd-b3c0-148f2d00560c	0	\N	\N	\N	\N	注射剂	\N	\N	限重度骨质疏松或癌症骨转移	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
哌拉西林他唑巴坦	f626fd6c-ec47-42bc-8065-4146438828b9	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确药敏试验证据或重症感染的患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
奥硝唑	5ebba355-f672-49d6-ab6f-aa71eb2f0545	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
异环磷酰胺	dc334290-c73e-4e50-889c-20f2290bef4c	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
来曲唑	b78589d7-f60d-4544-84e8-9a913ed1cded	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
阿法替尼	74d7903a-b2df-4866-87ad-4d162c28fe4a	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限1.具有EGFR基因敏感突变的局部晚期或转移性非小细胞肺癌，既往未接受过EGFR-TKI治疗；2.含铂化疗期间或化疗后疾病进展的局部晚期或转移性鳞状组织学类型的非小细胞肺 癌。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
人表皮生长因子[重组人表皮生长因子（酵母）]	f6bb9a71-5ef0-4e85-882a-ed96d376d124	0	\N	\N	\N	\N	滴眼剂	\N	\N	限有明确角膜溃疡或角膜损伤的患者	\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
聚乙二醇干扰素α-2a	6dc1026c-fea2-4fdb-af55-85398dc94322	0	\N	\N	\N	\N	注射剂	\N	\N	限丙肝、慢性活动性乙肝，连续使用6个月无效时停药，连续使用不超过12个月	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
雷尼替丁	e24b39b6-75c5-4bf1-91b2-e23e4dca318f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
磺胺嘧啶	ec6da686-ba31-435d-b67c-4e63113e7748	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
度洛西汀	ad32f405-d152-49eb-b59e-fbac7e83c283	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
右丙亚胺（右雷佐生）	3244d730-0e09-4b54-a801-d062a2b85ef6	0	\N	\N	\N	\N	注射剂	\N	\N	限在使用多柔比星后并有心脏损害临床证据	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
对氨基水杨酸钠	841f598d-2c73-4e58-b6bc-01e1a4f886ad	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
复方对乙酰氨基酚	68a2522a-755f-429d-b85d-521a0d009f35	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
他扎罗汀	31937c78-50ab-4ae7-b2f4-70fcf6483b99	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
厄他培南	4a1d998b-a656-4404-ba1a-2e28cf7090c7	0	\N	\N	\N	\N	注射剂	\N	\N	限多重耐药的重症感染	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
毛果芸香碱	33c5b3c3-a732-4402-a966-66fb681dac9e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
氟胞嘧啶	d4970e46-001d-4111-a403-258edb812cfd	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
可待因	eb6ab588-a342-4a04-9c5a-ed74324bd062	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
黄体酮	986e1b13-648a-4ebc-aedf-bb746f0db84a	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
吉非替尼	945cb378-f16c-47c4-b7d8-6a631313ecfa	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限EGFR基因敏感突变的晚期非小细胞肺癌	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
咪康唑	f8ff17e2-dc8c-4e31-9299-18b7eb633d07	0	\N	\N	\N	\N	阴道泡腾片	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
氨酚待因Ⅰ氨酚待因Ⅱ	3482e4ec-6c5e-4782-9d8f-02c427ab6082	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
缬沙坦氨氯地平Ⅰ缬沙坦氨氯地平Ⅱ	56fb52e4-2d45-4127-9bee-6bb62e8e3cc3	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
尼卡地平	9f194a93-df00-4944-9ce2-6369a38a3f7d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
曲妥珠单抗	6edc0c0a-b404-4635-8e55-ff7fecb17b35	0	\N	\N	\N	\N	注射剂	\N	\N	限以下情况方可支付：1.HER2阳性的转移性乳腺癌；2.HER2阳性的早期乳腺癌患者的辅助和新辅助治疗，支付不超过12 个月；3.HER2阳性的转移性胃癌患者。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
依托泊苷	daef2152-146c-4f9f-aca7-827ad0070bc6	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
普萘洛尔	ccec2243-d4c4-4dbd-a6f6-9eb4c4d8681a	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
雷尼替丁	99ab2139-0f30-4b23-9568-df899cd2ea16	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
人干扰素α2b(重组人干扰素α-2b)	23809bdf-a65d-4e2b-8d32-a509dbad331b	0	\N	\N	\N	\N	注射剂	\N	\N	限白血病、淋巴瘤、黑色素瘤、肾癌、多发性骨髓瘤、丙肝 、慢性活动性乙肝。丙肝、慢性活动性乙肝连续使用6个月 无效时停药，连续使用不超过12个月	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
头孢匹罗	94a2ac23-cbe7-4526-9f11-d34d66ff580e	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确药敏试验证据或重症感染的患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
钆喷酸葡胺	27dcd909-8ce4-487b-97cc-ca93a4545354	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
头孢曲松	557a21bb-e0e7-406d-8580-7c57f1a473a5	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
五氟利多	c49d378e-18ab-4870-b081-0be80857766c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
胺碘酮	672749fa-b651-41d3-a39f-6acb519ca6c7	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
黄体酮	9b816401-96ac-4d78-b51c-ab7cf422aea0	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
糠酸莫米松	1e7538c2-d9e4-4461-b15b-5586cfcfded2	0	\N	\N	\N	\N	凝胶剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
格列美脲	f4c9b62d-ca02-4503-805f-4faf303dc4c3	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
爱普列特	f6c964db-48b4-41d4-86b4-105a15f1dc71	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
复方氨基酸（18AA）复方氨基酸（18AA-Ⅰ）复方氨基酸（18AA-Ⅱ）复方氨基酸（18AA-Ⅲ）复方氨基酸（18AA-Ⅴ）	31f62455-5593-4ce2-8bcc-504ed535e3b9	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
乌司他丁	c032233e-aa17-4b61-9db9-e3ed518f3306	0	\N	\N	\N	\N	注射剂	\N	\N	限急性胰腺炎、慢性复发性胰腺炎患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
溴隐亭	8074aee5-a09f-4a4a-897a-fda5f892eab7	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
曲克芦丁	2263cf9b-3cee-4b02-a565-faf66024e97f	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
左氧氟沙星	8ebc4f37-cfd7-48ef-b53f-7ac512e37b9d	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
舒尼替尼	c2bb8e0f-71ea-4a7c-ad2b-c67b3e6f34ab	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限1.不能手术的晚期肾细胞癌（RCC)；2.甲磺酸伊马替尼治疗失败或不能耐受的胃肠间质瘤（GIST)；3.不可切除的， 转移性高分化进展期胰腺神经内分泌瘤（pNET）成人患者。	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
复方阿替卡因	234ca985-fcea-4ca9-9e5a-7b4d83b4a0d5	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
肌苷	7e97bb09-0bed-4d23-9781-277f1739fa28	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
加巴喷丁	74fa2e72-8c52-4f8a-a389-d8eef438e380	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
锝[99mTc]双半胱氨酸	4b680e1e-8ddd-4616-ba35-d35374e92fa1	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
吗啡	4e35a1a5-7a1b-47fb-959c-37b8c16e1235	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
替诺福韦二吡呋酯	21846731-e02a-4adb-a599-eba449939fc4	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
双氯芬酸 双氯芬酸Ⅱ	0c94c195-d9e4-49b5-8159-161ff3b12d3d	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
硝普钠	fcde4c03-bc84-41e4-82a0-7af29c880115	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
静注人免疫球蛋白（pH4）	37170e5e-cd37-4fe9-826c-fae15aeb10ed	0	\N	\N	\N	\N	注射剂	\N	\N	限原发性免疫球蛋白缺乏症；新生儿败血症；重型原发性免疫性血小板减少症；川崎病；全身型重症肌无力；急性格林 巴利综合征	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
苯唑西林	889ffefd-6e1c-4eb1-89e7-9844e12653d2	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
阿哌沙班	c54d5380-9f87-43c0-a093-aaf319c90085	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限下肢关节置换手术患者	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
麻黄碱	dd787abd-a4e4-4e44-bbe2-9a21fbbde6bf	0	\N	\N	\N	\N	滴鼻剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	甲	\N	\N	\N
精蛋白锌胰岛素(30R)	9b168fe0-db7b-41ed-9d50-1ab495619f84	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
贝那普利	2499d147-9320-4b90-800b-26adf8d44939	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
米库氯铵	79c63d3d-5217-48d6-8ed4-23c0cab230f6	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
替普瑞酮	dbba522f-6157-4723-a1de-abdf8fdfbd32	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
吗替麦考酚酯	fcf28959-7444-4360-9516-30a93142bf49	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限器官移植后的抗排异反应和Ⅲ-Ⅴ型狼疮性肾炎的患者	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
头孢拉定	ff6f596f-b538-4c63-b54f-7fc1c3381b2e	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
非诺贝特 非诺贝特Ⅱ非诺贝特Ⅲ	1f6ccb25-6cac-4c7a-a58f-92e005cfa9ac	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
匹伐他汀	4867d8bd-0462-4fee-98cf-3bc08b9160f4	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
苯唑西林	b33c5a22-b238-4c87-a1dd-065feeeb432d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
甲硝唑	5cc8c465-40c1-4f51-b087-5c07be101cba	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
蛇毒血凝酶	634361a1-9fa0-488c-96d9-19a083fd4924	0	\N	\N	\N	\N	注射剂	\N	\N	限出血性疾病治疗的二线用药；预防使用不予支付	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
重组人白介素-11（Ⅰ）	d30dee7d-eea7-4c22-b577-bbe8ad48a278	0	\N	\N	\N	\N	注射剂	\N	\N	限放化疗引起的严重血小板减少患者	\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
重组牛碱性成纤维细胞生长因子	9cc085d4-d359-44c5-b0b4-6be91806505f	0	\N	\N	\N	\N	眼用凝胶剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
门冬氨酸鸟氨酸	f2d5a7e8-23b6-436d-a9fe-185fe7eed410	0	\N	\N	\N	\N	注射剂	\N	\N	限肝性脑病	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
胆维丁	9ac70b74-9818-4f02-9d6d-3cbede004e10	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
卡培他滨	a629f204-bddd-4af4-a311-9a737b02f7cc	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
替比夫定	cc914734-74e4-4b66-9e0d-37981d5886dd	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限有活动性乙型肝炎的明确诊断及检验证据或母婴乙肝传播阻断	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
特利加压素	11a6afaf-d6d7-4b3e-92b4-917d2d373cdb	0	\N	\N	\N	\N	注射剂	\N	\N	限食管静脉曲张出血抢救	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
膦甲酸钠葡萄糖	3f9cab71-3d07-4958-a10d-4edc1c366946	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
华法林	7472de4a-7d09-4309-be74-a7836762d492	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
肠内营养剂(TPF-D)	3bb76873-12b6-42cd-84cb-d9bfb5ff42fd	0	\N	\N	\N	\N	口服混悬剂	\N	\N	限糖尿病患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
头孢美唑	63a5740e-028e-48f5-9959-11d2f50ad98b	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确药敏试验证据或重症感染的患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
丙戊酸镁	a5e83b12-b19e-47ec-990f-2b1405f89794	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
氨甲苯酸氯化钠	ae74b86e-cbe3-4040-8de9-b528e03e8872	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
羟乙膦酸	83bf2987-e249-49b3-beaf-017e31157d25	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限中重度骨质疏松	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
辅酶Q10	e284c9f1-3b17-48d7-8421-4278d85b6974	0	\N	\N	\N	\N	注射剂	\N	\N	限急救、抢救	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
米格来宁	93d28e89-3ece-4767-98a1-868405b136f6	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
可的松	41994c05-5601-4350-911d-e4860de774e5	0	\N	\N	\N	\N	眼膏剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
普罗帕酮	9206689a-81dd-4180-94ac-38c874ce73dc	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	甲	\N	\N	\N
聚甲酚磺醛	0b838d75-b31f-445f-bb9c-4fb2fb70cddb	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
精蛋白锌重组赖脯胰岛素混合(50R)	4daea3a0-d2ac-41d6-8883-1fb2fb386497	0	\N	\N	\N	\N	注射剂	\N	\N	限1型糖尿病患者；限其他短效胰岛素或口服药难以控制的2型糖尿病患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
阿司匹林	8f79bbd3-fd60-40af-b265-fb84cb17efcd	0	\N	\N	\N	\N	口服常释剂型 （不含分散 片）	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
氢醌	40ebbd3c-1161-464e-8948-4df2bddbee26	0	\N	\N	\N	\N	软膏剂	\N	\N	限工伤保险	\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
地西泮	d049b7e1-fb23-40d2-9e7f-2f9d38057bbc	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
顺铂	e8205d94-0bd6-48d9-971c-add6971c9011	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
蒙脱石	bb1655bb-73e9-4ab3-af28-f6d195aa6172	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
利培酮	d494e5ef-0394-4f8d-9628-c6dc068ea475	0	\N	\N	\N	\N	口腔崩解片	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
环磷酰胺	3ec96f84-1291-4003-89b6-dacc0753b26b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	甲	\N	\N	\N
精蛋白锌重组赖脯胰岛素混合(25R)	e08e63c8-4ddd-4724-983c-e2ca459c828f	0	\N	\N	\N	\N	注射剂	\N	\N	限1型糖尿病患者；限其他短效胰岛素或口服药难以控制的2型糖尿病患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
麦角新碱	9b16fe2a-8d00-4c7c-a916-7063076dc20a	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
那他霉素	66852388-1a22-4733-8916-019f3d5292d2	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
二甲双胍维格列汀Ⅱ二甲双胍维格列汀Ⅲ	794c3fc9-a9d4-467d-b6ca-b3b715237dcc	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
甲羟孕酮	4a6aabc1-9c64-48ae-8393-503ad6f2a093	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	甲	\N	\N	\N
美洛西林	63a4618f-fb78-47c7-a481-f40b0cf34544	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
多糖铁复合物	2f7030dd-5d92-4c8b-8482-4e8685ea5c7c	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
罗红霉素	61facfe0-e7b8-4a60-b089-2c3768dc67ba	0	\N	\N	\N	\N	颗粒剂	\N	\N	限儿童	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
铝碳酸镁	cfb906df-7e47-44dc-9204-b645bc6760ea	0	\N	\N	\N	\N	咀嚼片	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
米非司酮 米非司酮Ⅱ	1aa8d2a1-64dd-4720-817d-6612d93bc9fa	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限生育保险	\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
复方聚乙二醇电解质Ⅰ复方聚乙二醇电解质Ⅱ复方聚乙二醇电解质Ⅲ复方聚乙二醇电解质Ⅳ	e33fad17-1a11-4b72-9a15-d1b8ee03d0f6	0	\N	\N	\N	\N	口服散剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
尼卡地平	8e1d2652-b78a-4227-be09-4a82b1e1c77e	0	\N	\N	\N	\N	缓释控释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
牛碱性成纤维细胞生长因子(重组牛碱性成纤维细胞生长因子)	3dcd1d55-be39-45b5-bb5c-c4c42800db0c	0	\N	\N	\N	\N	滴眼剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
包醛氧淀粉	65b51bab-8b62-4d0a-b31e-d7eeec41b710	0	\N	\N	\N	\N	口服散剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
阿格列汀	2f1e3512-d6f1-42b2-ac49-4de61e334ed3	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限二线用药	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
依托考昔	c6ab74ac-83b0-4a65-a022-ae3bd2c46c3b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
呋麻	7d1baeb4-193d-4bce-bf5a-0ecdbdf9bbe6	0	\N	\N	\N	\N	滴鼻剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
铝碳酸镁	74bb534d-df74-43db-9c35-db6192b6c759	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
格拉司琼	1489e9da-0d2a-4769-9398-56ec9ddfbe18	0	\N	\N	\N	\N	注射剂	\N	\N	限放化疗且吞咽困难患者	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
颠茄	659e7655-72e6-4eef-b288-afb0d8fa7c05	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
阿莫西林克拉维酸	e687c5a2-8fb7-4419-94b1-25710b8a695f	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
吉非罗齐	5f35a099-caa9-4fa2-9567-8abb14b4bdea	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
哌拉西林	0deb4129-4804-420d-b533-9ced54aa4785	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
因卡膦酸二钠（英卡膦酸二钠）	82e00ea5-50b2-4e03-bab3-93ac8c6764fe	0	\N	\N	\N	\N	注射剂	\N	\N	限恶性肿瘤骨转移并有明显癌痛的患者	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
碘帕醇	449a4fa8-f80b-47f9-bd3b-17996a1d7e9d	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
艾司洛尔	0e5ba0c2-328f-4455-9507-ae5758fb8f7a	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
头孢拉定	67e08ad7-3e7f-4387-9ade-fd2ac035482b	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
洛索洛芬	14ddb905-22d2-4c76-b0ac-d32f3174f811	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
二巯丙磺钠	fe122b91-5afc-4500-a7f4-9773eb9d0581	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	甲	\N	\N	\N
林可霉素	ae2e168f-9789-4a33-b055-eb4fff9ea100	0	\N	\N	\N	\N	滴耳剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	甲	\N	\N	\N
利塞膦酸	200516d3-0821-4a50-b529-582b216c0ad5	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限中重度骨质疏松	\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
氟比洛芬	511ee117-ff08-4759-bfa7-ca6717aeea17	0	\N	\N	\N	\N	巴布膏剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
他扎罗汀倍他米松	cc5b1df9-fe42-48da-a133-8658b95bfde4	0	\N	\N	\N	\N	软膏剂	\N	\N		\N	\N	\N	\N	\N	b1130ef7-2502-4225-96b3-21ea964a3f8f	乙	\N	\N	\N
替硝唑	17e5f1ae-a553-4cdb-bebb-16fff5aabf4c	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
咯萘啶	c66f4d6c-ecf5-4288-976e-18548f23a387	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	adb80c4d-8829-4c0e-99f6-38c789301d0e	乙	\N	\N	\N
阿奇霉素	fe9fdeea-76ba-4fae-811b-0e9ca53922e8	0	\N	\N	\N	\N	颗粒剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	甲	\N	\N	\N
头孢丙烯	8e4c3317-ae46-4c8e-9b64-a0589968765b	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
银杏蜜环	708344a7-b2b3-4b3b-93d4-c41f67e50f3e	0	\N	\N	\N	\N	口服液体剂	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
樟脑	3de84014-92d9-4f90-ab28-eb0ca3c7354b	0	\N	\N	\N	\N	醑剂	\N	\N		\N	\N	\N	\N	\N	64387702-f538-4d46-a240-a9efef71e9ad	乙	\N	\N	\N
左氧氟沙星	6755a93c-da12-4cbd-959f-4348e0170b82	0	\N	\N	\N	\N	滴耳剂	\N	\N		\N	\N	\N	\N	\N	3df951ae-3c71-4be2-bd76-8e0ecdc7b0d9	乙	\N	\N	\N
肠内营养剂(TPSPA)	301e9e4e-531e-48fb-87b6-10270be11c55	0	\N	\N	\N	\N	口服混悬剂	\N	\N	限重症患者	\N	\N	\N	\N	\N	9bbb0b50-8b07-40e7-a820-05b11a5caed3	乙	\N	\N	\N
氯米帕明	8a2d54aa-35d8-43c4-b72b-ffaa6f524a3b	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	甲	\N	\N	\N
碳酸钙	2aece4e7-4f85-4ce1-83b4-d53b9271cb13	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
奥氮平	e039732d-537b-4b0f-8d99-3ec73b88be67	0	\N	\N	\N	\N	口腔崩解片	\N	\N	限吞咽困难的患者	\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
氨曲南	da505883-0ad7-47a9-9eb9-fa0eb2063190	0	\N	\N	\N	\N	注射剂	\N	\N	限有明确药敏试验证据或重症感染的患者	\N	\N	\N	\N	\N	22c9233b-af5a-4724-954c-5c8c2df6babd	乙	\N	\N	\N
氢化可的松	777a6fe1-b8ec-4185-9445-6f157009b190	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	甲	\N	\N	\N
帕立骨化醇	ec7162d0-4828-4c24-a805-53040f8fc0e7	0	\N	\N	\N	\N	注射剂	\N	\N	限血透且有继发性甲状旁腺功能亢进的患者	\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
依托咪酯	842c51ed-2ac0-465e-bf1e-57e8fcd802fa	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
托瑞米芬	356cb832-f918-4b80-ab6c-7aa0b1018809	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
胰酶	d5a070a6-d5bc-42b1-800e-0fbc7a819132	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
氯化钾	2f892c78-9363-458d-8a2b-0018905682ea	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	甲	\N	\N	\N
水飞蓟素	6b404249-79a9-468b-83c3-0a4f970380c0	0	\N	\N	\N	\N	口服常释剂型	\N	\N	限中毒性肝脏损害	\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
精蛋白人胰岛素混合(30R)（30/70混合重组人胰岛素）	0ffd0ea5-120c-43e5-8ace-a73e9c4fe5b4	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
曲普利啶	7645a2c9-1bbe-40d5-835c-67fa18494401	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
氨酚羟考酮	88ecd0e4-de6a-4684-bd4c-316ccae50d38	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	1d8fa51d-ec42-4073-bf0e-cb304f60a891	乙	\N	\N	\N
苯达莫司汀	f828a2a7-8ed6-4d43-ac1a-8fb9dbf6ec68	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	c2494299-0691-4f02-964d-76ba0e9ad357	乙	\N	\N	\N
果糖	e1c0b053-7ccc-403b-99c3-cb8ce88f5e75	0	\N	\N	\N	\N	注射剂	\N	\N	限因胰岛素抵抗无法使用葡萄糖的抢救患者，果糖总量每日不超过50g	\N	\N	\N	\N	\N	d4d6b335-7ab8-4f47-b8e7-3ef1ac8bac18	乙	\N	\N	\N
银杏叶提取物	1c51b169-a516-4459-850b-e40d272e34e1	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	e065b1aa-d114-45d4-9242-7254a92de540	乙	\N	\N	\N
倍他米松	7ca64f79-6360-462a-94a6-2ecffcceb823	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	56cd55c5-0b24-43ea-b1e9-3c747b39a2bd	乙	\N	\N	\N
噻托溴铵	61c61794-ba42-4649-8b6e-327b6dab3252	0	\N	\N	\N	\N	吸入剂	\N	\N		\N	\N	\N	\N	\N	3620342b-4430-4eed-9ca2-ca25604ce783	乙	\N	\N	\N
卡前列甲酯	140236aa-9355-4dd4-a209-bc9bbb0bcaec	0	\N	\N	\N	\N	栓剂	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
精蛋白人胰岛素混合(30R)[精蛋白重组人胰岛素混合（30R）]	1dd1b3d0-0f8f-4cd8-a92f-387ea130a6ad	0	\N	\N	\N	\N	注射剂	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	甲	\N	\N	\N
利福昔明	e61f273e-61aa-4c0f-a7a1-c105bcb7bacc	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
炔诺酮	19b004ce-a591-4c0c-a58a-2f2200515287	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	f17898c3-4f1b-4912-ab30-c3590909a44e	乙	\N	\N	\N
雷贝拉唑	a909a8e8-9e4a-4cdf-b699-473ecde61e6e	0	\N	\N	\N	\N	口服常释剂型	\N	\N		\N	\N	\N	\N	\N	4906cf0e-f6ae-454f-9890-874ab1e0e46b	乙	\N	\N	\N
\.


--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.inventory (inv_id, drug_id, stock, money, warning, drug_name, purchase) FROM stdin;
\.


--
-- Data for Name: purchase; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.purchase (per_id, in_time, kind, money, "order") FROM stdin;
fd2cadc5-67f4-4f6a-8b63-a451d92e2006	2023-01-25 09:04:18.130465	2	330	\N
21c7816b-29fe-4d5f-a28f-b0960c028acb	2023-01-25 09:04:29.064442	2	330	\N
b5de8002-8c9c-432c-bf66-9d49ad34c81f	2023-01-29 09:10:46.798417	2	6	\N
554eeaee-b77b-4010-b76a-d0f198e27d83	2023-01-29 10:15:11.033872	1	2	\N
\.


--
-- Data for Name: purchase_detail0; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.purchase_detail0 (purchase, drug_id, number, name, sale_money, pur_detail_id, self_money) FROM stdin;
fd2cadc5-67f4-4f6a-8b63-a451d92e2006	f817e560-0e19-4345-a968-1cced8e787a4	12	阿莫西林	150	9d354963-5b5c-4e93-94fe-e4e81e448e2c	100
21c7816b-29fe-4d5f-a28f-b0960c028acb	f817e560-0e19-4345-a968-1cced8e787a4	12	阿莫西林	150	f1913b64-627e-4066-a8a6-9d6abe1b192f	100
b5de8002-8c9c-432c-bf66-9d49ad34c81f	ab57b648-0d98-47eb-97eb-261d8fe265e7	1	人干扰素α2a[重组人干扰素α- 2a（酵母）]	2	1e48c867-aa8d-407e-a071-b58f2e2acd77	3
554eeaee-b77b-4010-b76a-d0f198e27d83	7d8aacf7-8504-4017-90cf-1bdb44b0e176	10	人干扰素α2a[重组人干扰素α- 2a（酵母）]	320	3c365077-3bde-477a-8226-c1c3880ce9b4	2
\.


--
-- Data for Name: purchase_detail1; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.purchase_detail1 (purchase, drug_id, number, name, money, sale_money, pur_detail_id) FROM stdin;
\.


--
-- Data for Name: purchase_detail2; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.purchase_detail2 (purchase, drug_id, number, name, money, sale_money, pur_detail_id) FROM stdin;
\.


--
-- Data for Name: purchase_detail3; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.purchase_detail3 (purchase, drug_id, number, name, money, sale_money, pur_detail_id) FROM stdin;
\.


--
-- Data for Name: purchase_detail4; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.purchase_detail4 (purchase, drug_id, number, name, money, sale_money, pur_detail_id) FROM stdin;
\.


--
-- Data for Name: sale; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.sale (sale_id, drug_name, drug_id, sale_number, money, total, sale_time) FROM stdin;
57bd3704-8aba-4d65-8298-4b8469ce2577	重组人白介素-2（125Ala）	9a912377-c07f-4a5a-bca5-33dea86afc1d	3	2	1	2023-01-28 06:51:20.411722
2558ee6c-ad95-4a53-8136-8bb331102e17	丝裂霉素	4a274bca-ff5e-420d-a84e-f5f45d6967e9	1	2	3	2023-01-28 06:51:20.429299
\.


--
-- Name: classification classification_class_id_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_class_id_key UNIQUE (class_id);


--
-- Name: classification classification_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (class_id);


--
-- Name: drug drug_approval_number_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.drug
    ADD CONSTRAINT drug_approval_number_key UNIQUE (approval_number);


--
-- Name: purchase purchase_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_pk PRIMARY KEY (per_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: user
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

