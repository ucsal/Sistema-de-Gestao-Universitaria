package edu.ucsal.gestaouniversitaria.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Table(name = "tb_matricula")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Matricula {

    @EmbeddedId
    private MatriculaId id;

    @ManyToOne
    @MapsId("idAluno")
    @JoinColumn(name = "id_aluno", nullable = false)
    private Aluno aluno;

    @ManyToOne
    @MapsId("idCurso")
    @JoinColumn(name = "id_curso", nullable = false)
    private Curso curso;

    @Column(name = "data_matricula", nullable = false)
    private LocalDate dataMatricula;
}

