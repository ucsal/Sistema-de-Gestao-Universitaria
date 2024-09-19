package edu.ucsal.gestaouniversitaria.service;

import edu.ucsal.gestaouniversitaria.model.Aluno;
import edu.ucsal.gestaouniversitaria.repositories.AlunoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AlunoService {

    private AlunoRepository alunoRepository;

    @Autowired
    public AlunoService(AlunoRepository alunoRepository) {
        this.alunoRepository = alunoRepository;
    }

    public List<Aluno> getAlunos() {
        return alunoRepository.findAll();
    }
}
