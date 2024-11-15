-- Criação do esquema
CREATE SCHEMA public;

-- Tabela prof_disciplina
CREATE TABLE public.prof_disciplina (
    cod_professor INTEGER NOT NULL,
    cod_disciplina INTEGER NOT NULL,
    PRIMARY KEY (cod_professor, cod_disciplina),
    CONSTRAINT fk_prof_disciplina
        FOREIGN KEY (cod_disciplina) REFERENCES public.tb_disciplina(cod_disciplina),
    CONSTRAINT fk_prof_disciplina_prof
        FOREIGN KEY (cod_professor) REFERENCES public.tb_professor(cod_professor)
);

CREATE UNIQUE INDEX unq_prof_disciplina_cod_disciplina ON public.prof_disciplina (cod_disciplina);

-- Tabela tb_aluno
CREATE TABLE public.tb_aluno (
    nome_aluno VARCHAR(255) NOT NULL,
    cod_turma INTEGER NOT NULL,
    cpf INTEGER NOT NULL,
    cod_curso INTEGER,
    matricula INTEGER NOT NULL,
    cod_grade_nota INTEGER NOT NULL,
    cod_grade_presenca INTEGER,
    cod_semestre INTEGER,
    data_nascimento DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    endereco TEXT NOT NULL,
    data_matricula DATE NOT NULL,
    PRIMARY KEY (matricula),
    CONSTRAINT fk_tb_aluno_tb_turma
        FOREIGN KEY (cod_turma) REFERENCES public.tb_turma(cod_turma),
    CONSTRAINT fk_tb_aluno_grade_nota
        FOREIGN KEY (cod_grade_nota) REFERENCES public.tb_grade_notas(cod_grade_notas),
    CONSTRAINT fk_tb_aluno_tb_semestre
        FOREIGN KEY (cod_semestre) REFERENCES public.tb_semestre(cod_semestre),
    CONSTRAINT fk_tb_aluno_tb_curso
        FOREIGN KEY (cod_curso) REFERENCES public.tb_curso_aluno(cod_curso)
);

CREATE UNIQUE INDEX tb_aluno_email_key ON public.tb_aluno (email);
CREATE UNIQUE INDEX unq_tb_aluno_matricula ON public.tb_aluno (matricula);

-- Tabela tb_aluno_disciplina
CREATE TABLE public.tb_aluno_disciplina (
    matricula INTEGER NOT NULL,
    cod_disciplina INTEGER NOT NULL,
    PRIMARY KEY (matricula, cod_disciplina),
    CONSTRAINT fk_tb_aluno_disciplina
        FOREIGN KEY (cod_disciplina) REFERENCES public.tb_disciplina(cod_disciplina),
    CONSTRAINT fk_tb_aluno
        FOREIGN KEY (matricula) REFERENCES public.tb_aluno(matricula)
);

-- Tabela tb_aluno_semestre
CREATE TABLE public.tb_aluno_semestre (
    matricula INTEGER NOT NULL,
    cod_semestre INTEGER NOT NULL,
    PRIMARY KEY (matricula, cod_semestre),
    CONSTRAINT fk_tb_aluno_semestre_aluno
        FOREIGN KEY (matricula) REFERENCES public.tb_aluno(matricula),
    CONSTRAINT fk_tb_aluno_semestre
        FOREIGN KEY (cod_semestre) REFERENCES public.tb_semestre(cod_semestre)
);

-- Tabela tb_aluno_turma
CREATE TABLE public.tb_aluno_turma (
    matricula INTEGER NOT NULL,
    cod_turma INTEGER NOT NULL,
    PRIMARY KEY (matricula, cod_turma),
    CONSTRAINT fk_tb_aluno_turma_tb_turma
        FOREIGN KEY (cod_turma) REFERENCES public.tb_turma(cod_turma),
    CONSTRAINT fk_tb_aluno_turma_tb_aluno
        FOREIGN KEY (matricula) REFERENCES public.tb_aluno(matricula)
);

-- Tabela tb_co_requisitos
CREATE TABLE public.tb_co_requisitos (
    cod_co_requisito INTEGER NOT NULL,
    cod_disciplina INTEGER NOT NULL,
    PRIMARY KEY (cod_co_requisito, cod_disciplina),
    CONSTRAINT fk_tb_co_requisitos_disciplina
        FOREIGN KEY (cod_disciplina) REFERENCES public.tb_disciplina(cod_disciplina),
    CONSTRAINT fk_tb_co_requisitos
        FOREIGN KEY (cod_co_requisito) REFERENCES public.prof_disciplina(cod_disciplina)
);

-- Tabela tb_curso
CREATE TABLE public.tb_curso (
    cod_curso INTEGER NOT NULL,
    nome_curso VARCHAR(100),
    cod_departamento INTEGER NOT NULL,
    duracao INTEGER NOT NULL,
    descricao TEXT NOT NULL,
    PRIMARY KEY (cod_curso),
    CONSTRAINT fk_tb_curso_tb_departamento
        FOREIGN KEY (cod_departamento) REFERENCES public.tb_departamento(cod_departamento)
);

