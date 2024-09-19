package edu.ucsal.gestaouniversitaria.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Table(name = "tb_inscricao")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Inscricao {

    @EmbeddedId
    private InscricaoId id;

    @ManyToOne
    @MapsId("idAluno")
    @JoinColumn(name = "id_aluno", nullable = false)
    private Aluno aluno;

    @ManyToOne
    @MapsId("idDisciplina")
    @JoinColumn(name = "id_disciplina", nullable = false)
    private Disciplina disciplina;

    @Column(name = "data_inscricao", nullable = false)
    private LocalDate dataInscricao;
}

