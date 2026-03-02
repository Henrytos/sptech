package br.com.sptech.crud_pedidos.dtos;

public record CreateClientRequestDTO(
        String name,
        String email) {

    @Override
    public String toString() {
        return "CreateClientRequestDTO{" +
                "name='" + name + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
