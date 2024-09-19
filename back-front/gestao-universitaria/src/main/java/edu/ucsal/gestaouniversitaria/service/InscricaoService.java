package edu.ucsal.gestaouniversitaria.service;

import edu.ucsal.gestaouniversitaria.model.Inscricao;
import edu.ucsal.gestaouniversitaria.repositories.InscricaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InscricaoService {

    private final InscricaoRepository inscricaoRepository;

    @Autowired
    public InscricaoService(InscricaoRepository inscricaoRepository) {
        this.inscricaoRepository = inscricaoRepository;
    }

    public List<Inscricao> getInscricoes() {
        return inscricaoRepository.findAll();
    }
}
