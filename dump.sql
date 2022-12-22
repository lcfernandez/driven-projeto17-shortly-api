--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    url text NOT NULL,
    "shortUrl" character varying(8) NOT NULL,
    visits integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.links VALUES (15, 11, 'https://twitter.com/oednaldopereira', 'IAWP19Kk', 9, '2022-12-22 14:24:41.95013-03');
INSERT INTO public.links VALUES (8, 4, 'https://www.amazon.com.br/Vade-Mecum-Saraiva-Tradicional-edi%C3%A7%C3%A3o-ebook/dp/B0B72GLBR3/', '8La2jCC8', 3, '2022-12-21 11:16:25.15994-03');
INSERT INTO public.links VALUES (12, 1, 'http://localhost:4000/urls/open/DfYtHYR5', 'w5F41123', 6, '2022-12-21 11:41:52.52003-03');
INSERT INTO public.links VALUES (11, 1, 'https://www.ahnegao.com.br/2019/04/da-serie-o-esforco-por-tras-de-uma-boa-foto.html', 'DfYtHYR5', 7, '2022-12-21 11:40:03.855424-03');
INSERT INTO public.links VALUES (17, 13, 'https://www.postgresql.org/docs/current/sql-altertable.html', '0L54YTwk', 1, '2022-12-22 14:27:42.605661-03');
INSERT INTO public.links VALUES (2, 1, 'https://www.metal-archives.com/', 'Vb4nJw6s', 5, '2022-12-20 23:03:13.275669-03');
INSERT INTO public.links VALUES (5, 7, 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 'XIoJoTGD', 0, '2022-12-21 11:13:06.38242-03');
INSERT INTO public.links VALUES (6, 7, 'https://www.youtube.com/watch?v=y6120QOlsfU', 'Q2tfIJEZ', 0, '2022-12-21 11:13:33.959405-03');
INSERT INTO public.links VALUES (9, 4, 'https://www.youtube.com/watch?v=BVZDbmEQXRs', 'wIBSMgci', 0, '2022-12-21 11:16:52.060978-03');
INSERT INTO public.links VALUES (10, 1, 'https://www.youtube.com/watch?v=BVZDbmEQXRs', 'wWkOLP1m', 0, '2022-12-21 11:17:47.130809-03');
INSERT INTO public.links VALUES (13, 7, 'https://www.naointendo.com.br/posts/6atfbxsid44-aqui-tem-talento', 'jGioUM4i', 1, '2022-12-22 10:43:17.783306-03');
INSERT INTO public.links VALUES (16, 11, 'https://www.youtube.com/watch?v=5BO7kF0zxUA', 'XgvmFXCS', 0, '2022-12-22 14:25:56.718768-03');
INSERT INTO public.links VALUES (7, 7, 'https://www.metroworldnews.com.br/resizer/VBMYBG1Y7-M47rGoIWjCN5_hiuY=/800x0/filters:format(jpg):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/metroworldnews/ACZEOSLNHJEKFLSTKGUCVCE3WU.jpg', 'xTMldXTt', 2, '2022-12-21 11:14:02.86298-03');
INSERT INTO public.links VALUES (4, 4, 'https://media.tenor.com/piH-bnnsuHEAAAAd/o-que-esse-povo-nao-faz-por-um-lanche-povo-faminto.gif', 'PEdeYKsL', 3, '2022-12-21 09:59:11.940444-03');
INSERT INTO public.links VALUES (18, 16, 'https://www.youtube.com/watch?v=Ps_ZkAhODMA', 'o13iNCjt', 10, '2022-12-22 14:31:32.126472-03');
INSERT INTO public.links VALUES (14, 9, 'https://www.youtube.com/watch?v=fWJB2owqS7s', 'TuxjCjmq', 14, '2022-12-22 14:12:40.502117-03');
INSERT INTO public.links VALUES (3, 1, 'https://www.whiplash.net/', 'OZWAgezV', 12, '2022-12-21 09:57:58.916522-03');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (2, 1, '2022-12-19 15:50:21.333621-03');
INSERT INTO public.sessions VALUES (3, 1, '2022-12-19 15:52:30.602461-03');
INSERT INTO public.sessions VALUES (4, 4, '2022-12-21 00:06:25.481092-03');
INSERT INTO public.sessions VALUES (5, 7, '2022-12-21 10:53:22.547841-03');
INSERT INTO public.sessions VALUES (6, 8, '2022-12-22 09:54:22.629436-03');
INSERT INTO public.sessions VALUES (7, 9, '2022-12-22 14:11:20.44825-03');
INSERT INTO public.sessions VALUES (8, 11, '2022-12-22 14:13:22.528305-03');
INSERT INTO public.sessions VALUES (9, 13, '2022-12-22 14:26:35.878219-03');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Luiz', 'luiz@claudio.com', '$2b$12$3cnkqMkdM2bP6nbuScga6.w.OvzzAw/D/q6029rQKC5N8W9yZxGSC', '2022-12-19 14:38:00.682022-03');
INSERT INTO public.users VALUES (4, 'Advogado Paloma', 'advogado@paloma.com', '$2b$12$vP0boHHFHzfbtir2PhkiaeVTDVExnXMIxyr4aqzfh5NKSO3VbajaC', '2022-12-19 14:45:29.667424-03');
INSERT INTO public.users VALUES (7, 'Paola Bracho', 'paola@bracho.com', '$2b$12$qBWA0MGu7FV0bI0W3rhjLuknoyX4E2MDsBXxRee8k8/nEttSJn1Wq', '2022-12-19 15:30:59.438396-03');
INSERT INTO public.users VALUES (8, 'Vulgo Machadão', 'vulgo@machadao.com', '$2b$12$qq8kudyq2fNJMuoYz/f9iOAQKKX3xKoLXPICRZmYskB67LnLlKigK', '2022-12-22 09:54:02.974455-03');
INSERT INTO public.users VALUES (9, 'blue_jeans_baby_tatua', 'blue.jeans@baby.tatua.com', '$2b$12$ZpsLVqOBPl.stTBwB1x1zuRLKLElkyRStng/uNWlCRm8uIrV9Kxbi', '2022-12-22 13:57:14.298148-03');
INSERT INTO public.users VALUES (10, 'Olafé Corcam', 'olafe@corcam.com', '$2b$12$yBQOLWwP68UaZZHfY0oFi.gkSWsBYXBovEDP3oubpgAFHPzCnAIyq', '2022-12-22 13:59:14.44356-03');
INSERT INTO public.users VALUES (11, 'Ednaldo Pereira', 'ednaldo@pereira.com', '$2b$12$TJjw/VP5BZpd1wZhHY0/KeIDjWgj8vcXTdbGn.B6df3lLd5WC6eU.', '2022-12-22 14:01:32.081491-03');
INSERT INTO public.users VALUES (12, 'McLovin', 'mc@lovin.com', '$2b$12$zUUp2BgI8bJ6FdbNgX4PFuXsxwxIm/XEOTLFh1S4ilpBtYnZnTHNi', '2022-12-22 14:02:38.151748-03');
INSERT INTO public.users VALUES (13, 'Walter Table', 'walter@table.com', '$2b$12$smI.dgvFeqCGCcqTOQufy.hxPzqngBP/4stObGBIDN7tRYeVcQzXG', '2022-12-22 14:03:37.830304-03');
INSERT INTO public.users VALUES (14, 'valdisnei', 'valdisnei@worldresort.com', '$2b$12$FYq5m85sCkD1TM9Kok.4audQp9RcbtUD1mK1GCyGbrrDZ78oEBiO2', '2022-12-22 14:05:53.128486-03');
INSERT INTO public.users VALUES (15, 'captain_deadpool', 'captain@deadpool.com', '$2b$12$p5cTPKvNy8yGJtSRyCdRceUprvoOf3sbeh1SP8UNBFHI6G/rL.pmK', '2022-12-22 14:06:51.361434-03');
INSERT INTO public.users VALUES (16, 'O Talentoso Ripley', 'talentoso@ripley.com', '$2b$12$IJmyrc5j52BhTzHu/kZzKeeu.6cGTw6f02Fu1i/KDJkLeRomva4oa', '2022-12-22 14:08:14.851005-03');


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 18, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 16, true);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: links links_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT "links_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: links links_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT "links_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

