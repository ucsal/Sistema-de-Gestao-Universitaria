package edu.ucsal.gestaouniversitaria.repositories;

import edu.ucsal.gestaouniversitaria.model.Aluno;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AlunoRepository extends JpaRepository<Aluno, Long> {
}
