# Sistema-de-Gestao-Universitaria

Tabela de entidade relacionamento
Vamos ajustar o diagrama de relacionamentos e a tabela de acordo com essas novas informações, garantindo que cada aluno e professor tenha sua matrícula, e que o histórico acadêmico de cada aluno seja corretamente registrado.

### Tabela de Relacionamentos com Matrículas e Histórico

| Entidade         | Relacionamento                    | Tipo de Relacionamento | Entidade Relacionada     | Tabela Associativa (se necessário)  | Chaves Estrangeiras                      |
|------------------|-----------------------------------|------------------------|--------------------------|-------------------------------------|------------------------------------------|
| **Departamento** | Gerencia                          | 1:N                    | Curso                    | Não é necessária                    | `Curso.DepartamentoID`                   |
|                  | Gerencia                          | 1:N                    | Disciplina               | Não é necessária                    | `Disciplina.DepartamentoID`              |
| **Curso**        | Pertence                          | N:1                    | Departamento             | Não é necessária                    | `Curso.DepartamentoID`                   |
|                  | Composto por                      | N:M                    | Disciplina               | `CursoDisciplina`                   | `CursoDisciplina.CursoID`, `CursoDisciplina.DisciplinaID` |
|                  | Composto por                      | 1:N                    | Turma                    | Não é necessária                    | `Turma.CursoID`                          |
| **Disciplina**   | Pertence                          | N:M                    | Curso                    | `CursoDisciplina`                   | `CursoDisciplina.CursoID`, `CursoDisciplina.DisciplinaID` |
|                  | Ministrada por                    | N:M                    | Professor                | `ProfessorDisciplina`               | `ProfessorDisciplina.ProfessorID`, `ProfessorDisciplina.DisciplinaID` |
|                  | Tem                               | 1:N                    | Turma                    | Não é necessária                    | `Turma.DisciplinaID`                     |
|                  | Pré-requisito para                | N:M                    | Disciplina (mesma entidade) | `DisciplinaPrerequisito`          | `DisciplinaPrerequisito.DisciplinaID`, `DisciplinaPrerequisito.PrerequisitoID` |
|                  | Associada a                       | N:M                    | GradeNota                | `DisciplinaGradeNota`               | `DisciplinaGradeNota.DisciplinaID`, `DisciplinaGradeNota.GradeNotaID` |
| **Turma**        | Associada                         | N:1                    | Disciplina               | Não é necessária                    | `Turma.DisciplinaID`                     |
|                  | Associada                         | N:1                    | Curso                    | Não é necessária                    | `Turma.CursoID`                          |
|                  | Contém                            | N:M                    | Aluno                    | `AlunoTurma`                        | `AlunoTurma.AlunoID`, `AlunoTurma.TurmaID` |
|                  | Ministrada por                    | N:M                    | Professor                | `ProfessorTurma`                    | `ProfessorTurma.ProfessorID`, `ProfessorTurma.TurmaID` |
|                  | Associada a                       | N:M                    | GradePresenca            | `TurmaGradePresenca`                | `TurmaGradePresenca.TurmaID`, `TurmaGradePresenca.GradePresencaID` |
| **Professor**    | Pertence                          | N:M                    | Departamento             | `DepartamentoProfessor`             | `DepartamentoProfessor.DepartamentoID`, `DepartamentoProfessor.ProfessorID` |
|                  | Leciona                           | N:M                    | Disciplina               | `ProfessorDisciplina`               | `ProfessorDisciplina.ProfessorID`, `ProfessorDisciplina.DisciplinaID` |
|                  | Leciona                           | N:M                    | Turma                    | `ProfessorTurma`                    | `ProfessorTurma.ProfessorID`, `ProfessorTurma.TurmaID` |
| **Aluno**        | Matriculado em                    | N:1                    | Curso                    | Não é necessária                    | `Aluno.CursoID`                          |
|                  | Frequenta                         | N:M                    | Turma                    | `AlunoTurma`                        | `AlunoTurma.AlunoID`, `AlunoTurma.TurmaID` |
|                  | Matriculado em                    | N:M                    | Disciplina               | `AlunoDisciplina`                   | `AlunoDisciplina.AlunoID`, `AlunoDisciplina.DisciplinaID` |
|                  | Possui histórico de               | 1:N                    | HistóricoAluno           | Não é necessária                    | `HistoricoAluno.AlunoID`                 |
|                  | Associado a                       | N:M                    | GradeNota                | `AlunoGradeNota`                    | `AlunoGradeNota.AlunoID`, `AlunoGradeNota.GradeNotaID` |
|                  | Associado a                       | N:M                    | GradePresenca            | `AlunoGradePresenca`                | `AlunoGradePresenca.AlunoID`, `AlunoGradePresenca.GradePresencaID` |
|                  | Identificado por                  | 1:1                    | Matrícula                | Não é necessária                    | `Aluno.MatriculaID`                      |
| **HistóricoAluno** | Relacionado a                  | N:1                    | Aluno                    | Não é necessária                    | `HistoricoAluno.AlunoID`                 |
|                  | Contém informações sobre          | N:M                    | Disciplina               | `HistoricoDisciplina`               | `HistoricoDisciplina.HistoricoID`, `HistoricoDisciplina.DisciplinaID` |
| **GradeNota**    | Relacionada                       | N:M                    | Aluno                    | `AlunoGradeNota`                    | `AlunoGradeNota.GradeNotaID`, `AlunoGradeNota.AlunoID` |
|                  | Relacionada                       | N:M                    | Disciplina               | `DisciplinaGradeNota`               | `DisciplinaGradeNota.GradeNotaID`, `DisciplinaGradeNota.DisciplinaID` |
| **GradePresenca** | Relacionada                      | N:M                    | Aluno                    | `AlunoGradePresenca`                | `AlunoGradePresenca.GradePresencaID`, `AlunoGradePresenca.AlunoID` |
|                  | Relacionada                       | N:M                    | Turma                    | `TurmaGradePresenca`                | `TurmaGradePresenca.GradePresencaID`, `TurmaGradePresenca.TurmaID` |
| **Matrícula**    | Relacionada                       | 1:1                    | Aluno                    | Não é necessária                    | `Aluno.MatriculaID`                      |
|                  | Relacionada                       | 1:1                    | Professor                | Não é necessária                    | `Professor.MatriculaID`                  |

