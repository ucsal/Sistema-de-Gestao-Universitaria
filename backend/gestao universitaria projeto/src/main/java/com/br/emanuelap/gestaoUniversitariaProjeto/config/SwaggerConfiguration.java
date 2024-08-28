package com.br.emanuelap.gestaoUniversitariaProjeto.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfiguration {

    @Bean
    public OpenAPI openAPI() {
        Info info = new Info()
                .title("HLP APP")
                .version("1.0")
                .description("This is HLP api endpoint");
        return new OpenAPI().info(info);
    }

}
