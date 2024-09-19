package edu.ucsal.gestaouniversitaria.service;

import edu.ucsal.gestaouniversitaria.model.Disciplina;
import edu.ucsal.gestaouniversitaria.repositories.DisciplinaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DisciplinaService {

    private final DisciplinaRepository disciplinaRepository;

    @Autowired
    public DisciplinaService(DisciplinaRepository disciplinaRepository) {
        this.disciplinaRepository = disciplinaRepository;
    }

    public List<Disciplina> getDisciplinas() {
        return disciplinaRepository.findAll();
    }
}
