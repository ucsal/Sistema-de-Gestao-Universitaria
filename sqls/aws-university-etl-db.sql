--
-- PostgreSQL database dump
--

-- Dumped from database version 16.5
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
-- Name: tb_aluno; Type: TABLE; Schema: public; Owner: manu
--

CREATE TABLE public.tb_aluno (
    nome_aluno character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    cpf character varying(11) NOT NULL,
    media_global numeric(5,2),
    status character varying(1) NOT NULL,
    nome_curso character varying(255) NOT NULL,
    matricula bigint NOT NULL,
    id_curso bigint NOT NULL
);


ALTER TABLE public.tb_aluno OWNER TO manu;

--
-- Name: tb_aluno_curso_id_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_aluno_curso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_aluno_curso_id_seq OWNER TO manu;

--
-- Name: tb_aluno_curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_aluno_curso_id_seq OWNED BY public.tb_aluno.id_curso;


--
-- Name: tb_aluno_disciplina; Type: TABLE; Schema: public; Owner: manu
--

CREATE TABLE public.tb_aluno_disciplina (
    ano integer NOT NULL,
    semestre integer NOT NULL,
    nota_final numeric(5,2),
    status_disciplina character varying(20) NOT NULL,
    nota1 numeric NOT NULL,
    nota2 numeric NOT NULL,
    nome_disciplina character varying(255) NOT NULL,
    matricula_aluno bigint NOT NULL,
    id_disciplina bigint NOT NULL
);


ALTER TABLE public.tb_aluno_disciplina OWNER TO manu;

--
-- Name: tb_aluno_disciplina_id_disciplina_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_aluno_disciplina_id_disciplina_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_aluno_disciplina_id_disciplina_seq OWNER TO manu;

--
-- Name: tb_aluno_disciplina_id_disciplina_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_aluno_disciplina_id_disciplina_seq OWNED BY public.tb_aluno_disciplina.id_disciplina;


--
-- Name: tb_aluno_disciplina_matricula_aluno_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_aluno_disciplina_matricula_aluno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_aluno_disciplina_matricula_aluno_seq OWNER TO manu;

--
-- Name: tb_aluno_disciplina_matricula_aluno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_aluno_disciplina_matricula_aluno_seq OWNED BY public.tb_aluno_disciplina.matricula_aluno;


--
-- Name: tb_aluno_matricula_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_aluno_matricula_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_aluno_matricula_seq OWNER TO manu;

--
-- Name: tb_aluno_matricula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_aluno_matricula_seq OWNED BY public.tb_aluno.matricula;


--
-- Name: tb_curso; Type: TABLE; Schema: public; Owner: manu
--

CREATE TABLE public.tb_curso (
    descricao text,
    duracao integer NOT NULL,
    id bigint NOT NULL,
    nome character varying(255) NOT NULL,
    id_departamento bigint NOT NULL
);


ALTER TABLE public.tb_curso OWNER TO manu;

--
-- Name: tb_curso_disciplina; Type: TABLE; Schema: public; Owner: manu
--

CREATE TABLE public.tb_curso_disciplina (
    id_curso bigint NOT NULL,
    id_disciplina bigint NOT NULL
);


ALTER TABLE public.tb_curso_disciplina OWNER TO manu;

--
-- Name: tb_curso_disciplina_id_curso_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_curso_disciplina_id_curso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_curso_disciplina_id_curso_seq OWNER TO manu;

--
-- Name: tb_curso_disciplina_id_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_curso_disciplina_id_curso_seq OWNED BY public.tb_curso_disciplina.id_curso;


--
-- Name: tb_curso_disciplina_id_disciplina_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_curso_disciplina_id_disciplina_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_curso_disciplina_id_disciplina_seq OWNER TO manu;

--
-- Name: tb_curso_disciplina_id_disciplina_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_curso_disciplina_id_disciplina_seq OWNED BY public.tb_curso_disciplina.id_disciplina;


--
-- Name: tb_curso_id_curso_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_curso_id_curso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_curso_id_curso_seq OWNER TO manu;

