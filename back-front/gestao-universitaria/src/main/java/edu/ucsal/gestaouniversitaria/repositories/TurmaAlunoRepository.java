package edu.ucsal.gestaouniversitaria.repositories;

import edu.ucsal.gestaouniversitaria.model.TurmaAluno;
import edu.ucsal.gestaouniversitaria.model.TurmaAlunoId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TurmaAlunoRepository extends JpaRepository<TurmaAluno, TurmaAlunoId> {
}
