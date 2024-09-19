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
public class TurmaAlunoId implements Serializable {

    @Column(name = "id_turma")
    private Long idTurma;

    @Column(name = "id_aluno")
    private Long idAluno;
}
