CREATE TABLE "tb_departamento" (
  "cod_departamento" SERIAL PRIMARY KEY,
  "nome_departamento" varchar(255) NOT NULL,
  "descricao" text NOT NULL
);

CREATE TABLE "tb_disciplina" (
  "nome_disciplinas" varchar(100),
  "descricao" varchar(255),
  "carga_horaria" int4 NOT NULL,
  "semestre_oferecido" int4 NOT NULL,
  "cod_departamento" int4 NOT NULL,
  "cod_disciplina" SERIAL UNIQUE NOT NULL
);

CREATE TABLE "tb_pre_requisitos" (
  "cod_disciplina" int4 NOT NULL,
  "cod_pre_requisitos" int4 NOT NULL
);

CREATE TABLE "tb_professor" (
  "nome_professor" varchar(255),
  "cod_departamento" int4 NOT NULL,
  "cpf" varchar(11),
  "cod_professor" SERIAL PRIMARY KEY,
  "data_nascimento" date NOT NULL,
  "email" varchar(100) UNIQUE NOT NULL,
  "telefone" varchar(15) NOT NULL,
  "endereco" text NOT NULL,
  "matricula" varchar(20) UNIQUE NOT NULL,
  "data_matricula" date NOT NULL
);

CREATE TABLE "prof_disciplina" (
  "cod_professor" int4 NOT NULL,
  "cod_disciplina" int4 UNIQUE NOT NULL
);

CREATE TABLE "tb_co_requisitos" (
  "cod_co_requisito" int4 NOT NULL,
  "cod_disciplina" int4 NOT NULL
);

CREATE TABLE "tb_curso" (
  "nome_curso" varchar(100),
  "cod_curso" SERIAL PRIMARY KEY,
  "cod_departamento" int4 NOT NULL,
  "duracao" int4 NOT NULL,
  "descricao" text NOT NULL,
  "valor_mensalidade" numeric(10,2) NOT NULL
);

CREATE TABLE "tb_desconto" (
  "cod_desconto" SERIAL PRIMARY KEY,
  "descricao" varchar(255) NOT NULL,
  "valor_desconto" numeric(5,2) NOT NULL,
  "criterio_aplicacao" text NOT NULL
);

CREATE TABLE "tb_aluno_desconto" (
  "matricula" int4 NOT NULL,
  "cod_desconto" int4 NOT NULL,
  "data_inicio" date NOT NULL,
  "data_fim" date
);

CREATE TABLE "tb_curso_disciplina" (
  "cod_departamento" int4 NOT NULL,
  "cod_curso" int4 NOT NULL,
  "cod_disciplina" int4 NOT NULL
);

CREATE TABLE "tb_estrutura_curricular" (
  "cod_curso" int4 NOT NULL,
  "cod_disciplina" int4 NOT NULL,
  "periodo" varchar(100) NOT NULL
);

CREATE TABLE "tb_indicadores_academicos" (
  "cod_indicador" SERIAL PRIMARY KEY,
  "cod_curso" int4 NOT NULL,
  "ano" int4 NOT NULL,
  "taxa_reprovacao" numeric(5,2),
  "taxa_evasao" numeric(5,2),
  "taxa_retencao" numeric(5,2)
);

CREATE TABLE "tb_turma" (
  "cod_turma" SERIAL PRIMARY KEY,
  "cod_professor" int4 NOT NULL,
  "cod_disciplina" int4,
  "nome_turma" int4,
  "turno" varchar(100),
  "sala" varchar,
  "horario" varchar,
  "ano" int4 NOT NULL,
  "cod_semestre" int4 NOT NULL
);

CREATE TABLE "tb_aluno" (
  "nome_aluno" varchar(255) NOT NULL,
  "cod_turma" int4 NOT NULL,
  "cpf" varchar(11) UNIQUE NOT NULL,
  "cod_curso" int4,
  "matricula" SERIAL PRIMARY KEY,
  "data_nascimento" date NOT NULL,
  "email" varchar(100) UNIQUE NOT NULL,
  "telefone" varchar(15) NOT NULL,
  "endereco" text NOT NULL,
  "data_matricula" date NOT NULL,
  "media_global" numeric(5,2),
  "status" varchar(20)
);

CREATE TABLE "tb_curso_aluno" (
  "cod_curso_aluno" SERIAL PRIMARY KEY,
  "cod_curso" int4 NOT NULL,
  "matricula" int4 NOT NULL,
  "data_inicio" date NOT NULL,
  "data_termino" date,
  "mensalidade_final" numeric(10,2)
);

CREATE TABLE "tb_aluno_disciplina" (
  "matricula" int4 NOT NULL,
  "cod_disciplina" int4 NOT NULL
);

CREATE TABLE "tb_historico" (
  "cod_historico" SERIAL PRIMARY KEY,
  "periodo_realizacao" varchar(100),
  "matricula" int4,
  "data_emissao" date NOT NULL,
  "observacoes" text
);

