# Sistema-de-Gestao-Universitaria


### Tabela de Relacionamentos, AJEITAR ATRIBUTOS 

| Entidade          | Relacionamento                    | Tipo de Relacionamento | Entidade Relacionada     | Tabela Associativa (se necessário)  | Chaves Estrangeiras                      |
|-------------------|-----------------------------------|------------------------|--------------------------|-------------------------------------|------------------------------------------|
| **Departamento**  | Gerencia                          | 1:N                    | Professor                | Não é necessária                    | `Professor.DepartamentoID`               |
|                   | Gerencia                          | 1:N                    | Disciplina               | Não é necessária                    | `Disciplina.DepartamentoID`              |
|                   | Gerencia                          | 1:N                    | Curso                    | Não é necessária                    | `Curso.DepartamentoID`                   |
| **Curso**         | Pertence                          | N:1                    | Departamento             | Não é necessária                    | `Curso.DepartamentoID`                   |
|                   | Composto por                      | N:M                    | Disciplina               | `CursoDisciplina`                   | `CursoDisciplina.CursoID`, `CursoDisciplina.DisciplinaID` |
| **Disciplina**    | Pertence                          | N:1                    | Departamento             | Não é necessária                    | `Disciplina.DepartamentoID`              |
|                   | Ministrada por                    | N:M                    | Professor                | `ProfessorDisciplina`               | `ProfessorDisciplina.ProfessorID`, `ProfessorDisciplina.DisciplinaID` |
|                   | Tem notas                         | 1:N                    | Nota                     | Não é necessária                    | `Nota.DisciplinaID`                      |
|                   | Pré-requisito para                | N:M                    | Disciplina (mesma entidade) | `DisciplinaPrerequisito`          | `DisciplinaPrerequisito.DisciplinaID`, `DisciplinaPrerequisito.PrerequisitoID` |
| **Professor**     | Pertence                          | N:1                    | Departamento             | Não é necessária                    | `Professor.DepartamentoID`               |
|                   | Leciona                           | N:M                    | Disciplina               | `ProfessorDisciplina`               | `ProfessorDisciplina.ProfessorID`, `ProfessorDisciplina.DisciplinaID` |
|                   | Leciona                           | N:M                    | Turma                    | `ProfessorTurma`                    | `ProfessorTurma.ProfessorID`, `ProfessorTurma.TurmaID` |
| **Turma**         | Associada                         | N:1                    | Disciplina               | Não é necessária                    | `Turma.DisciplinaID`                     |
|                   | Associada                         | N:1                    | Curso                    | Não é necessária                    | `Turma.CursoID`                          |
|                   | Contém                            | N:M                    | Aluno                    | `AlunoTurma`                        | `AlunoTurma.AlunoID`, `AlunoTurma.TurmaID` |
|                   | Associada a                       | N:M                    | Frequencia               | `TurmaFrequencia`                  | `TurmaFrequencia.TurmaID`, `TurmaFrequencia.FrequenciaID` |
| **Aluno**         | Matriculado em                    | N:1                    | Curso                    | Não é necessária                    | `Aluno.CursoID`                          |
|                   | Frequenta                         | N:M                    | Turma                    | `AlunoTurma`                        | `AlunoTurma.AlunoID`, `AlunoTurma.TurmaID` |
|                   | Matriculado em                    | N:M                    | Disciplina               | `AlunoDisciplina`                   | `AlunoDisciplina.AlunoID`, `AlunoDisciplina.DisciplinaID` |
|                   | Possui histórico de               | 1:N                    | HistoricoAluno           | Não é necessária                    | `HistoricoAluno.AlunoID`                 |
| **Nota**          | Associada a                       | N:1                    | Disciplina               | Não é necessária                    | `Nota.DisciplinaID`                      |
| **HistoricoAluno** | Relacionado a                   | N:1                    | Aluno                    | Não é necessária                    | `HistoricoAluno.AlunoID`                 |
|                   | Contém                           | N:M                    | Nota                     | `HistoricoNota`                    | `HistoricoNota.HistoricoID`, `HistoricoNota.NotaID` |
| **GradeNota**     | Relacionada                      | N:M                    | Aluno                    | `AlunoGradeNota`                    | `AlunoGradeNota.GradeNotaID`, `AlunoGradeNota.AlunoID` |
|                   | Relacionada                      | N:M                    | Disciplina               | `DisciplinaGradeNota`               | `DisciplinaGradeNota.GradeNotaID`, `DisciplinaGradeNota.DisciplinaID` |
| **GradePresenca** | Relacionada                      | N:M                    | Aluno                    | `AlunoGradePresenca`                | `AlunoGradePresenca.GradePresencaID`, `AlunoGradePresenca.AlunoID` |
|                   | Relacionada                      | N:M                    | Turma                    | `TurmaGradePresenca`                | `TurmaGradePresenca.GradePresencaID`, `TurmaGradePresenca.TurmaID` |
| **Matrícula**     | Relacionada                      | 1:1                    | Aluno                    | Não é necessária                    | `Aluno.MatriculaID`                      |
|                   | Relacionada                      | 1:1                    | Professor                | Não é necessária                    | `Professor.MatriculaID`                  |
| **Secretaria**    | Gerencia                         | 1:N                    | Departamento             | Não é necessária                    | `Secretaria.DepartamentoID`              |
|                   | Gerencia                         | 1:N                    | Matrícula                | Não é necessária                    | `Secretaria.MatriculaID`                 |
|                   | Conecta-se com                   | N:M                    | Aluno                    | `AlunoSecretaria`                   | `AlunoSecretaria.AlunoID`, `AlunoSecretaria.SecretariaID` |





DER BASE

![image](https://github.com/user-attachments/assets/7dc90a92-44c2-48e5-84d0-0786f21bbf0d)

DER CREATED

![image](https://github.com/user-attachments/assets/73dfcb79-c98e-4d14-b430-1762baf57aaa)



