--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2019-01-27 18:27:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16457)
-- Name: batch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.batch (
    time_started timestamp with time zone NOT NULL,
    ph numeric NOT NULL,
    tds numeric NOT NULL,
    color numeric NOT NULL,
    batch_id bigint NOT NULL
);


ALTER TABLE public.batch OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16488)
-- Name: batch_batch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.batch_batch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.batch_batch_id_seq OWNER TO postgres;

--
-- TOC entry 2835 (class 0 OID 0)
-- Dependencies: 198
-- Name: batch_batch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.batch_batch_id_seq OWNED BY public.batch.batch_id;


--
-- TOC entry 197 (class 1259 OID 16465)
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    "time" timestamp with time zone NOT NULL,
    ph numeric NOT NULL,
    tds numeric NOT NULL,
    color numeric NOT NULL,
    valve1 boolean NOT NULL,
    valve2 boolean NOT NULL,
    valve3 boolean NOT NULL,
    valve4 boolean NOT NULL,
    log_id bigint NOT NULL,
    batch_id bigint NOT NULL
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16508)
-- Name: logs_batch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_batch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_batch_id_seq OWNER TO postgres;

--
-- TOC entry 2836 (class 0 OID 0)
-- Dependencies: 200
-- Name: logs_batch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_batch_id_seq OWNED BY public.logs.batch_id;


--
-- TOC entry 199 (class 1259 OID 16499)
-- Name: logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_log_id_seq OWNER TO postgres;

--
-- TOC entry 2837 (class 0 OID 0)
-- Dependencies: 199
-- Name: logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_log_id_seq OWNED BY public.logs.log_id;


--
-- TOC entry 2695 (class 2604 OID 16490)
-- Name: batch batch_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batch ALTER COLUMN batch_id SET DEFAULT nextval('public.batch_batch_id_seq'::regclass);


--
-- TOC entry 2696 (class 2604 OID 16501)
-- Name: logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN log_id SET DEFAULT nextval('public.logs_log_id_seq'::regclass);


--
-- TOC entry 2697 (class 2604 OID 16510)
-- Name: logs batch_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN batch_id SET DEFAULT nextval('public.logs_batch_id_seq'::regclass);


--
-- TOC entry 2825 (class 0 OID 16457)
-- Dependencies: 196
-- Data for Name: batch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.batch (time_started, ph, tds, color, batch_id) FROM stdin;
2011-01-01 02:30:00+05:30	5	100	12345	1
2011-01-01 00:00:00+05:30	4	100	234	2
2011-01-01 00:00:00+05:30	4	100	234	3
2011-01-01 00:00:00+05:30	4	100	234	4
2011-01-01 00:00:00+05:30	4	100	234	5
2019-01-27 10:36:27+05:30	66	0	0	6
2019-01-27 10:42:12+05:30	19	0	93	7
2019-01-27 10:43:14+05:30	66	0	0	8
2019-01-27 10:49:40+05:30	66	0	0	9
2019-01-27 12:07:29+05:30	19	0	12	10
2019-01-27 12:15:36+05:30	19	0	77	11
2019-01-27 12:16:42+05:30	19	0	7	12
\.


