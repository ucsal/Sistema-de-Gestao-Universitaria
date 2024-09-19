package edu.ucsal.gestaouniversitaria.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Entity
@Table(name = "tb_turma_aluno")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TurmaAluno {

    @EmbeddedId
    private TurmaAlunoId id;

    @ManyToOne
    @MapsId("idTurma")
    @JoinColumn(name = "id_turma", nullable = false)
    private Turma turma;

    @ManyToOne
    @MapsId("idAluno")
    @JoinColumn(name = "id_aluno", nullable = false)
    private Aluno aluno;

    @Column(name = "status", length = 50)
    private String status;
}

