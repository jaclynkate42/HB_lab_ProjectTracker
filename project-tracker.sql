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
-- Name: grades; Type: TABLE; Schema: public; Owner: jackieanderson
--

CREATE TABLE public.grades (
    id integer NOT NULL,
    github_un character varying(20),
    title character varying(30),
    grade integer
);


ALTER TABLE public.grades OWNER TO jackieanderson;

--
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: jackieanderson
--

CREATE SEQUENCE public.grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grades_id_seq OWNER TO jackieanderson;

--
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jackieanderson
--

ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;


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
    github_un character varying(20) NOT NULL,
    cohort character varying(20)
);


ALTER TABLE public.students OWNER TO jackieanderson;

--
-- Name: report_card_view; Type: VIEW; Schema: public; Owner: jackieanderson
--

CREATE VIEW public.report_card_view AS
 SELECT students.fname,
    students.lname,
    projects.title,
    projects.max_grade,
    grades.grade
   FROM ((public.students
     JOIN public.grades USING (github_un))
     JOIN public.projects USING (title));


ALTER TABLE public.report_card_view OWNER TO jackieanderson;

--
-- Name: grades id; Type: DEFAULT; Schema: public; Owner: jackieanderson
--

ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval('public.grades_id_seq'::regclass);


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: jackieanderson
--

COPY public.grades (id, github_un, title, grade) FROM stdin;
1	jhacks	Markov	10
2	jhacks	Blockly	2
3	sdevelops	Blockly	100
4	sdevelops	Markov	50
\.


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

COPY public.students (fname, lname, github_un, cohort) FROM stdin;
Sarah	Develops	sdevelops	\N
Jane	Hacks	jhacks	\N
\.


--
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jackieanderson
--

SELECT pg_catalog.setval('public.grades_id_seq', 4, true);


--
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: jackieanderson
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


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
-- Name: grades grades_github_un_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jackieanderson
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_github_un_fkey FOREIGN KEY (github_un) REFERENCES public.students(github_un);


--
-- Name: grades grades_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jackieanderson
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_title_fkey FOREIGN KEY (title) REFERENCES public.projects(title);


--
-- PostgreSQL database dump complete
--

