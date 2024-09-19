package edu.ucsal.gestaouniversitaria.controller;

import edu.ucsal.gestaouniversitaria.model.Inscricao;
import edu.ucsal.gestaouniversitaria.service.InscricaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/inscricoes")
public class InscricaoController {

    private final InscricaoService inscricaoService;

    @Autowired
    public InscricaoController(InscricaoService inscricaoService) {
        this.inscricaoService = inscricaoService;
    }

    @GetMapping
    public List<Inscricao> getInscricoes() {
        return inscricaoService.getInscricoes();
    }
}
