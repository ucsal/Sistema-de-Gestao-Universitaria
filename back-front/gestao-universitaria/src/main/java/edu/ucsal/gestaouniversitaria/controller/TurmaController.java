package edu.ucsal.gestaouniversitaria.controller;

import edu.ucsal.gestaouniversitaria.model.Turma;
import edu.ucsal.gestaouniversitaria.service.TurmaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/turmas")
public class TurmaController {

    private final TurmaService turmaService;

    @Autowired
    public TurmaController(TurmaService turmaService) {
        this.turmaService = turmaService;
    }

    @GetMapping
    public List<Turma> getTurmas() {
        return turmaService.getTurmas();
    }
}
