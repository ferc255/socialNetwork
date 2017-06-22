--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts_userprofile; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE accounts_userprofile (
    id integer NOT NULL,
    city character varying(100) NOT NULL,
    age integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.accounts_userprofile OWNER TO django;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE accounts_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userprofile_id_seq OWNER TO django;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE accounts_userprofile_id_seq OWNED BY accounts_userprofile.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO django;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO django;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO django;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO django;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO django;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO django;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO django;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO django;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO django;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO django;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO django;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO django;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO django;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO django;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO django;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO django;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO django;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO django;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO django;

--
-- Name: talk_friend; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE talk_friend (
    id integer NOT NULL,
    current_user_id integer
);


ALTER TABLE public.talk_friend OWNER TO django;

--
-- Name: talk_friend_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE talk_friend_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.talk_friend_id_seq OWNER TO django;

--
-- Name: talk_friend_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE talk_friend_id_seq OWNED BY talk_friend.id;


--
-- Name: talk_friend_users; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE talk_friend_users (
    id integer NOT NULL,
    friend_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.talk_friend_users OWNER TO django;

--
-- Name: talk_friend_users_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE talk_friend_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.talk_friend_users_id_seq OWNER TO django;

--
-- Name: talk_friend_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE talk_friend_users_id_seq OWNED BY talk_friend_users.id;


--
-- Name: talk_message; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE talk_message (
    id integer NOT NULL,
    text character varying(500) NOT NULL,
    read boolean NOT NULL,
    date timestamp with time zone NOT NULL,
    receiver_id integer NOT NULL,
    sender_id integer NOT NULL
);


ALTER TABLE public.talk_message OWNER TO django;

--
-- Name: talk_message_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE talk_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.talk_message_id_seq OWNER TO django;

--
-- Name: talk_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE talk_message_id_seq OWNED BY talk_message.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY accounts_userprofile ALTER COLUMN id SET DEFAULT nextval('accounts_userprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY talk_friend ALTER COLUMN id SET DEFAULT nextval('talk_friend_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY talk_friend_users ALTER COLUMN id SET DEFAULT nextval('talk_friend_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY talk_message ALTER COLUMN id SET DEFAULT nextval('talk_message_id_seq'::regclass);


--
-- Data for Name: accounts_userprofile; Type: TABLE DATA; Schema: public; Owner: django
--

COPY accounts_userprofile (id, city, age, user_id) FROM stdin;
1	 	0	1
2	 	0	2
3	 	0	3
4	 	0	4
5	 	0	5
6	 	0	6
\.


--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('accounts_userprofile_id_seq', 6, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user profile	1	add_userprofile
2	Can change user profile	1	change_userprofile
3	Can delete user profile	1	delete_userprofile
4	Can add friend	2	add_friend
5	Can change friend	2	change_friend
6	Can delete friend	2	delete_friend
7	Can add message	3	add_message
8	Can change message	3	change_message
9	Can delete message	3	delete_message
10	Can add log entry	4	add_logentry
11	Can change log entry	4	change_logentry
12	Can delete log entry	4	delete_logentry
13	Can add group	5	add_group
14	Can change group	5	change_group
15	Can delete group	5	delete_group
16	Can add permission	6	add_permission
17	Can change permission	6	change_permission
18	Can delete permission	6	delete_permission
19	Can add user	7	add_user
20	Can change user	7	change_user
21	Can delete user	7	delete_user
22	Can add content type	8	add_contenttype
23	Can change content type	8	change_contenttype
24	Can delete content type	8	delete_contenttype
25	Can add session	9	add_session
26	Can change session	9	change_session
27	Can delete session	9	delete_session
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_permission_id_seq', 27, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4	pbkdf2_sha256$36000$fRVvPXMqxPe3$zQpxIascfyqVqFmTE0Hgz1Xjo2PF1DX6FsC1fqPHEb0=	2017-05-28 12:24:44.363642+00	f	niknos	Никита	Носов	eyzenhorn97@mail.ru	f	t	2017-05-28 12:24:29.493874+00
5	pbkdf2_sha256$36000$W2Mzqg0JcESC$zWdPbN5fRggZAj9GgXrMPPmghx79j5Nr65De23n9QEw=	2017-05-28 14:19:28.628217+00	f	Biggi	Alex	Lazarchyk	starbigprofessor@gmail.com	f	t	2017-05-28 14:18:58.848728+00
1	pbkdf2_sha256$36000$V002OMXiv49N$nq4j5vdqyTNSSbdSRPAw46uYTfQJ5EwUuHl37BKN69w=	2017-06-13 13:14:01.223427+00	t	admin				t	t	2017-05-27 15:52:03.395044+00
2	pbkdf2_sha256$36000$W4q6SaQ2SoBL$Zp8oREoo3ZcV0wbFwr9hp7we/lLR9iyxjBI0bj8BGhQ=	2017-06-13 14:01:31.190654+00	f	masha	Maria	Belova	ma@sha.ru	f	t	2017-05-27 16:03:00.432255+00
3	pbkdf2_sha256$36000$jkTmMjtbHuiw$bLGX8pSdjNdgFjvtObIKt5vGJLO9N7kJM9Q0ovR1YMo=	2017-06-15 18:14:17.430628+00	f	nast	Anastasiya	TOP	anastasiya37@gmail.com	f	t	2017-05-28 09:09:37+00
6	pbkdf2_sha256$36000$2dR7IH4Q52Zy$fYLHJxoAT4YCKSTqReA8au0PAM+goSHQ7OlTfDaVLEM=	2017-06-19 11:12:12.989032+00	f	volkovda351	Daniil	Volkov	volkovda351@gmail.com	f	t	2017-06-19 11:12:01.841337+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_user_id_seq', 6, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-05-28 11:42:09.360804+00	3	nast	2	[{"changed": {"fields": ["username", "last_name", "email"]}}]	7	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	accounts	userprofile
2	talk	friend
3	talk	message
4	admin	logentry
5	auth	group
6	auth	permission
7	auth	user
8	contenttypes	contenttype
9	sessions	session
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('django_content_type_id_seq', 9, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-05-27 15:50:50.884162+00
2	auth	0001_initial	2017-05-27 15:50:50.926752+00
3	accounts	0001_initial	2017-05-27 15:50:50.941172+00
4	accounts	0002_auto_20170512_1001	2017-05-27 15:50:50.957786+00
5	accounts	0003_auto_20170512_1006	2017-05-27 15:50:50.975855+00
6	accounts	0004_auto_20170512_1047	2017-05-27 15:50:51.004977+00
7	admin	0001_initial	2017-05-27 15:50:51.021246+00
8	admin	0002_logentry_remove_auto_add	2017-05-27 15:50:51.03239+00
9	contenttypes	0002_remove_content_type_name	2017-05-27 15:50:51.056259+00
10	auth	0002_alter_permission_name_max_length	2017-05-27 15:50:51.061868+00
11	auth	0003_alter_user_email_max_length	2017-05-27 15:50:51.072576+00
12	auth	0004_alter_user_username_opts	2017-05-27 15:50:51.082774+00
13	auth	0005_alter_user_last_login_null	2017-05-27 15:50:51.093693+00
14	auth	0006_require_contenttypes_0002	2017-05-27 15:50:51.095164+00
15	auth	0007_alter_validators_add_error_messages	2017-05-27 15:50:51.10631+00
16	auth	0008_alter_user_username_max_length	2017-05-27 15:50:51.120074+00
17	sessions	0001_initial	2017-05-27 15:50:51.134005+00
18	talk	0001_initial	2017-05-27 15:50:51.158002+00
19	talk	0002_message	2017-05-27 15:50:51.177708+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('django_migrations_id_seq', 19, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
t1ha6mrbk6h4nhpimofftur7tjxiykzf	MjQ2MDBhMzVkYzZjZjQxOWJjNmVmM2M5OGQ0NGUzZDYxMWFjYWIyZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJlNGYwZTY3NjVlZDc5M2QzZGE4Mzk3MThiMTc4ZjY5ODE0OWMzZDMwIn0=	2017-06-11 07:09:43.336427+00
4xbcdhpgvcbft1ogf3gio9sbaun8oxru	MDYxMjU1ZTgxYmVjOTI3MWYyYmExMTU1ODI1ZGM1OTY1NDI0MTczODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2hhc2giOiJkNThhYmJiZjgwNzc3ZmVhNDU4MDdiZGFlYTIzNTY4ODMxYTgwZDEyIn0=	2017-06-11 09:09:50.878487+00
17z17w24hy9mq2xy3zzwlww974n8o2gc	MjQ2MDBhMzVkYzZjZjQxOWJjNmVmM2M5OGQ0NGUzZDYxMWFjYWIyZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJlNGYwZTY3NjVlZDc5M2QzZGE4Mzk3MThiMTc4ZjY5ODE0OWMzZDMwIn0=	2017-06-11 11:43:53.918944+00
y8ylss6g6fq6rx9e0otcitl4nrwv7qzf	OTA3YWQyYzRiN2FhMTRiMmZjNDFiNDhlZTlkOWZjOTkxNDFhNTllOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQiLCJfYXV0aF91c2VyX2hhc2giOiJiNDNiOWYyN2RiZWFmYjE4Nzk3ZjViNWYyODQwNDYxN2M5NDFhMjk3In0=	2017-06-11 12:24:44.365457+00
1sn57t4z550tn43y1nn23die8et5vwxa	NWJlNjQwOWQyOWU5ODQxM2VjMjRhYTU0NGQ5MzdhZjNlMTg4ZjQ0ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjUiLCJfYXV0aF91c2VyX2hhc2giOiIzMWNlMDk4NWY0ZjUzZmFlMzYwNzE2ZmE4ZWFiYzJkZGNiY2JjMmViIn0=	2017-06-11 14:19:28.629773+00
a11swehcepxtl42lzwa8w7ff6b0az5n9	MjQ2MDBhMzVkYzZjZjQxOWJjNmVmM2M5OGQ0NGUzZDYxMWFjYWIyZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJlNGYwZTY3NjVlZDc5M2QzZGE4Mzk3MThiMTc4ZjY5ODE0OWMzZDMwIn0=	2017-06-11 18:01:27.636674+00
5rq6mmf2bsf0q2kawek811pt3wqs6ges	NTUzMmZhYTkxNDNmYzRiMzVkNGU5ZjI2YWEwZDE2OWU5OWNkYTQ2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiI3ODkxZTZhNDRkZjk5ZjAwNzQyZDQ1OWNmYjFiMDAwMDg2MjI2Y2FmIn0=	2017-06-12 13:51:42.826317+00
qnhdtkfq5hkunyt72lewlkkex3wyob9g	MjQ2MDBhMzVkYzZjZjQxOWJjNmVmM2M5OGQ0NGUzZDYxMWFjYWIyZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJlNGYwZTY3NjVlZDc5M2QzZGE4Mzk3MThiMTc4ZjY5ODE0OWMzZDMwIn0=	2017-06-26 17:37:11.934828+00
z5t7rtb3ng15rzva20r8znuvbz9spdcb	NDRlOTFhZDAwNmUzYjE0ZmIxZTE2YjRhOTZmYWU1ODQxMzUyMmUzNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTRmMGU2NzY1ZWQ3OTNkM2RhODM5NzE4YjE3OGY2OTgxNDljM2QzMCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-06-27 13:14:01.232793+00
ctk783w2kr044medx18nz5ttsr6hjtu4	NGNmZDU0MGNiYjZlM2E4YWM3MGQ4NWUxOWJlZmZkZjZhNzJkMTNkNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ODkxZTZhNDRkZjk5ZjAwNzQyZDQ1OWNmYjFiMDAwMDg2MjI2Y2FmIn0=	2017-06-27 14:01:31.192693+00
afovvteetur12vvaw7ym4cglo4fah0wt	YTY4MmZkMjVmYmZiNjI3ZGRhNmFmYWNmNGNkMTQzN2JkMThiMDc2NTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJfYXV0aF91c2VyX2hhc2giOiJhOTNiMWYwNjk1Y2I0OTZjOTk1ZDQzNjM1MTcxYzkzMzkwNjk1NTYxIn0=	2017-07-03 11:12:12.991066+00
\.


--
-- Data for Name: talk_friend; Type: TABLE DATA; Schema: public; Owner: django
--

COPY talk_friend (id, current_user_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
\.


--
-- Name: talk_friend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('talk_friend_id_seq', 6, true);


--
-- Data for Name: talk_friend_users; Type: TABLE DATA; Schema: public; Owner: django
--

COPY talk_friend_users (id, friend_id, user_id) FROM stdin;
1	1	2
2	3	1
3	2	3
4	4	1
5	4	3
6	4	2
7	5	1
\.


--
-- Name: talk_friend_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('talk_friend_users_id_seq', 7, true);


--
-- Data for Name: talk_message; Type: TABLE DATA; Schema: public; Owner: django
--

COPY talk_message (id, text, read, date, receiver_id, sender_id) FROM stdin;
4	Hi. Where are you from?	t	2017-05-28 09:12:39.710308+00	3	2
5	hi	f	2017-05-28 11:40:02.280022+00	3	1
7	Hello! :)	f	2017-05-28 15:51:18.010751+00	5	1
6	Hey	t	2017-05-28 14:20:00.950963+00	1	5
2	Hi! You nailed it!!!	t	2017-05-27 17:51:00.864758+00	1	2
8	asd	f	2017-06-15 16:41:17.685491+00	3	1
3	Hi	t	2017-05-28 09:11:07.984024+00	1	3
1	hi. how are you?	t	2017-05-27 16:04:34.366245+00	2	1
\.


--
-- Name: talk_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('talk_message_id_seq', 8, true);


--
-- Name: accounts_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_pkey PRIMARY KEY (id);


--
-- Name: accounts_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: talk_friend_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY talk_friend
    ADD CONSTRAINT talk_friend_pkey PRIMARY KEY (id);


--
-- Name: talk_friend_users_friend_id_user_id_4d96709c_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY talk_friend_users
    ADD CONSTRAINT talk_friend_users_friend_id_user_id_4d96709c_uniq UNIQUE (friend_id, user_id);


--
-- Name: talk_friend_users_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY talk_friend_users
    ADD CONSTRAINT talk_friend_users_pkey PRIMARY KEY (id);


--
-- Name: talk_message_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY talk_message
    ADD CONSTRAINT talk_message_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: talk_friend_current_user_id_9145827f; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX talk_friend_current_user_id_9145827f ON talk_friend USING btree (current_user_id);


--
-- Name: talk_friend_users_friend_id_821e513e; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX talk_friend_users_friend_id_821e513e ON talk_friend_users USING btree (friend_id);


--
-- Name: talk_friend_users_user_id_7fe2692f; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX talk_friend_users_user_id_7fe2692f ON talk_friend_users USING btree (user_id);


--
-- Name: talk_message_receiver_id_04dc5714; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX talk_message_receiver_id_04dc5714 ON talk_message USING btree (receiver_id);


--
-- Name: talk_message_sender_id_a746524a; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX talk_message_sender_id_a746524a ON talk_message USING btree (sender_id);


--
-- Name: accounts_userprofile_user_id_92240672_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_92240672_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: talk_friend_current_user_id_9145827f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY talk_friend
    ADD CONSTRAINT talk_friend_current_user_id_9145827f_fk_auth_user_id FOREIGN KEY (current_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: talk_friend_users_friend_id_821e513e_fk_talk_friend_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY talk_friend_users
    ADD CONSTRAINT talk_friend_users_friend_id_821e513e_fk_talk_friend_id FOREIGN KEY (friend_id) REFERENCES talk_friend(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: talk_friend_users_user_id_7fe2692f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY talk_friend_users
    ADD CONSTRAINT talk_friend_users_user_id_7fe2692f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: talk_message_receiver_id_04dc5714_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY talk_message
    ADD CONSTRAINT talk_message_receiver_id_04dc5714_fk_auth_user_id FOREIGN KEY (receiver_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: talk_message_sender_id_a746524a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY talk_message
    ADD CONSTRAINT talk_message_sender_id_a746524a_fk_auth_user_id FOREIGN KEY (sender_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

