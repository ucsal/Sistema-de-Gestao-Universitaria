package edu.ucsal.gestaouniversitaria.repositories;

import edu.ucsal.gestaouniversitaria.model.Turma;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TurmaRepository extends JpaRepository<Turma, Long> {
}
