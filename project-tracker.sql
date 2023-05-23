--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Homebrew)
-- Dumped by pg_dump version 15.2 (Homebrew)

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
-- Name: projects; Type: TABLE; Schema: public; Owner: jackieanderson
--

CREATE TABLE public.projects (
    title character varying(30) NOT NULL,
    description text,
    max_grade integer
);


ALTER TABLE public.projects OWNER TO jackieanderson;

--
-- Name: students; Type: TABLE; Schema: public; Owner: jackieanderson
--

CREATE TABLE public.students (
    fname character varying(20),
    lname character varying(20),
    github_un character varying(20) NOT NULL
);


ALTER TABLE public.students OWNER TO jackieanderson;

--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: jackieanderson
--

COPY public.projects (title, description, max_grade) FROM stdin;
Markov	Tweets generated from Markov chains	50
Blockly	Programmatic Logic Puzzle Game	100
Time Warp	Travel in Time	100
None ya biz	Private	100
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: jackieanderson
--

COPY public.students (fname, lname, github_un) FROM stdin;
Sarah	Develops	sdevelops
Jane	Hacks	jhacks
\.


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: jackieanderson
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (title);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: jackieanderson
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (github_un);


--
-- PostgreSQL database dump complete
--

