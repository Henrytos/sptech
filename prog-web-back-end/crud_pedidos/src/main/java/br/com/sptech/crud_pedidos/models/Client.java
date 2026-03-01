package br.com.sptech.crud_pedidos.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Client {
    private Long id;
    private String name;
    private String email;


    public Client(String name, String email) {
        this.name = name;
        this.email = email;
    }
}
