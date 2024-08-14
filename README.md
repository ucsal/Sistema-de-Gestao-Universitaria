# Sistema-de-Gestao-Universitaria


### Tabela de Relacionamentos


| Entidade                        | Atributos Principais                                      | Relacionamento                                   | Entidade Relacionada             | Atributos Relacionados                          | Descrição do Relacionamento                                                                                                                                                                                                                                                                                   |
|---------------------------------|-----------------------------------------------------------|--------------------------------------------------|----------------------------------|-------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Alunos (`tb_aluno`)             | `id_aluno`, `nome`, `data_nascimento`, `email`           | Matriculado em                                   | Cursos (`tb_curso`)              | `id_curso`, `data_matricula`                   | Um aluno pode estar matriculado em vários cursos. O relacionamento é realizado através de uma tabela associativa `tb_matricula` que contém `id_aluno` e `id_curso`.                                                                                                                                      |
| Alunos (`tb_aluno`)             | `id_aluno`, `nome`, `data_nascimento`, `email`           | Inscrito em várias disciplinas                    | Disciplinas (`tb_disciplina`)    | `id_disciplina`, `data_inscricao`              | Um aluno pode se inscrever em várias disciplinas. O relacionamento é realizado através de uma tabela associativa `tb_inscricao` que contém `id_aluno` e `id_disciplina`.                                                                                                                                      |
| Cursos (`tb_curso`)             | `id_curso`, `nome`, `descricao`                           | Oferece várias disciplinas                        | Disciplinas (`tb_disciplina`)    | `id_disciplina`                                 | Um curso pode incluir várias disciplinas. O relacionamento é realizado através de uma tabela associativa `tb_curso_disciplina` que contém `id_curso` e `id_disciplina`.                                                                                                                                      |
| Disciplinas (`tb_disciplina`)   | `id_disciplina`, `nome`, `carga_horaria`                 | Lecionada por vários professores                  | Professores (`tb_professor`)      | `id_professor`                                  | Uma disciplina pode ser lecionada por vários professores. O relacionamento é realizado através de uma tabela associativa `tb_disciplina_professor` que contém `id_disciplina` e `id_professor`.                                                                                                                                              |
| Professores (`tb_professor`)     | `id_professor`, `nome`, `especialidade`                   | Leciona várias disciplinas                        | Disciplinas (`tb_disciplina`)    | `id_disciplina`                                 | Um professor pode lecionar várias disciplinas. O relacionamento é realizado através de uma tabela associativa `tb_disciplina_professor`.                                                                                                                                                                       |
| Alunos (`tb_aluno`)             | `id_aluno`, `nome`, `data_nascimento`, `email`           | Tem um histórico de notas                         | Histórico de Notas (`tb_historico`) | `id_historico`, `nota`, `id_disciplina`        | Um aluno pode ter um histórico de notas. O relacionamento é feito através da tabela `tb_historico`, onde cada registro relaciona um aluno a uma disciplina e suas notas.                                                                                                                                  |
| Alunos (`tb_aluno`)             | `id_aluno`, `nome`, `data_nascimento`, `email`           | Tem um histórico de presença                      | Histórico de Presença (`tb_presenca`) | `id_presenca`, `data`, `status`                 | Um aluno pode ter um histórico de presença. O relacionamento é feito através da tabela `tb_presenca`, onde cada registro relaciona um aluno à sua presença em uma data específica.                                                                                                                                  |
| Cursos (`tb_curso`)             | `id_curso`, `nome`, `descricao`                           | Gerencia várias disciplinas e professores         | Disciplinas (`tb_disciplina`)    | `id_disciplina`                                 | Um curso gerencia várias disciplinas. Este relacionamento é um reflexo do relacionamento entre cursos e disciplinas.                                                                                                                                                                                          |
| Departamentos (`tb_departamento`) | `id_departamento`, `nome`, `descricao`                    | Gerencia professores e disciplinas                | Professores (`tb_professor`)      | `id_professor`                                  | Um departamento pode gerenciar vários professores. O relacionamento é realizado através de uma chave estrangeira em `tb_professor` que aponta para `id_departamento`.                                                                                                                                     |
| Disciplinas (`tb_disciplina`)   | `id_disciplina`, `nome`, `carga_horaria`                 | Pertence a um departamento                        | Departamentos (`tb_departamento`) | `id_departamento`                               | Uma disciplina pertence a um departamento. O relacionamento é realizado através de uma chave estrangeira em `tb_disciplina` que aponta para `id_departamento`.                                                                                                                                          |
| Disciplinas (`tb_disciplina`)   | `id_disciplina`, `nome`, `carga_horaria`                 | Dependente de outras disciplinas                  | Disciplinas (`tb_disciplina`)    | `id_disciplina_dependente`                     | Uma disciplina pode depender da conclusão de outras disciplinas. O relacionamento é realizado através de uma tabela associativa `tb_dependencias` que contém `id_disciplina` e `id_disciplina_dependente`.                                                                                                                            |
| Professores (`tb_professor`)     | `id_professor`, `nome`, `especialidade`                   | Pertence a um departamento                        | Departamentos (`tb_departamento`) | `id_departamento`                               | Um professor pertence a um departamento. O relacionamento é realizado através de uma chave estrangeira em `tb_professor` que aponta para `id_departamento`.                                                                                                                                             |
| Alunos (`tb_aluno`)             | `id_aluno`, `nome`, `data_nascimento`, `email`           | Tem uma matrícula                                 | Matrículas (`tb_matricula`)      | `id_matricula`, `data_matricula`              | Um aluno possui uma matrícula, que contém informações sobre sua matrícula em um curso. O relacionamento é feito através da tabela `tb_matricula`, onde cada registro relaciona um aluno e sua matrícula.                                                                                                             |
| Cursos (`tb_curso`)             | `id_curso`, `nome`, `descricao`                           | Oferece várias turmas                             | Turmas (`tb_turma`)              | `id_turma`, `ano`, `semestre`                  | Um curso pode oferecer várias turmas. O relacionamento é realizado através de uma tabela associativa `tb_curso_turma` que contém `id_curso` e `id_turma`.                                                                                                                                                      |
| Turmas (`tb_turma`)             | `id_turma`, `id_disciplina`, `ano`, `semestre`           | Pertence a um curso                               | Cursos (`tb_curso`)              | `id_curso`                                     | Uma turma pertence a um curso. O relacionamento é realizado através de uma chave estrangeira em `tb_turma` que aponta para `id_curso`.                                                                                                                                                                      |
| Turmas (`tb_turma`)             | `id_turma`, `id_disciplina`, `ano`, `semestre`           | Tem alunos matriculados                           | Alunos (`tb_aluno`)              | `id_aluno`, `status`                            | Uma turma pode ter vários alunos matriculados. O relacionamento é realizado através de uma tabela associativa `tb_turma_aluno` que contém `id_turma` e `id_aluno`.                                                                                                                                              |


DER BASE

![image](https://github.com/user-attachments/assets/7dc90a92-44c2-48e5-84d0-0786f21bbf0d)

DER CREATED



![db](https://github.com/user-attachments/assets/891a7efb-27a1-41e3-bc3e-d81bb6eafefb)



