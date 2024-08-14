# Sistema-de-Gestao-Universitaria


### Tabela de Relacionamentos

| Tabela                  | Chave Primária               | Chave Estrangeira                        | Tabela Relacionada              | Tipo de Relacionamento        | Descrição                                                      |
|------------------------|------------------------------|------------------------------------------|---------------------------------|-------------------------------|--------------------------------------------------------------|
| **tb_aluno**           | aluno_id                     | N/A                                      | N/A                             | N/A                           | Contém informações dos alunos, como nome e matrícula.       |
| **tb_professor**       | professor_id                 | N/A                                      | N/A                             | N/A                           | Contém informações dos professores, como nome e matrícula.   |
| **tb_departamento**    | departamento_id              | N/A                                      | N/A                             | N/A                           | Contém informações dos departamentos, como nome e localização.|
| **tb_curso**           | curso_id                     | departamento_id                          | tb_departamento                 | Muitos para Um               | Contém informações dos cursos oferecidos na faculdade.       |
| **tb_disciplina**      | disciplina_id                | departamento_id                          | tb_departamento                 | Muitos para Um               | Contém informações das disciplinas, como nome e carga horária.|
| **tb_turma**           | turma_id                     | disciplina_id                            | tb_disciplina                   | Muitos para Um               | Contém informações das turmas, como horário e sala.         |
| **tb_grade_notas**     | nota_id                      | aluno_id, disciplina_id                  | tb_aluno, tb_disciplina         | Muitos para Um               | Contém as notas dos alunos em cada disciplina.               |
| **tb_grade_presenca**  | presenca_id                 | aluno_id, turma_id                       | tb_aluno, tb_turma              | Muitos para Um               | Contém a frequência dos alunos em cada turma.                |
| **tb_historico**       | historico_id                 | aluno_id, disciplina_id                  | tb_aluno, tb_disciplina         | Muitos para Um               | Armazena o histórico de notas dos alunos em cada disciplina. |
| **tb_co_requisitos**   | co_requisitos_id             | disciplina_id, pre_requisito_id         | tb_disciplina                   | Muitos para Um               | Define co-requisitos entre disciplinas.                       |
| **tb_pre_requisitos**  | pre_requisitos_id            | disciplina_id, requisito_id              | tb_disciplina                   | Muitos para Um               | Define pré-requisitos para disciplinas.                      |
| **tb_aluno_disciplina**| aluno_disciplina_id          | aluno_id, disciplina_id                  | tb_aluno, tb_disciplina         | Muitos para Muitos           | Relaciona alunos a disciplinas que estão cursando.          |
| **tb_aluno_semestre**  | aluno_semestre_id            | aluno_id, semestre_id                    | tb_aluno, tb_semestre           | Muitos para Um               | Relaciona alunos a seus semestres.                           |
| **tb_semestre**        | semestre_id                  | N/A                                      | N/A                             | N/A                           | Contém informações dos semestres acadêmicos.                 |
| **tb_estrutura_curricular** | estrutura_id           | curso_id, disciplina_id                  | tb_curso, tb_disciplina         | Muitos para Um               | Define a grade curricular de cada curso.                     |



DER BASE

![image](https://github.com/user-attachments/assets/7dc90a92-44c2-48e5-84d0-0786f21bbf0d)

DER CREATED

![image](https://github.com/user-attachments/assets/73dfcb79-c98e-4d14-b430-1762baf57aaa)



