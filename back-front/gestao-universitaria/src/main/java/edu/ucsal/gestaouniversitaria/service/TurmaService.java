package edu.ucsal.gestaouniversitaria.service;

import edu.ucsal.gestaouniversitaria.model.Turma;
import edu.ucsal.gestaouniversitaria.repositories.TurmaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TurmaService {

    private final TurmaRepository turmaRepository;

    @Autowired
    public TurmaService(TurmaRepository turmaRepository) {
        this.turmaRepository = turmaRepository;
    }

    public List<Turma> getTurmas() {
        return turmaRepository.findAll();
    }
}
