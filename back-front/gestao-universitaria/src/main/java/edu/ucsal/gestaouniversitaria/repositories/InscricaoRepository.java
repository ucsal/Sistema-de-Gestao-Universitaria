package edu.ucsal.gestaouniversitaria.repositories;

import edu.ucsal.gestaouniversitaria.model.Inscricao;
import edu.ucsal.gestaouniversitaria.model.InscricaoId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InscricaoRepository extends JpaRepository<Inscricao, InscricaoId> {
}
