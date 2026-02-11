package com.sptech.hello;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@OpenAPIDefinition(
		info = @Info(title = "Exemplo de api hello")
)
public class HelloApplication {

	public static void main(String[] args) {

		SpringApplication.run(HelloApplication.class, args);
	}

}
