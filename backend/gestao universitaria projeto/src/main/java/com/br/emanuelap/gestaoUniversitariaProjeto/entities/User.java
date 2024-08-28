package com.br.emanuelap.gestaoUniversitariaProjeto.entities;


import com.br.emanuelap.gestaoUniversitariaProjeto.enums.Role;
import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@Entity
@Data
@EqualsAndHashCode(callSuper = true)
@Table(name = "user")
public class User extends Renter {
    private String password;
    private Role role;
    private Date dateOfBirth;
    private String cpf;

}
