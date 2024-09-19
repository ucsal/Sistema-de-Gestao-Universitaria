package edu.ucsal.gestaouniversitaria.repositories;

import edu.ucsal.gestaouniversitaria.model.Matricula;
import edu.ucsal.gestaouniversitaria.model.MatriculaId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MatriculaRepository extends JpaRepository<Matricula, MatriculaId> {
}
