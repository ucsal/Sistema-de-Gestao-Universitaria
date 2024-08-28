package com.br.emanuelap.gestaoUniversitariaProjeto.dtos;


import com.br.emanuelap.gestaoUniversitariaProjeto.enums.Role;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.util.Date;

@Data
@RequiredArgsConstructor
@SuperBuilder
public class UserDto  {

// i think ik dont will need a personDTO
    private Integer id;
    private String email;
    private Role role;
    private String token;
    private Date dateOfBirth;
    private String cpf;
    private String name;

}