--
-- Name: tb_curso_id_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_curso_id_curso_seq OWNED BY public.tb_curso.id;


--
-- Name: tb_curso_id_departamento_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_curso_id_departamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_curso_id_departamento_seq OWNER TO manu;

--
-- Name: tb_curso_id_departamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_curso_id_departamento_seq OWNED BY public.tb_curso.id_departamento;


--
-- Name: tb_departamento; Type: TABLE; Schema: public; Owner: manu
--

CREATE TABLE public.tb_departamento (
    descricao text,
    nome character varying NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.tb_departamento OWNER TO manu;

--
-- Name: tb_departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_departamento_id_seq OWNER TO manu;

--
-- Name: tb_departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_departamento_id_seq OWNED BY public.tb_departamento.id;


--
-- Name: tb_desconto; Type: TABLE; Schema: public; Owner: manu
--

CREATE TABLE public.tb_desconto (
    tipo_desconto character varying(100) NOT NULL,
    valor_desconto numeric(10,2) NOT NULL,
    matricula_aluno bigint NOT NULL
);


ALTER TABLE public.tb_desconto OWNER TO manu;

--
-- Name: tb_desconto_matricula_aluno_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_desconto_matricula_aluno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_desconto_matricula_aluno_seq OWNER TO manu;

--
-- Name: tb_desconto_matricula_aluno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_desconto_matricula_aluno_seq OWNED BY public.tb_desconto.matricula_aluno;


--
-- Name: tb_disciplina; Type: TABLE; Schema: public; Owner: manu
--

CREATE TABLE public.tb_disciplina (
    creditos integer NOT NULL,
    id_departamento integer NOT NULL,
    nome character varying(9999999) NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.tb_disciplina OWNER TO manu;

--
-- Name: tb_disciplina_id_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_disciplina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_disciplina_id_seq OWNER TO manu;

--
-- Name: tb_disciplina_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_disciplina_id_seq OWNED BY public.tb_disciplina.id;


--
-- Name: tb_professor; Type: TABLE; Schema: public; Owner: manu
--

CREATE TABLE public.tb_professor (
    nome_professor character varying(255) NOT NULL,
    email_professor character varying(255) NOT NULL,
    cpf character varying(11) NOT NULL,
    telefone character varying NOT NULL,
    endereco character varying NOT NULL,
    matricula bigint NOT NULL,
    id_departamento bigint NOT NULL
);


ALTER TABLE public.tb_professor OWNER TO manu;

--
-- Name: tb_professor_disciplina; Type: TABLE; Schema: public; Owner: manu
--

CREATE TABLE public.tb_professor_disciplina (
    semestre integer NOT NULL,
    descricao text,
    matricula_professor bigint NOT NULL,
    id_disciplina bigint NOT NULL
);


ALTER TABLE public.tb_professor_disciplina OWNER TO manu;

--
-- Name: tb_professor_disciplina_id_disciplina_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_professor_disciplina_id_disciplina_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_professor_disciplina_id_disciplina_seq OWNER TO manu;

--
-- Name: tb_professor_disciplina_id_disciplina_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_professor_disciplina_id_disciplina_seq OWNED BY public.tb_professor_disciplina.id_disciplina;


--
-- Name: tb_professor_disciplina_id_professr_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_professor_disciplina_id_professr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_professor_disciplina_id_professr_seq OWNER TO manu;

--
-- Name: tb_professor_disciplina_id_professr_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_professor_disciplina_id_professr_seq OWNED BY public.tb_professor_disciplina.matricula_professor;


--
-- Name: tb_professor_id_departamento_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_professor_id_departamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_professor_id_departamento_seq OWNER TO manu;

--
-- Name: tb_professor_id_departamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_professor_id_departamento_seq OWNED BY public.tb_professor.id_departamento;


--
-- Name: tb_professor_matricula_seq; Type: SEQUENCE; Schema: public; Owner: manu
--

CREATE SEQUENCE public.tb_professor_matricula_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_professor_matricula_seq OWNER TO manu;

--
-- Name: tb_professor_matricula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: manu
--

ALTER SEQUENCE public.tb_professor_matricula_seq OWNED BY public.tb_professor.matricula;


--
-- Name: tb_aluno matricula; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_aluno ALTER COLUMN matricula SET DEFAULT nextval('public.tb_aluno_matricula_seq'::regclass);


--
-- Name: tb_aluno id_curso; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_aluno ALTER COLUMN id_curso SET DEFAULT nextval('public.tb_aluno_curso_id_seq'::regclass);


--
-- Name: tb_aluno_disciplina matricula_aluno; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_aluno_disciplina ALTER COLUMN matricula_aluno SET DEFAULT nextval('public.tb_aluno_disciplina_matricula_aluno_seq'::regclass);


--
-- Name: tb_aluno_disciplina id_disciplina; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_aluno_disciplina ALTER COLUMN id_disciplina SET DEFAULT nextval('public.tb_aluno_disciplina_id_disciplina_seq'::regclass);


--
-- Name: tb_curso id; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_curso ALTER COLUMN id SET DEFAULT nextval('public.tb_curso_id_curso_seq'::regclass);


--
-- Name: tb_curso id_departamento; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_curso ALTER COLUMN id_departamento SET DEFAULT nextval('public.tb_curso_id_departamento_seq'::regclass);


--
-- Name: tb_curso_disciplina id_curso; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_curso_disciplina ALTER COLUMN id_curso SET DEFAULT nextval('public.tb_curso_disciplina_id_curso_seq'::regclass);


--
-- Name: tb_curso_disciplina id_disciplina; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_curso_disciplina ALTER COLUMN id_disciplina SET DEFAULT nextval('public.tb_curso_disciplina_id_disciplina_seq'::regclass);


--
-- Name: tb_departamento id; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_departamento ALTER COLUMN id SET DEFAULT nextval('public.tb_departamento_id_seq'::regclass);


--
-- Name: tb_desconto matricula_aluno; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_desconto ALTER COLUMN matricula_aluno SET DEFAULT nextval('public.tb_desconto_matricula_aluno_seq'::regclass);


--
-- Name: tb_disciplina id; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_disciplina ALTER COLUMN id SET DEFAULT nextval('public.tb_disciplina_id_seq'::regclass);


--
-- Name: tb_professor matricula; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_professor ALTER COLUMN matricula SET DEFAULT nextval('public.tb_professor_matricula_seq'::regclass);


--
-- Name: tb_professor id_departamento; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_professor ALTER COLUMN id_departamento SET DEFAULT nextval('public.tb_professor_id_departamento_seq'::regclass);


--
-- Name: tb_professor_disciplina matricula_professor; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_professor_disciplina ALTER COLUMN matricula_professor SET DEFAULT nextval('public.tb_professor_disciplina_id_professr_seq'::regclass);


--
-- Name: tb_professor_disciplina id_disciplina; Type: DEFAULT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_professor_disciplina ALTER COLUMN id_disciplina SET DEFAULT nextval('public.tb_professor_disciplina_id_disciplina_seq'::regclass);


--
-- Name: tb_aluno pk_tb_aluno; Type: CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_aluno
    ADD CONSTRAINT pk_tb_aluno PRIMARY KEY (matricula);


--
-- Name: tb_curso pk_tb_curso; Type: CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_curso
    ADD CONSTRAINT pk_tb_curso PRIMARY KEY (id);


--
-- Name: tb_departamento pk_tb_departamento; Type: CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_departamento
    ADD CONSTRAINT pk_tb_departamento PRIMARY KEY (id);


--
-- Name: tb_disciplina pk_tb_disciplina; Type: CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_disciplina
    ADD CONSTRAINT pk_tb_disciplina PRIMARY KEY (id);


--
-- Name: tb_professor pk_tb_professor; Type: CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_professor
    ADD CONSTRAINT pk_tb_professor PRIMARY KEY (matricula);


--
-- Name: tb_aluno tb_aluno_cpf_key; Type: CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_aluno
    ADD CONSTRAINT tb_aluno_cpf_key UNIQUE (cpf);


--
-- Name: tb_aluno tb_aluno_email_key; Type: CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_aluno
    ADD CONSTRAINT tb_aluno_email_key UNIQUE (email);


--
-- Name: tb_professor tb_professor_cpf_key; Type: CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_professor
    ADD CONSTRAINT tb_professor_cpf_key UNIQUE (cpf);


--
-- Name: tb_professor tb_professor_email_professor_key; Type: CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_professor
    ADD CONSTRAINT tb_professor_email_professor_key UNIQUE (email_professor);


--
-- Name: idx_tb_aluno_media_global; Type: INDEX; Schema: public; Owner: manu
--

CREATE INDEX idx_tb_aluno_media_global ON public.tb_aluno USING btree (media_global);


--
-- Name: tb_aluno_disciplina fk_tb_aluno_disciplina_tb_aluno; Type: FK CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_aluno_disciplina
    ADD CONSTRAINT fk_tb_aluno_disciplina_tb_aluno FOREIGN KEY (matricula_aluno) REFERENCES public.tb_aluno(matricula);


--
-- Name: tb_aluno_disciplina fk_tb_aluno_disciplina_tb_disciplina; Type: FK CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_aluno_disciplina
    ADD CONSTRAINT fk_tb_aluno_disciplina_tb_disciplina FOREIGN KEY (id_disciplina) REFERENCES public.tb_disciplina(id);


--
-- Name: tb_aluno fk_tb_aluno_tb_curso; Type: FK CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_aluno
    ADD CONSTRAINT fk_tb_aluno_tb_curso FOREIGN KEY (id_curso) REFERENCES public.tb_curso(id);


--
-- Name: tb_curso_disciplina fk_tb_curso_disciplina_tb_curso; Type: FK CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_curso_disciplina
    ADD CONSTRAINT fk_tb_curso_disciplina_tb_curso FOREIGN KEY (id_curso) REFERENCES public.tb_curso(id);


--
-- Name: tb_curso_disciplina fk_tb_curso_disciplina_tb_disciplina; Type: FK CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_curso_disciplina
    ADD CONSTRAINT fk_tb_curso_disciplina_tb_disciplina FOREIGN KEY (id_disciplina) REFERENCES public.tb_disciplina(id);


--
-- Name: tb_curso fk_tb_curso_tb_departamento; Type: FK CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_curso
    ADD CONSTRAINT fk_tb_curso_tb_departamento FOREIGN KEY (id_departamento) REFERENCES public.tb_departamento(id);


--
-- Name: tb_desconto fk_tb_desconto_tb_aluno; Type: FK CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_desconto
    ADD CONSTRAINT fk_tb_desconto_tb_aluno FOREIGN KEY (matricula_aluno) REFERENCES public.tb_aluno(matricula);


--
-- Name: tb_disciplina fk_tb_disciplina_tb_departamento; Type: FK CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_disciplina
    ADD CONSTRAINT fk_tb_disciplina_tb_departamento FOREIGN KEY (id_departamento) REFERENCES public.tb_departamento(id);


--
-- Name: tb_professor_disciplina fk_tb_professor_disciplina_tb_disciplina; Type: FK CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_professor_disciplina
    ADD CONSTRAINT fk_tb_professor_disciplina_tb_disciplina FOREIGN KEY (id_disciplina) REFERENCES public.tb_disciplina(id);


--
-- Name: tb_professor_disciplina fk_tb_professor_disciplina_tb_professor; Type: FK CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_professor_disciplina
    ADD CONSTRAINT fk_tb_professor_disciplina_tb_professor FOREIGN KEY (matricula_professor) REFERENCES public.tb_professor(matricula);


--
-- Name: tb_professor fk_tb_professor_tb_departamento; Type: FK CONSTRAINT; Schema: public; Owner: manu
--

ALTER TABLE ONLY public.tb_professor
    ADD CONSTRAINT fk_tb_professor_tb_departamento FOREIGN KEY (id_departamento) REFERENCES public.tb_departamento(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO manu;


--
-- PostgreSQL database dump complete
--

