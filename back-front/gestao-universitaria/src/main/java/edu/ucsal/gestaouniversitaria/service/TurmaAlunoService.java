package edu.ucsal.gestaouniversitaria.service;

import edu.ucsal.gestaouniversitaria.model.TurmaAluno;
import edu.ucsal.gestaouniversitaria.repositories.TurmaAlunoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TurmaAlunoService {

    private final TurmaAlunoRepository turmaAlunoRepository;

    @Autowired
    public TurmaAlunoService(TurmaAlunoRepository turmaAlunoRepository) {
        this.turmaAlunoRepository = turmaAlunoRepository;
    }

    public List<TurmaAluno> getTurmaAlunos() {
        return turmaAlunoRepository.findAll();
    }
}
