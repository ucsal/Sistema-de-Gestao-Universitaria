package edu.ucsal.gestaouniversitaria.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "tb_turma")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Turma {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_turma")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_disciplina", nullable = false)
    private Disciplina disciplina;

    @Column(name = "ano", nullable = false)
    private Integer ano;

    @Column(name = "semestre", nullable = false)
    private Integer semestre;
}
