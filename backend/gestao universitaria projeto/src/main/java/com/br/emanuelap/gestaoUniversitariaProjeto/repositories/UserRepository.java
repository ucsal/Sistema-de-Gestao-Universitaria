package com.br.emanuelap.gestaoUniversitariaProjeto.repositories;

import com.br.emanuelap.gestaoUniversitariaProjeto.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {


    Optional<User>findById(Long Integer);


}
