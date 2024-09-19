package edu.ucsal.gestaouniversitaria.controller;

import edu.ucsal.gestaouniversitaria.model.Disciplina;
import edu.ucsal.gestaouniversitaria.service.DisciplinaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/disciplinas")
public class DisciplinaController {

    private final DisciplinaService disciplinaService;

    @Autowired
    public DisciplinaController(DisciplinaService disciplinaService) {
        this.disciplinaService = disciplinaService;
    }

    @GetMapping
    public List<Disciplina> getDisciplinas() {
        return disciplinaService.getDisciplinas();
    }
}
