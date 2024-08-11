# Sistema-de-Gestao-Universitaria


### Tabela de Relacionamentos com Secretaria

| Entidade          | Relacionamento                    | Tipo de Relacionamento | Entidade Relacionada     | Tabela Associativa (se necessário)  | Chaves Estrangeiras                      |
|-------------------|-----------------------------------|------------------------|--------------------------|-------------------------------------|------------------------------------------|
| **Departamento**  | Gerencia                          | 1:N                    | Professor                | Não é necessária                    | `Professor.DepartamentoID`               |
|                   | Gerencia                          | 1:N                    | Disciplina               | Não é necessária                    | `Disciplina.DepartamentoID`              |
|                   | Gerencia                          | 1:N                    | Curso                    | Não é necessária                    | `Curso.DepartamentoID`                   |
| **Curso**         | Pertence                          | N:1                    | Departamento             | Não é necessária                    | `Curso.DepartamentoID`                   |
|                   | Composto por                      | N:M                    | Disciplina               | `CursoDisciplina`                   | `CursoDisciplina.CursoID`, `CursoDisciplina.DisciplinaID` |
| **Disciplina**    | Pertence                          | N:1                    | Departamento             | Não é necessária                    | `Disciplina.DepartamentoID`              |
|                   | Ministrada por                    | N:M                    | Professor                | `ProfessorDisciplina`               | `ProfessorDisciplina.ProfessorID`, `ProfessorDisciplina.DisciplinaID` |
|                   | Pré-requisito para                | N:M                    | Disciplina (mesma entidade) | `DisciplinaPrerequisito`          | `DisciplinaPrerequisito.DisciplinaID`, `DisciplinaPrerequisito.PrerequisitoID` |
|                   | Associada a                       | N:M                    | GradeNota                | `DisciplinaGradeNota`               | `DisciplinaGradeNota.DisciplinaID`, `DisciplinaGradeNota.GradeNotaID` |
| **Professor**     | Pertence                          | N:1                    | Departamento             | Não é necessária                    | `Professor.DepartamentoID`               |
|                   | Leciona                           | N:M                    | Disciplina               | `ProfessorDisciplina`               | `ProfessorDisciplina.ProfessorID`, `ProfessorDisciplina.DisciplinaID` |
|                   | Leciona                           | N:M                    | Turma                    | `ProfessorTurma`                    | `ProfessorTurma.ProfessorID`, `ProfessorTurma.TurmaID` |
| **Turma**         | Associada                         | N:1                    | Disciplina               | Não é necessária                    | `Turma.DisciplinaID`                     |
|                   | Associada                         | N:1                    | Curso                    | Não é necessária                    | `Turma.CursoID`                          |
|                   | Contém                            | N:M                    | Aluno                    | `AlunoTurma`                        | `AlunoTurma.AlunoID`, `AlunoTurma.TurmaID` |
|                   | Associada a                       | N:M                    | GradePresenca            | `TurmaGradePresenca`                | `TurmaGradePresenca.TurmaID`, `TurmaGradePresenca.GradePresencaID` |
| **Aluno**         | Matriculado em                    | N:1                    | Curso                    | Não é necessária                    | `Aluno.CursoID`                          |
|                   | Frequenta                         | N:M                    | Turma                    | `AlunoTurma`                        | `AlunoTurma.AlunoID`, `AlunoTurma.TurmaID` |
|                   | Matriculado em                    | N:M                    | Disciplina               | `AlunoDisciplina`                   | `AlunoDisciplina.AlunoID`, `AlunoDisciplina.DisciplinaID` |
|                   | Possui histórico de               | 1:N                    | HistóricoAluno           | Não é necessária                    | `HistoricoAluno.AlunoID`                 |
|                   | Associado a                       | N:M                    | GradeNota                | `AlunoGradeNota`                    | `AlunoGradeNota.AlunoID`, `AlunoGradeNota.GradeNotaID` |
|                   | Associado a                       | N:M                    | GradePresenca            | `AlunoGradePresenca`                | `AlunoGradePresenca.AlunoID`, `AlunoGradePresenca.GradePresencaID` |
|                   | Identificado por                  | 1:1                    | Matrícula                | Não é necessária                    | `Aluno.MatriculaID`                      |
|                   | Conecta-se com                   | N:1                    | Secretaria               | Não é necessária                    | `Aluno.SecretariaID`                     |
| **HistóricoAluno** | Relacionado a                   | N:1                    | Aluno                    | Não é necessária                    | `HistoricoAluno.AlunoID`                 |
| **GradeNota**     | Relacionada                      | N:M                    | Aluno                    | `AlunoGradeNota`                    | `AlunoGradeNota.GradeNotaID`, `AlunoGradeNota.AlunoID` |
|                   | Relacionada                      | N:M                    | Disciplina               | `DisciplinaGradeNota`               | `DisciplinaGradeNota.GradeNotaID`, `DisciplinaGradeNota.DisciplinaID` |
| **GradePresenca** | Relacionada                      | N:M                    | Aluno                    | `AlunoGradePresenca`                | `AlunoGradePresenca.GradePresencaID`, `AlunoGradePresenca.AlunoID` |
|                   | Relacionada                      | N:M                    | Turma                    | `TurmaGradePresenca`                | `TurmaGradePresenca.GradePresencaID`, `TurmaGradePresenca.TurmaID` |
| **Matrícula**     | Relacionada                      | 1:1                    | Aluno                    | Não é necessária                    | `Aluno.MatriculaID`                      |
|                   | Relacionada                      | 1:1                    | Professor                | Não é necessária                    | `Professor.MatriculaID`                  |
| **Secretaria**    | Gerencia                         | 1:N                    | Departamento             | Não é necessária                    | `Secretaria.DepartamentoID`              |
|                   | Gerencia                         | 1:N                    | Matrícula                | Não é necessária                    | `Secretaria.MatriculaID`                 |
|                   | Conecta-se com                   | N:M                    | Aluno                    | `AlunoSecretaria`                   | `AlunoSecretaria.AlunoID`, `AlunoSecretaria.SecretariaID` |

### Explicações Adicionais:

1. **Secretaria**:
   - A secretaria gerencia os **Departamentos** e as **Matrículas**. Isso garante que todos os processos administrativos estejam centralizados.
   - Cada **Aluno** tem uma conexão com a secretaria, que pode incluir a gestão de pagamentos.

2. **Alunos e Secretaria**:
   - A relação entre **Alunos** e **Secretaria** pode ser usada para registrar informações sobre pagamentos, comunicação e outras interações administrativas.

3. **Matrículas**:
   - A matrícula é gerenciada pela secretaria, garantindo que todos os processos de matrícula sejam centralizados.

Com essas adições, o modelo do sistema fica mais robusto e pronto para gerenciar as operações da secretaria, além de facilitar a conexão com os alunos. Se precisar de mais detalhes ou ajustes, é só avisar!
