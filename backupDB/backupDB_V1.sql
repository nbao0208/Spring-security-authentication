--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Debian 14.10-1.pgdg120+1)
-- Dumped by pg_dump version 14.10 (Debian 14.10-1.pgdg120+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO baonguyen;

--
-- Name: swj_group; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.swj_group (
    id bigint NOT NULL,
    role character varying(25) NOT NULL,
    created_by character varying(255) NOT NULL,
    modified_by character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.swj_group OWNER TO baonguyen;

--
-- Name: TABLE swj_group; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.swj_group IS 'group table';


--
-- Name: COLUMN swj_group.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_group.id IS 'id of group and this is unique';


--
-- Name: COLUMN swj_group.role; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_group.role IS 'the role of the group';


--
-- Name: COLUMN swj_group.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_group.created_by IS 'the person post data';


--
-- Name: COLUMN swj_group.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_group.modified_by IS 'the person modified data';


--
-- Name: COLUMN swj_group.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_group.created IS 'time post new data';


--
-- Name: COLUMN swj_group.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_group.modified IS 'time modify data';


--
-- Name: COLUMN swj_group.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_group.is_deleted IS 'data is deleted or not';


--
-- Name: swj_group_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.swj_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.swj_group_id_seq OWNER TO baonguyen;

--
-- Name: swj_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.swj_group_id_seq OWNED BY public.swj_group.id;


--
-- Name: swj_user; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.swj_user (
    id bigint NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    dob date NOT NULL,
    created_by character varying(255) NOT NULL,
    modified_by character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.swj_user OWNER TO baonguyen;

--
-- Name: TABLE swj_user; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.swj_user IS 'user table';


--
-- Name: COLUMN swj_user.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user.id IS 'id of user and this is unique';


--
-- Name: COLUMN swj_user.name; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user.name IS 'the name of user';


--
-- Name: COLUMN swj_user.email; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user.email IS 'the email of user';


--
-- Name: COLUMN swj_user.dob; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user.dob IS 'date of birth of user';


--
-- Name: COLUMN swj_user.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user.created_by IS 'the person post data';


--
-- Name: COLUMN swj_user.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user.modified_by IS 'the person modified data';


--
-- Name: COLUMN swj_user.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user.created IS 'time post new data';


--
-- Name: COLUMN swj_user.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user.modified IS 'time modify data';


--
-- Name: COLUMN swj_user.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user.is_deleted IS 'data is deleted or not';


--
-- Name: swj_user_account; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.swj_user_account (
    id bigint NOT NULL,
    account_name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    swj_user_group_id bigint NOT NULL,
    created_by character varying(255) NOT NULL,
    modified_by character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.swj_user_account OWNER TO baonguyen;

--
-- Name: TABLE swj_user_account; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.swj_user_account IS 'user account table';


--
-- Name: COLUMN swj_user_account.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_account.id IS 'id of user account';


--
-- Name: COLUMN swj_user_account.account_name; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_account.account_name IS 'name of the account';


--
-- Name: COLUMN swj_user_account.password; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_account.password IS 'password of the account';


--
-- Name: COLUMN swj_user_account.swj_user_group_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_account.swj_user_group_id IS 'foreign key referencing user-group id';


--
-- Name: COLUMN swj_user_account.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_account.created_by IS 'the person post data';


--
-- Name: COLUMN swj_user_account.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_account.modified_by IS 'the person modified data';


--
-- Name: COLUMN swj_user_account.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_account.created IS 'time post new data';


--
-- Name: COLUMN swj_user_account.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_account.modified IS 'time modify data';


--
-- Name: COLUMN swj_user_account.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_account.is_deleted IS 'data is deleted or not';


--
-- Name: swj_user_account_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.swj_user_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.swj_user_account_id_seq OWNER TO baonguyen;

--
-- Name: swj_user_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.swj_user_account_id_seq OWNED BY public.swj_user_account.id;


--
-- Name: swj_user_group; Type: TABLE; Schema: public; Owner: baonguyen
--

CREATE TABLE public.swj_user_group (
    id bigint NOT NULL,
    swj_user_id bigint NOT NULL,
    swj_group_id bigint NOT NULL,
    created_by character varying(255) NOT NULL,
    modified_by character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.swj_user_group OWNER TO baonguyen;

--
-- Name: TABLE swj_user_group; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON TABLE public.swj_user_group IS 'user-group relationship table';


--
-- Name: COLUMN swj_user_group.id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_group.id IS 'id of user-group relationship';


--
-- Name: COLUMN swj_user_group.swj_user_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_group.swj_user_id IS 'foreign key referencing user id';


--
-- Name: COLUMN swj_user_group.swj_group_id; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_group.swj_group_id IS 'foreign key referencing group id';


--
-- Name: COLUMN swj_user_group.created_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_group.created_by IS 'the person post data';


--
-- Name: COLUMN swj_user_group.modified_by; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_group.modified_by IS 'the person modified data';


--
-- Name: COLUMN swj_user_group.created; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_group.created IS 'time post new data';


--
-- Name: COLUMN swj_user_group.modified; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_group.modified IS 'time modify data';


--
-- Name: COLUMN swj_user_group.is_deleted; Type: COMMENT; Schema: public; Owner: baonguyen
--

COMMENT ON COLUMN public.swj_user_group.is_deleted IS 'data is deleted or not';


--
-- Name: swj_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.swj_user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.swj_user_group_id_seq OWNER TO baonguyen;

--
-- Name: swj_user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.swj_user_group_id_seq OWNED BY public.swj_user_group.id;


--
-- Name: swj_user_id_seq; Type: SEQUENCE; Schema: public; Owner: baonguyen
--

CREATE SEQUENCE public.swj_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.swj_user_id_seq OWNER TO baonguyen;

--
-- Name: swj_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: baonguyen
--

ALTER SEQUENCE public.swj_user_id_seq OWNED BY public.swj_user.id;


--
-- Name: swj_group id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.swj_group ALTER COLUMN id SET DEFAULT nextval('public.swj_group_id_seq'::regclass);


--
-- Name: swj_user id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.swj_user ALTER COLUMN id SET DEFAULT nextval('public.swj_user_id_seq'::regclass);


--
-- Name: swj_user_account id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.swj_user_account ALTER COLUMN id SET DEFAULT nextval('public.swj_user_account_id_seq'::regclass);


--
-- Name: swj_user_group id; Type: DEFAULT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.swj_user_group ALTER COLUMN id SET DEFAULT nextval('public.swj_user_group_id_seq'::regclass);


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	0.00	create table swj user	SQL	V0_00__create_table_swj_user.sql	-365847235	baonguyen	2024-05-25 19:51:53.503129	31	t
2	0.01	create table swj group	SQL	V0_01__create_table_swj_group.sql	-1315426365	baonguyen	2024-05-25 19:51:53.553413	9	t
3	0.02	create table swj user group	SQL	V0_02__create_table_swj_user_group.sql	1728735254	baonguyen	2024-05-25 19:51:53.576718	11	t
4	0.03	create table swj user account	SQL	V0_03__create_table_swj_user_account.sql	1241603119	baonguyen	2024-05-25 19:51:53.599107	9	t
\.


--
-- Data for Name: swj_group; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.swj_group (id, role, created_by, modified_by, created, modified, is_deleted) FROM stdin;
\.


--
-- Data for Name: swj_user; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.swj_user (id, name, email, dob, created_by, modified_by, created, modified, is_deleted) FROM stdin;
\.


--
-- Data for Name: swj_user_account; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.swj_user_account (id, account_name, password, swj_user_group_id, created_by, modified_by, created, modified, is_deleted) FROM stdin;
\.


--
-- Data for Name: swj_user_group; Type: TABLE DATA; Schema: public; Owner: baonguyen
--

COPY public.swj_user_group (id, swj_user_id, swj_group_id, created_by, modified_by, created, modified, is_deleted) FROM stdin;
\.


--
-- Name: swj_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.swj_group_id_seq', 1, false);


--
-- Name: swj_user_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.swj_user_account_id_seq', 1, false);


--
-- Name: swj_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.swj_user_group_id_seq', 1, false);


--
-- Name: swj_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: baonguyen
--

SELECT pg_catalog.setval('public.swj_user_id_seq', 1, false);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: swj_group swj_group_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.swj_group
    ADD CONSTRAINT swj_group_pkey PRIMARY KEY (id);


--
-- Name: swj_user_account swj_user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.swj_user_account
    ADD CONSTRAINT swj_user_account_pkey PRIMARY KEY (id);


--
-- Name: swj_user_group swj_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.swj_user_group
    ADD CONSTRAINT swj_user_group_pkey PRIMARY KEY (id);


--
-- Name: swj_user swj_user_pkey; Type: CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.swj_user
    ADD CONSTRAINT swj_user_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: baonguyen
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: swj_user_group FK_swj_group_id_swj_user_group; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.swj_user_group
    ADD CONSTRAINT "FK_swj_group_id_swj_user_group" FOREIGN KEY (swj_group_id) REFERENCES public.swj_group(id);


--
-- Name: swj_user_account FK_swj_user_group_id_swj_user_account; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.swj_user_account
    ADD CONSTRAINT "FK_swj_user_group_id_swj_user_account" FOREIGN KEY (swj_user_group_id) REFERENCES public.swj_user_group(id) ON DELETE CASCADE;


--
-- Name: swj_user_group FK_swj_user_id_swj_user_group; Type: FK CONSTRAINT; Schema: public; Owner: baonguyen
--

ALTER TABLE ONLY public.swj_user_group
    ADD CONSTRAINT "FK_swj_user_id_swj_user_group" FOREIGN KEY (swj_user_id) REFERENCES public.swj_user(id);


--
-- PostgreSQL database dump complete
--