--
-- TOC entry 2826 (class 0 OID 16465)
-- Dependencies: 197
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs ("time", ph, tds, color, valve1, valve2, valve3, valve4, log_id, batch_id) FROM stdin;
2011-01-01 00:00:00+05:30	3	5	234	f	t	t	t	4	1
2011-01-01 00:00:00+05:30	3	5	234	f	t	t	t	5	1
2019-01-27 10:36:33+05:30	66	0	0	t	t	t	t	6	1
2019-01-27 10:36:38+05:30	65	0	0	t	t	t	t	7	1
2019-01-27 10:36:43+05:30	66	0	16	t	t	f	t	8	1
2019-01-27 10:36:48+05:30	66	0	46	t	t	f	t	9	1
2019-01-27 10:42:17+05:30	19	0	73	f	f	t	f	10	7
2019-01-27 10:42:22+05:30	19	0	48	f	f	t	f	11	7
2019-01-27 10:43:19+05:30	66	0	0	t	t	t	t	12	8
2019-01-27 10:49:45+05:30	66	0	0	t	t	t	t	13	9
2019-01-27 10:49:50+05:30	66	0	0	t	t	t	t	14	9
2019-01-27 10:49:55+05:30	66	0	0	t	t	t	t	15	9
2019-01-27 10:50:00+05:30	66	0	0	t	t	t	t	16	9
2019-01-27 10:50:05+05:30	65	0	28	t	t	f	t	17	9
2019-01-27 10:50:10+05:30	66	0	57	t	t	f	t	18	9
2019-01-27 12:07:34+05:30	19	0	0	f	f	t	f	19	10
2019-01-27 12:07:39+05:30	19	0	0	f	f	t	f	20	10
2019-01-27 12:07:44+05:30	19	0	0	f	f	t	f	21	10
2019-01-27 12:07:49+05:30	19	0	0	f	f	t	f	22	10
2019-01-27 12:07:54+05:30	19	0	0	f	f	t	f	23	10
2019-01-27 12:07:59+05:30	19	0	0	f	f	t	f	24	10
2019-01-27 12:08:04+05:30	19	0	0	f	f	t	f	25	10
2019-01-27 12:08:09+05:30	19	0	0	f	f	t	f	26	10
2019-01-27 12:08:14+05:30	19	0	0	f	f	t	f	27	10
2019-01-27 12:08:19+05:30	19	0	0	f	f	t	f	28	10
2019-01-27 12:08:24+05:30	19	0	19	f	f	f	f	29	10
2019-01-27 12:15:42+05:30	19	0	53	f	f	t	f	30	11
2019-01-27 12:15:47+05:30	19	0	24	f	f	t	f	31	11
2019-01-27 12:15:52+05:30	19	0	0	f	f	t	f	32	11
2019-01-27 12:15:57+05:30	19	0	0	f	f	t	f	33	11
2019-01-27 12:16:02+05:30	19	0	0	f	f	t	f	34	11
2019-01-27 12:16:07+05:30	19	0	0	f	f	t	f	35	11
2019-01-27 12:16:12+05:30	19	0	0	f	f	t	f	36	11
2019-01-27 12:16:17+05:30	19	0	0	f	f	t	f	37	11
2019-01-27 12:16:47+05:30	19	0	43	f	f	f	f	38	12
2019-01-27 12:16:52+05:30	19	0	69	f	f	f	f	39	12
2019-01-27 12:16:57+05:30	19	0	88	f	f	f	f	40	12
2019-01-27 12:17:02+05:30	19	0	98	f	f	f	f	41	12
2019-01-27 12:17:07+05:30	19	0	99	f	f	f	f	42	12
2019-01-27 12:17:12+05:30	19	0	90	f	f	f	f	43	12
2019-01-27 12:17:17+05:30	19	0	73	f	f	t	f	44	12
2019-01-27 12:17:22+05:30	19	0	48	f	f	t	f	45	12
2019-01-27 12:17:27+05:30	19	0	18	f	f	t	f	46	12
2019-01-27 12:17:32+05:30	19	0	0	f	f	t	f	47	12
2019-01-27 12:17:37+05:30	19	0	0	f	f	t	f	48	12
2019-01-27 12:17:42+05:30	19	0	0	f	f	t	f	49	12
2019-01-27 12:17:47+05:30	19	0	0	f	f	t	f	50	12
2019-01-27 12:17:52+05:30	19	0	0	f	f	t	f	51	12
2019-01-27 12:17:57+05:30	19	0	0	f	f	t	f	52	12
2019-01-27 12:18:02+05:30	19	0	0	f	f	t	f	53	12
2019-01-27 12:18:07+05:30	19	0	0	f	f	t	f	54	12
2019-01-27 12:18:12+05:30	19	0	0	f	f	t	f	55	12
2019-01-27 12:18:17+05:30	19	0	0	f	f	t	f	56	12
2019-01-27 12:18:22+05:30	19	0	13	f	f	f	f	57	12
2019-01-27 12:18:27+05:30	19	0	43	f	f	f	f	58	12
2019-01-27 12:18:32+05:30	19	0	69	f	f	f	f	59	12
2019-01-27 12:18:37+05:30	19	0	88	f	f	f	f	60	12
2019-01-27 12:18:42+05:30	19	0	98	f	f	f	f	61	12
2019-01-27 12:18:47+05:30	19	0	99	f	f	f	f	62	12
2019-01-27 12:18:52+05:30	19	0	90	f	f	f	f	63	12
2019-01-27 12:18:57+05:30	19	0	73	f	f	t	f	64	12
2019-01-27 12:19:02+05:30	19	0	48	f	f	t	f	65	12
2019-01-27 12:19:07+05:30	19	0	18	f	f	t	f	66	12
2019-01-27 12:19:12+05:30	19	0	0	f	f	t	f	67	12
2019-01-27 12:19:17+05:30	19	0	0	f	f	t	f	68	12
2019-01-27 12:19:22+05:30	19	0	0	f	f	t	f	69	12
2019-01-27 12:19:27+05:30	19	0	0	f	f	t	f	70	12
2019-01-27 12:19:32+05:30	19	0	0	f	f	t	f	71	12
2019-01-27 12:19:37+05:30	19	0	0	f	f	t	f	72	12
2019-01-27 12:19:42+05:30	19	0	0	f	f	t	f	73	12
2019-01-27 12:19:47+05:30	19	0	0	f	f	t	f	74	12
2019-01-27 12:19:52+05:30	19	0	0	f	f	t	f	75	12
\.


--
-- TOC entry 2838 (class 0 OID 0)
-- Dependencies: 198
-- Name: batch_batch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.batch_batch_id_seq', 12, true);


--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 200
-- Name: logs_batch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_batch_id_seq', 1, true);


--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 199
-- Name: logs_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_log_id_seq', 75, true);


--
-- TOC entry 2699 (class 2606 OID 16498)
-- Name: batch batch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batch
    ADD CONSTRAINT batch_pkey PRIMARY KEY (batch_id);


--
-- TOC entry 2702 (class 2606 OID 16519)
-- Name: logs logs_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pk PRIMARY KEY (log_id);


--
-- TOC entry 2700 (class 1259 OID 16525)
-- Name: fki_logs_batch; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_logs_batch ON public.logs USING btree (batch_id);


--
-- TOC entry 2703 (class 2606 OID 16520)
-- Name: logs logs_batch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_batch FOREIGN KEY (batch_id) REFERENCES public.batch(batch_id);


-- Completed on 2019-01-27 18:27:54

--
-- PostgreSQL database dump complete
--