-- Tabela tb_curso_aluno
CREATE TABLE public.tb_curso_aluno (
    cod_curso INTEGER NOT NULL,
    data_inicio DATE NOT NULL,
    data_termino DATE NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    matricula INTEGER NOT NULL,
    PRIMARY KEY (matricula, cod_curso),
    CONSTRAINT fk_tb_matricula_aluno_tb_curso
        FOREIGN KEY (cod_curso) REFERENCES public.tb_curso(cod_curso),
    CONSTRAINT fk_tb_matricula_aluno_null
        FOREIGN KEY (matricula) REFERENCES public.tb_aluno(matricula)
);

CREATE UNIQUE INDEX unq_tb_matricula_aluno_cod_curso ON public.tb_curso_aluno (cod_curso);

-- Tabela tb_curso_disciplina
CREATE TABLE public.tb_curso_disciplina (
    cod_disciplina INTEGER NOT NULL,
    cod_curso INTEGER NOT NULL,
    PRIMARY KEY (cod_disciplina, cod_curso),
    CONSTRAINT fk_tb_curso
        FOREIGN KEY (cod_curso) REFERENCES public.tb_curso(cod_curso),
    CONSTRAINT fk_tb_disciplina
        FOREIGN KEY (cod_disciplina) REFERENCES public.tb_disciplina(cod_disciplina)
);

-- Tabela tb_departamento
CREATE TABLE public.tb_departamento (
    cod_departamento INTEGER NOT NULL,
    nome_departamento VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    PRIMARY KEY (cod_departamento)
);

-- Tabela tb_disciplina
CREATE TABLE public.tb_disciplina (
    cod_disciplina INTEGER NOT NULL,
    nome_disciplina VARCHAR(255) NOT NULL,
    cod_departamento INTEGER NOT NULL,
    descricao TEXT NOT NULL,
    carga_horaria INTEGER NOT NULL,
    creditos INTEGER NOT NULL,
    PRIMARY KEY (cod_disciplina),
    CONSTRAINT fk_tb_disciplina_tb_departamento
        FOREIGN KEY (cod_departamento) REFERENCES public.tb_departamento(cod_departamento)
);

-- Tabela tb_grade_notas
CREATE TABLE public.tb_grade_notas (
    cod_grade_notas INTEGER NOT NULL,
    cod_aluno INTEGER NOT NULL,
    cod_disciplina INTEGER NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (cod_grade_notas),
    CONSTRAINT fk_tb_grade_notas_tb_aluno
        FOREIGN KEY (cod_aluno) REFERENCES public.tb_aluno(matricula),
    CONSTRAINT fk_tb_grade_notas_tb_disciplina
        FOREIGN KEY (cod_disciplina) REFERENCES public.tb_disciplina(cod_disciplina)
);

-- Tabela tb_grade_presenca
CREATE TABLE public.tb_grade_presenca (
    cod_grade_presenca INTEGER NOT NULL,
    cod_aluno INTEGER NOT NULL,
    cod_disciplina INTEGER NOT NULL,
    presenca INTEGER NOT NULL,
    PRIMARY KEY (cod_grade_presenca),
    CONSTRAINT fk_tb_grade_presenca_tb_aluno
        FOREIGN KEY (cod_aluno) REFERENCES public.tb_aluno(matricula),
    CONSTRAINT fk_tb_grade_presenca_tb_disciplina
        FOREIGN KEY (cod_disciplina) REFERENCES public.tb_disciplina(cod_disciplina)
);

-- Tabela tb_professor
CREATE TABLE public.tb_professor (
    cod_professor INTEGER NOT NULL,
    nome_professor VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    endereco TEXT NOT NULL,
    PRIMARY KEY (cod_professor)
);

CREATE UNIQUE INDEX unq_tb_professor_email ON public.tb_professor (email);
CREATE UNIQUE INDEX unq_tb_professor_cpf ON public.tb_professor (cpf);

-- Tabela tb_semestre
CREATE TABLE public.tb_semestre (
    cod_semestre INTEGER NOT NULL,
    ano INTEGER NOT NULL,
    semestre INTEGER NOT NULL,
    PRIMARY KEY (cod_semestre)
);

-- Tabela tb_turma
CREATE TABLE public.tb_turma (
    cod_turma INTEGER NOT NULL,
    cod_curso INTEGER NOT NULL,
    ano INTEGER NOT NULL,
    semestre INTEGER NOT NULL,
    PRIMARY KEY (cod_turma, cod_curso),
    CONSTRAINT fk_tb_turma_tb_curso
        FOREIGN KEY (cod_curso) REFERENCES public.tb_curso(cod_curso)
);
