--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.likes_id_seq OWNER TO postgres;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    content text NOT NULL,
    attachment character varying(255) DEFAULT NULL::character varying,
    video character varying(255) DEFAULT NULL::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    description character varying(255) DEFAULT NULL::character varying,
    attachment character varying(255) DEFAULT NULL::character varying,
    is_active boolean DEFAULT true,
    is_admin boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, user_id, post_id, content, created_at, updated_at) FROM stdin;
125	210	256	Bonjour, très bien je regarde tout de suite les possibilités de cette nouvelle application	2025-05-16 12:42:18.082227	2025-05-16 12:42:18.082227
126	210	257	PS : au cas où vous n'aviez pas compris, c'est moi avec le chapeau sur la gauche.	2025-05-16 12:43:20.884553	2025-05-16 12:43:20.884553
127	211	257	Merci d'enfoncer le couteau dans la plaie :-p	2025-05-16 12:51:41.687364	2025-05-16 12:51:41.687364
128	211	256	Ca peut toujours servir !	2025-05-16 12:52:08.745765	2025-05-16 12:52:08.745765
129	212	258	ça à l'air bien galère ton truc	2025-05-16 12:57:00.38495	2025-05-16 12:57:00.38495
130	212	257	Pas de vacances pour moi cette année, profite bien.	2025-05-16 12:58:09.312658	2025-05-16 12:58:09.312658
131	213	259	Merci pour le partage	2025-05-16 12:59:43.662804	2025-05-16 12:59:43.662804
133	214	259	J'adore	2025-05-16 13:04:41.142762	2025-05-16 13:04:41.142762
134	214	260	Hummmm	2025-05-16 13:06:32.964181	2025-05-16 13:06:32.964181
135	214	258	On dirait un modèle des années 2000, bon courage	2025-05-16 13:07:28.630553	2025-05-16 13:07:28.630553
136	214	256	Merci pour l'initiative !!!	2025-05-16 13:08:06.684609	2025-05-16 13:08:06.684609
137	215	260	Je testerai, merci !	2025-05-16 13:10:19.51523	2025-05-16 13:10:19.51523
138	215	258	Ca me rappel mes études.	2025-05-16 13:10:45.470676	2025-05-16 13:10:45.470676
139	209	261	Ca va ça n'a pas l'ai si compliqué que ça. Si ? 	2025-05-16 13:16:29.113883	2025-05-16 13:16:29.113883
140	209	258	On sent les techniciens ici mdr	2025-05-16 13:16:57.045102	2025-05-16 13:16:57.045102
141	209	257	Allé la team là on reste concentré ;-)	2025-05-16 13:17:23.31641	2025-05-16 13:17:23.31641
142	209	259	Ce son me reste dans la tête c'est dingue.	2025-05-16 13:17:49.062542	2025-05-16 13:17:49.062542
143	209	260	N'hesite pas à envoyer d'autres plats ou liens ça fait toujours plaisir	2025-05-16 13:18:32.530878	2025-05-16 13:18:32.530878
144	210	261	OMG	2025-05-16 13:19:39.489644	2025-05-16 13:19:39.489644
145	210	260	Les légumes c'est la vie	2025-05-16 13:19:56.52649	2025-05-16 13:19:56.52649
146	210	258	Un oscilloss-quoi ? mdr	2025-05-16 13:20:35.500841	2025-05-16 13:20:35.500841
147	211	262	Ca à l'air appaisant. Je retiens.	2025-05-16 13:29:38.174684	2025-05-16 13:29:38.174684
132	213	258	Je vais éviter de te prêter mon téléphone je pense maintenant lol	2025-05-16 13:03:08.045202	2025-05-16 13:03:08.045202
148	212	262	C'est dans quel secteur ?	2025-05-16 14:02:36.999969	2025-05-16 14:02:36.999969
149	209	263	On en apprend tous les jours	2025-05-16 14:06:48.567218	2025-05-16 14:06:48.567218
150	209	271	dsfdsfs<	2025-05-20 17:55:13.221203	2025-05-20 17:55:13.221203
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (id, user_id, post_id, created_at) FROM stdin;
96	210	256	2025-05-16 12:40:20.532354
97	211	257	2025-05-16 12:50:55.90042
98	211	256	2025-05-16 12:51:48.468355
99	212	259	2025-05-16 12:56:18.135257
100	212	257	2025-05-16 12:57:02.780364
102	212	256	2025-05-16 12:58:16.996367
104	213	257	2025-05-16 12:59:50.448531
105	213	259	2025-05-16 13:02:41.180847
106	214	260	2025-05-16 13:04:33.061089
107	214	259	2025-05-16 13:04:34.792102
108	214	257	2025-05-16 13:07:42.835334
109	214	256	2025-05-16 13:08:10.948407
110	215	260	2025-05-16 13:10:22.332318
111	215	259	2025-05-16 13:10:24.517517
112	215	258	2025-05-16 13:10:26.629288
113	209	261	2025-05-16 13:15:31.837319
114	209	260	2025-05-16 13:16:32.438308
115	209	259	2025-05-16 13:16:34.444157
116	209	258	2025-05-16 13:16:36.633448
117	209	257	2025-05-16 13:17:29.61465
118	210	260	2025-05-16 13:19:42.541386
119	211	262	2025-05-16 13:29:06.04043
120	211	261	2025-05-16 13:29:42.423807
121	212	262	2025-05-16 14:02:10.579323
122	209	263	2025-05-16 14:06:49.497748
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, user_id, content, attachment, video, created_at, updated_at) FROM stdin;
256	209	Bonjour à tous et bienvenue sur Groupomania, un petit réseau social d'entreprise que j'ai conçu afin d'échanger sur divers thèmes et de partager nos expériences. A vos claviers ;-)	\N		2025-05-16 12:34:59.902953	2025-05-16 12:34:59.902953
257	210	Très intéressant comme idée même si je ne suis pas encore tout à fait prête pour repenser au boulot ^^	https://res.cloudinary.com/ddj78kfck/image/upload/v1747391997/groupo-social/vk9vuztlzyfibmad3rco.png		2025-05-16 12:40:00.660784	2025-05-16 12:40:00.660784
258	211	Salut à tous, pour moi c'est pas encore les vacances mais vivement. En attendant, est ce que quelqu'un a un oscilloscope à me prêter ???	https://res.cloudinary.com/ddj78kfck/image/upload/v1747392637/groupo-social/huz9xldqlud2lhuhfo5z.png		2025-05-16 12:50:41.49874	2025-05-16 12:50:41.49874
259	212	Je vous partage un son que j'ai adoré	\N	https://www.youtube.com/embed/57VMB1IzLKY	2025-05-16 12:55:46.491587	2025-05-16 12:55:46.491587
260	213	Je vous conseille ce type de plat, très bon pour la santé et pour booster les perfs au boulot.	https://res.cloudinary.com/ddj78kfck/image/upload/v1747393347/groupo-social/ctxzihrjisp16tmvbjo4.png		2025-05-16 13:02:29.911481	2025-05-16 13:02:29.911481
261	215	Quelqu'un peut m'aider ? Je crois que j'ai perdu le fil ^^	https://res.cloudinary.com/ddj78kfck/image/upload/v1747394071/groupo-social/eenfvyldtigr3ucik58g.jpg		2025-05-16 13:14:35.172306	2025-05-16 13:14:35.172306
262	210	Si vous avez l'occasion de passer par là un jour je vous recommande ce restaurant	https://res.cloudinary.com/ddj78kfck/image/upload/v1747394626/groupo-social/fd4mf1ogc6nr9gskxifr.jpg		2025-05-16 13:23:49.898536	2025-05-16 13:23:49.898536
263	211	Voici à quoi ressemble un oscilloscope, on peut tout réparer grâce à ce type de matos. Une valeur sûre.	https://res.cloudinary.com/ddj78kfck/image/upload/v1747394935/groupo-social/palpntbod3bg6xk97xyi.jpg		2025-05-16 13:28:57.660518	2025-05-16 13:28:57.660518
275	209	gfdg	\N		2025-05-20 17:58:31.810044	2025-05-20 17:58:31.810044
271	209	Chers membres de l'équipe,\r\nJe suis ravi de voir votre engouement pour Groupomania. Votre participation active et votre passion sont essentielles à notre succès.\r\nChaque interaction sur Groupomania contribue à créer une communauté dynamique. Continuez à partager vos idées et expériences.\r\nMerci pour votre dévouement. Vous êtes les artisans de cette aventure, et ensemble, nous construirons une communauté forte.\r\n\r\nÀ vos claviers, et que l'aventure continue !\r\n\r\nAvec gratitude, Bob	https://res.cloudinary.com/ddj78kfck/image/upload/v1747398557/groupo-social/lauvraad4yp5j3as6ibi.jpg		2025-05-16 14:29:19.835507	2025-05-16 14:29:19.835507
272	209	test	\N		2025-05-20 17:53:47.66434	2025-05-20 17:53:47.66434
273	209	tes	\N		2025-05-20 17:54:42.319283	2025-05-20 17:54:42.319283
274	209	dsfdsf	\N		2025-05-20 17:54:51.194703	2025-05-20 17:54:51.194703
276	209	vcvxc	\N		2025-05-21 10:19:40.80597	2025-05-21 10:19:40.80597
277	209	456546	\N		2025-05-21 10:20:17.54582	2025-05-21 10:20:17.54582
278	209	654645	\N		2025-05-21 10:22:05.256656	2025-05-21 10:22:05.256656
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, description, attachment, is_active, is_admin, created_at, updated_at) FROM stdin;
209	bob	bob@bob.fr	$2b$10$gO9cSS4j1K0.0DZxxAvJsOxfjkhWZi8c49NKvaGFfxJjuthtd/Nty	Salut, moi c'est Bob et je croque la vie à pleines dents !!!	https://res.cloudinary.com/ddj78kfck/image/upload/v1747391380/groupo-social/bngwhxlpmfamj8kngqrj.jpg	t	f	2025-05-16 12:11:18.718447	2025-05-16 12:11:18.718447
210	anna	anna@bob.fr	$2b$10$2PG48MUzL71iv.4P1zGu3u5ul9d4mixwRYa1KhbxI78StOG.lsXFq	Je me présente, Anna 31 ans et je cherche l'amour. Peut être ici qui même si il paraît qu'il ne faut pas mélanger le travail et le perso :-D	https://res.cloudinary.com/ddj78kfck/image/upload/v1747391811/groupo-social/ks352xyqazgnq5mz4dvj.jpg	t	f	2025-05-16 12:14:47.730827	2025-05-16 12:14:47.730827
211	charles	charles@bob.fr	$2b$10$729/NHgj85VOFdY4jXsr..KVSeF20zOyh6Jsmsd8TNVLfvR84hN2G	Charles, spécialiste du multitâche. Enchanté	https://res.cloudinary.com/ddj78kfck/image/upload/v1747392257/groupo-social/z4i3cbrfxkrr8lifssjb.jpg	t	f	2025-05-16 12:15:04.972616	2025-05-16 12:15:04.972616
212	claire	claire@bob.fr	$2b$10$7tj6fZCqHSCPyf85Bpao5uUOMjtesJducJ4ncJ2959d8HPn3lcJ0y	Salut	https://res.cloudinary.com/ddj78kfck/image/upload/v1747392762/groupo-social/a7lk6z723ymhtqdnjnk9.jpg	t	f	2025-05-16 12:15:23.9757	2025-05-16 12:15:23.9757
213	clarisse	clarisse@bob.fr	$2b$10$UJqYQjLGqwAy5ESP1HtNuOhPHLbmpaQrD33hLeMEz2/JmFyv1Zho.	Moi c'est Clarisse, ici par curiosité	https://res.cloudinary.com/ddj78kfck/image/upload/v1747393147/groupo-social/lfle1stels0utmqwaeqg.jpg	t	f	2025-05-16 12:15:41.898163	2025-05-16 12:15:41.898163
214	guillaume	guillaume@bob.fr	$2b$10$LuCriwX2qzlDtK6kUykK3.UChQWpGH.3DzwuVhI7QiKmToCNikohm	Salut moi c'est guillaume, je suis l'assistant ingé du groupe. Au plaisir	https://res.cloudinary.com/ddj78kfck/image/upload/v1747393573/groupo-social/o62gjvsvsmzprhn2l9ev.jpg	t	f	2025-05-16 12:16:14.43331	2025-05-16 12:16:14.43331
215	john	john@bob.fr	$2b$10$o7gGNdlvxwpumig5bhjjNebu8fIcVsvhQMdaaH1lTxUMgpeLzY2Em	John pour vous servir	https://res.cloudinary.com/ddj78kfck/image/upload/v1747393785/groupo-social/mnmnttku9y6puil0jafy.jpg	t	f	2025-05-16 13:09:32.338629	2025-05-16 13:09:32.338629
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 150, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.likes_id_seq', 123, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 278, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 215, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: likes unique_user_post; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT unique_user_post UNIQUE (user_id, post_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: likes fk_post; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fk_post FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: likes fk_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

