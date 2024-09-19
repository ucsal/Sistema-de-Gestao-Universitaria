package edu.ucsal.gestaouniversitaria.controller;

import edu.ucsal.gestaouniversitaria.model.TurmaAluno;
import edu.ucsal.gestaouniversitaria.service.TurmaAlunoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/turma-alunos")
public class TurmaAlunoController {

    private final TurmaAlunoService turmaAlunoService;

    @Autowired
    public TurmaAlunoController(TurmaAlunoService turmaAlunoService) {
        this.turmaAlunoService = turmaAlunoService;
    }

    @GetMapping
    public List<TurmaAluno> getTurmaAlunos() {
        return turmaAlunoService.getTurmaAlunos();
    }
}
