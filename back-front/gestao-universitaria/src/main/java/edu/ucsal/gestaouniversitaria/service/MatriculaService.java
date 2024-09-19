package edu.ucsal.gestaouniversitaria.service;

import edu.ucsal.gestaouniversitaria.model.Matricula;
import edu.ucsal.gestaouniversitaria.repositories.MatriculaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MatriculaService {

    private final MatriculaRepository matriculaRepository;

    @Autowired
    public MatriculaService(MatriculaRepository matriculaRepository) {
        this.matriculaRepository = matriculaRepository;
    }

    public List<Matricula> getMatriculas() {
        return matriculaRepository.findAll();
    }
}
