--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Name: tb_aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_aluno (
    nome_aluno character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    matricula integer NOT NULL,
    cpf character varying(11) NOT NULL,
    media_global numeric(5,2),
    status character varying(1) NOT NULL,
    cod_curso character varying(10) NOT NULL
);


ALTER TABLE public.tb_aluno OWNER TO postgres;

--
-- Name: tb_aluno_disciplina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_aluno_disciplina (
    matricula integer NOT NULL,
    cod_disciplina character varying(10) NOT NULL,
    ano integer NOT NULL,
    semestre integer NOT NULL,
    nota_final numeric(5,2),
    status_disciplina character varying(20) NOT NULL
);


ALTER TABLE public.tb_aluno_disciplina OWNER TO postgres;

--
-- Name: tb_curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_curso (
    cod_curso character varying(10) NOT NULL,
    nome_curso character varying(255) NOT NULL,
    id_departamento integer NOT NULL
);


ALTER TABLE public.tb_curso OWNER TO postgres;

--
-- Name: tb_curso_disciplina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_curso_disciplina (
    cod_curso character varying(10) NOT NULL,
    cod_disciplina character varying(10) NOT NULL,
    semestre integer NOT NULL
);


ALTER TABLE public.tb_curso_disciplina OWNER TO postgres;

--
-- Name: tb_departamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_departamento (
    id_departamento integer NOT NULL,
    nome_departamento character varying(255) NOT NULL,
    descricao text
);


ALTER TABLE public.tb_departamento OWNER TO postgres;

--
-- Name: tb_disciplina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_disciplina (
    cod_disciplina character varying(10) NOT NULL,
    nome_disciplina character varying(255) NOT NULL,
    creditos integer NOT NULL,
    id_departamento integer NOT NULL
);


ALTER TABLE public.tb_disciplina OWNER TO postgres;

--
-- Name: tb_professor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_professor (
    matricula_professor integer NOT NULL,
    nome_professor character varying(255) NOT NULL,
    email_professor character varying(255) NOT NULL,
    cpf character varying(11) NOT NULL,
    id_departamento integer NOT NULL
);


ALTER TABLE public.tb_professor OWNER TO postgres;

--
-- Name: tb_professor_disciplina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_professor_disciplina (
    matricula_professor integer NOT NULL,
    cod_disciplina character varying(10) NOT NULL
);


ALTER TABLE public.tb_professor_disciplina OWNER TO postgres;

--
-- Name: tb_aluno tb_aluno_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_aluno
    ADD CONSTRAINT tb_aluno_cpf_key UNIQUE (cpf);


--
-- Name: tb_aluno_disciplina tb_aluno_disciplina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_aluno_disciplina
    ADD CONSTRAINT tb_aluno_disciplina_pkey PRIMARY KEY (matricula, cod_disciplina, ano, semestre);


--
-- Name: tb_aluno tb_aluno_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_aluno
    ADD CONSTRAINT tb_aluno_email_key UNIQUE (email);


--
-- Name: tb_aluno tb_aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_aluno
    ADD CONSTRAINT tb_aluno_pkey PRIMARY KEY (matricula);


--
-- Name: tb_curso_disciplina tb_curso_disciplina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_curso_disciplina
    ADD CONSTRAINT tb_curso_disciplina_pkey PRIMARY KEY (cod_curso, cod_disciplina, semestre);


--
-- Name: tb_curso tb_curso_nome_curso_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_curso
    ADD CONSTRAINT tb_curso_nome_curso_key UNIQUE (nome_curso);


--
-- Name: tb_curso tb_curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_curso
    ADD CONSTRAINT tb_curso_pkey PRIMARY KEY (cod_curso);


--
-- Name: tb_departamento tb_departamento_nome_departamento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_departamento
    ADD CONSTRAINT tb_departamento_nome_departamento_key UNIQUE (nome_departamento);


--
-- Name: tb_departamento tb_departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_departamento
    ADD CONSTRAINT tb_departamento_pkey PRIMARY KEY (id_departamento);


--
-- Name: tb_disciplina tb_disciplina_nome_disciplina_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_disciplina
    ADD CONSTRAINT tb_disciplina_nome_disciplina_key UNIQUE (nome_disciplina);


--
-- Name: tb_disciplina tb_disciplina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_disciplina
    ADD CONSTRAINT tb_disciplina_pkey PRIMARY KEY (cod_disciplina);