CREATE TABLE "tb_disciplina_historico" (
  "cod_historico" int4 NOT NULL,
  "cod_disciplina" int4 NOT NULL,
  "historico_grade_notas" int4 NOT NULL,
  "historico_grade_frequencia" int4 NOT NULL
);

CREATE TABLE "tb_grade_notas" (
  "matricula" int4 NOT NULL,
  "cod_disciplina" int4 NOT NULL,
  "nota1" numeric(5,2) NOT NULL,
  "nota2" numeric(5,2) NOT NULL,
  "media_final" numeric(5,2) NOT NULL,
  "unidade" varchar NOT NULL,
  "cod_grade_notas" SERIAL UNIQUE NOT NULL
);

CREATE TABLE "tb_grade_presenca" (
  "matricula" int4 NOT NULL,
  "cod_grade_presenca" SERIAL NOT NULL,
  "cod_disciplina" int4,
  "cod_turma" int4,
  "data" date NOT NULL,
  "status" bool
);

CREATE TABLE "tb_semestre" (
  "cod_semestre" SERIAL PRIMARY KEY,
  "ano" varchar,
  "periodo" varchar(100),
  "data_inicio" date,
  "data_fim" date
);

CREATE TABLE "tb_aluno_semestre" (
  "matricula" int4 NOT NULL,
  "cod_semestre" int4 NOT NULL
);

CREATE TABLE "tb_aluno_turma" (
  "matricula" int4 NOT NULL,
  "cod_turma" int4 NOT NULL
);

CREATE INDEX "pk_tb_disciplina" ON "tb_disciplina" USING BTREE ("cod_departamento", "cod_disciplina");
CREATE INDEX "idx_tb_disciplina" ON "tb_disciplina" USING BTREE ("cod_departamento", "cod_disciplina");
CREATE INDEX "pk_tb_pre_requisitos" ON "tb_pre_requisitos" USING BTREE ("cod_disciplina", "cod_pre_requisitos");
CREATE INDEX "pk_prof_disciplina" ON "prof_disciplina" USING BTREE ("cod_professor", "cod_disciplina");
CREATE INDEX "pk_tb_co_requisitos" ON "tb_co_requisitos" USING BTREE ("cod_disciplina", "cod_co_requisito");
CREATE INDEX "pk_tb_aluno_desconto" ON "tb_aluno_desconto" USING BTREE ("matricula", "cod_desconto");
CREATE INDEX "pk_tb_curso_disciplina" ON "tb_curso_disciplina" USING BTREE ("cod_departamento", "cod_curso", "cod_disciplina");
CREATE INDEX "pk_tb_estrutura_curricular" ON "tb_estrutura_curricular" USING BTREE ("cod_curso", "cod_disciplina");
CREATE INDEX "idx_tb_aluno_matricula" ON "tb_aluno" USING BTREE ("matricula");
CREATE INDEX "pk_tb_aluno_disciplina" ON "tb_aluno_disciplina" USING BTREE ("cod_disciplina", "matricula");
CREATE INDEX "pk_tb_disciplina_historico" ON "tb_disciplina_historico" USING BTREE ("cod_disciplina", "cod_historico");
CREATE INDEX "pk_tb_grade_notas" ON "tb_grade_notas" USING BTREE ("matricula", "cod_grade_notas");
CREATE INDEX "pk_tb_grade_presenca" ON "tb_grade_presenca" USING BTREE ("cod_grade_presenca", "matricula");
CREATE INDEX "pk_tb_aluno_semestre" ON "tb_aluno_semestre" USING BTREE ("matricula", "cod_semestre");
CREATE INDEX "idx_tb_aluno_semestre_cod_semestre" ON "tb_aluno_semestre" USING BTREE ("cod_semestre");
CREATE INDEX "pk_tb_aluno_turma" ON "tb_aluno_turma" USING BTREE ("cod_turma", "matricula");

COMMENT ON TABLE "tb_disciplina" IS 'A verificacao de disciplinas necessaria para cursar tal disciplina vai ser feita na consulta';
COMMENT ON TABLE "tb_co_requisitos" IS 'Definir as disciplinas que precisam ser cursadas juntas';
COMMENT ON TABLE "tb_aluno" IS 'O código do aluno seria a matrícula';

