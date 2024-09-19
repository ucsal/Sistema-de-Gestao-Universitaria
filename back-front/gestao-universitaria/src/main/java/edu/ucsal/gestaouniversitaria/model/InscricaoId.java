package edu.ucsal.gestaouniversitaria.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Embeddable
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class InscricaoId implements Serializable {

    @Column(name = "id_aluno")
    private Long idAluno;

    @Column(name = "id_disciplina")
    private Long idDisciplina;
}
