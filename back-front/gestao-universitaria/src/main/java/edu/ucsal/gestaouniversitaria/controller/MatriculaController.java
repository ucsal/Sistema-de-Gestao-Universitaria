package edu.ucsal.gestaouniversitaria.controller;

import edu.ucsal.gestaouniversitaria.model.Matricula;
import edu.ucsal.gestaouniversitaria.service.MatriculaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/matriculas")
public class MatriculaController {

    private final MatriculaService matriculaService;

    @Autowired
    public MatriculaController(MatriculaService matriculaService) {
        this.matriculaService = matriculaService;
    }

    @GetMapping
    public List<Matricula> getMatriculas() {
        return matriculaService.getMatriculas();
    }
}