-- Adicionando chaves estrangeiras
ALTER TABLE "tb_disciplina" ADD FOREIGN KEY ("semestre_oferecido") REFERENCES "tb_semestre" ("cod_semestre");
ALTER TABLE "tb_disciplina" ADD FOREIGN KEY ("cod_departamento") REFERENCES "tb_departamento" ("cod_departamento");
ALTER TABLE "tb_pre_requisitos" ADD FOREIGN KEY ("cod_disciplina") REFERENCES "tb_disciplina" ("cod_disciplina");
ALTER TABLE "tb_pre_requisitos" ADD FOREIGN KEY ("cod_pre_requisitos") REFERENCES "tb_disciplina" ("cod_disciplina");
ALTER TABLE "tb_professor" ADD FOREIGN KEY ("cod_departamento") REFERENCES "tb_departamento" ("cod_departamento");
ALTER TABLE "prof_disciplina" ADD FOREIGN KEY ("cod_disciplina") REFERENCES "tb_disciplina" ("cod_disciplina");
ALTER TABLE "prof_disciplina" ADD FOREIGN KEY ("cod_professor") REFERENCES "tb_professor" ("cod_professor");
ALTER TABLE "tb_co_requisitos" ADD FOREIGN KEY ("cod_disciplina") REFERENCES "tb_disciplina" ("cod_disciplina");
ALTER TABLE "tb_co_requisitos" ADD FOREIGN KEY ("cod_co_requisito") REFERENCES "tb_disciplina" ("cod_disciplina");
ALTER TABLE "tb_curso" ADD FOREIGN KEY ("cod_departamento") REFERENCES "tb_departamento" ("cod_departamento");
ALTER TABLE "tb_aluno_desconto" ADD FOREIGN KEY ("cod_desconto") REFERENCES "tb_desconto" ("cod_desconto");
ALTER TABLE "tb_aluno_desconto" ADD FOREIGN KEY ("matricula") REFERENCES "tb_aluno" ("matricula");
ALTER TABLE "tb_curso_disciplina" ADD FOREIGN KEY ("cod_disciplina") REFERENCES "tb_disciplina" ("cod_disciplina");
ALTER TABLE "tb_curso_disciplina" ADD FOREIGN KEY ("cod_curso") REFERENCES "tb_curso" ("cod_curso");
ALTER TABLE "tb_curso_disciplina" ADD FOREIGN KEY ("cod_departamento") REFERENCES "tb_departamento" ("cod_departamento");
ALTER TABLE "tb_estrutura_curricular" ADD FOREIGN KEY ("cod_curso") REFERENCES "tb_curso" ("cod_curso");
ALTER TABLE "tb_estrutura_curricular" ADD FOREIGN KEY ("cod_disciplina") REFERENCES "tb_disciplina" ("cod_disciplina");
ALTER TABLE "tb_turma" ADD FOREIGN KEY ("cod_professor") REFERENCES "tb_professor" ("cod_professor");
ALTER TABLE "tb_turma" ADD FOREIGN KEY ("cod_disciplina") REFERENCES "tb_disciplina" ("cod_disciplina");
ALTER TABLE "tb_turma" ADD FOREIGN KEY ("cod_semestre") REFERENCES "tb_semestre" ("cod_semestre");
ALTER TABLE "tb_aluno" ADD FOREIGN KEY ("cod_curso") REFERENCES "tb_curso" ("cod_curso");
ALTER TABLE "tb_aluno" ADD FOREIGN KEY ("cod_turma") REFERENCES "tb_turma" ("cod_turma");
ALTER TABLE "tb_curso_aluno" ADD FOREIGN KEY ("cod_curso") REFERENCES "tb_curso" ("cod_curso");
ALTER TABLE "tb_curso_aluno" ADD FOREIGN KEY ("matricula") REFERENCES "tb_aluno" ("matricula");
ALTER TABLE "tb_aluno_disciplina" ADD FOREIGN KEY ("cod_disciplina") REFERENCES "tb_disciplina" ("cod_disciplina");
ALTER TABLE "tb_aluno_disciplina" ADD FOREIGN KEY ("matricula") REFERENCES "tb_aluno" ("matricula");
ALTER TABLE "tb_historico" ADD FOREIGN KEY ("matricula") REFERENCES "tb_aluno" ("matricula");
ALTER TABLE "tb_disciplina_historico" ADD FOREIGN KEY ("cod_historico") REFERENCES "tb_historico" ("cod_historico");
ALTER TABLE "tb_disciplina_historico" ADD FOREIGN KEY ("cod_disciplina") REFERENCES "tb_disciplina" ("cod_disciplina");
ALTER TABLE "tb_grade_notas" ADD FOREIGN KEY ("cod_disciplina") REFERENCES "tb_disciplina" ("cod_disciplina");
ALTER TABLE "tb_grade_notas" ADD FOREIGN KEY ("matricula") REFERENCES "tb_aluno" ("matricula");
ALTER TABLE "tb_grade_presenca" ADD FOREIGN KEY ("matricula") REFERENCES "tb_aluno" ("matricula");
ALTER TABLE "tb_grade_presenca" ADD FOREIGN KEY ("cod_disciplina") REFERENCES "tb_disciplina" ("cod_disciplina");
ALTER TABLE "tb_grade_presenca" ADD FOREIGN KEY ("cod_turma") REFERENCES "tb_turma" ("cod_turma");
ALTER TABLE "tb_aluno_semestre" ADD FOREIGN KEY ("cod_semestre") REFERENCES "tb_semestre" ("cod_semestre");
ALTER TABLE "tb_aluno_semestre" ADD FOREIGN KEY ("matricula") REFERENCES "tb_aluno" ("matricula");
ALTER TABLE "tb_aluno_turma" ADD FOREIGN KEY ("matricula") REFERENCES "tb_aluno" ("matricula");
ALTER TABLE "tb_aluno_turma" ADD FOREIGN KEY ("cod_turma") REFERENCES "tb_turma" ("cod_turma");