--
-- Name: tb_professor tb_professor_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_professor
    ADD CONSTRAINT tb_professor_cpf_key UNIQUE (cpf);


--
-- Name: tb_professor_disciplina tb_professor_disciplina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_professor_disciplina
    ADD CONSTRAINT tb_professor_disciplina_pkey PRIMARY KEY (matricula_professor, cod_disciplina);


--
-- Name: tb_professor tb_professor_email_professor_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_professor
    ADD CONSTRAINT tb_professor_email_professor_key UNIQUE (email_professor);


--
-- Name: tb_professor tb_professor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_professor
    ADD CONSTRAINT tb_professor_pkey PRIMARY KEY (matricula_professor);


--
-- Name: unq_tb_aluno_cpf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unq_tb_aluno_cpf ON public.tb_aluno USING btree (cpf);


--
-- Name: unq_tb_aluno_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unq_tb_aluno_email ON public.tb_aluno USING btree (email);


--
-- Name: unq_tb_curso_nome_curso; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unq_tb_curso_nome_curso ON public.tb_curso USING btree (nome_curso);


--
-- Name: unq_tb_disciplina_nome; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unq_tb_disciplina_nome ON public.tb_disciplina USING btree (nome_disciplina);


--
-- Name: unq_tb_professor_cpf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unq_tb_professor_cpf ON public.tb_professor USING btree (cpf);


--
-- Name: unq_tb_professor_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unq_tb_professor_email ON public.tb_professor USING btree (email_professor);


--
-- Name: tb_aluno_disciplina fk_tb_aluno_disciplina_tb_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_aluno_disciplina
    ADD CONSTRAINT fk_tb_aluno_disciplina_tb_aluno FOREIGN KEY (matricula) REFERENCES public.tb_aluno(matricula);


--
-- Name: tb_aluno_disciplina fk_tb_aluno_disciplina_tb_disciplina; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_aluno_disciplina
    ADD CONSTRAINT fk_tb_aluno_disciplina_tb_disciplina FOREIGN KEY (cod_disciplina) REFERENCES public.tb_disciplina(cod_disciplina);


--
-- Name: tb_aluno fk_tb_aluno_tb_curso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_aluno
    ADD CONSTRAINT fk_tb_aluno_tb_curso FOREIGN KEY (cod_curso) REFERENCES public.tb_curso(cod_curso);


--
-- Name: tb_curso_disciplina fk_tb_curso_disciplina_tb_curso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_curso_disciplina
    ADD CONSTRAINT fk_tb_curso_disciplina_tb_curso FOREIGN KEY (cod_curso) REFERENCES public.tb_curso(cod_curso);


--
-- Name: tb_curso_disciplina fk_tb_curso_disciplina_tb_disciplina; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_curso_disciplina
    ADD CONSTRAINT fk_tb_curso_disciplina_tb_disciplina FOREIGN KEY (cod_disciplina) REFERENCES public.tb_disciplina(cod_disciplina);


--
-- Name: tb_curso fk_tb_curso_tb_departamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_curso
    ADD CONSTRAINT fk_tb_curso_tb_departamento FOREIGN KEY (id_departamento) REFERENCES public.tb_departamento(id_departamento);


--
-- Name: tb_disciplina fk_tb_departamento_tb_disciplina; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_disciplina
    ADD CONSTRAINT fk_tb_departamento_tb_disciplina FOREIGN KEY (id_departamento) REFERENCES public.tb_departamento(id_departamento);


--
-- Name: tb_professor fk_tb_departamento_tb_professor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_professor
    ADD CONSTRAINT fk_tb_departamento_tb_professor FOREIGN KEY (id_departamento) REFERENCES public.tb_departamento(id_departamento);


--
-- Name: tb_professor_disciplina fk_tb_professor_disciplina_tb_disciplina; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_professor_disciplina
    ADD CONSTRAINT fk_tb_professor_disciplina_tb_disciplina FOREIGN KEY (cod_disciplina) REFERENCES public.tb_disciplina(cod_disciplina);


--
-- Name: tb_professor_disciplina fk_tb_professor_disciplina_tb_professor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_professor_disciplina
    ADD CONSTRAINT fk_tb_professor_disciplina_tb_professor FOREIGN KEY (matricula_professor) REFERENCES public.tb_professor(matricula_professor);


--
-- PostgreSQL database dump complete
--

