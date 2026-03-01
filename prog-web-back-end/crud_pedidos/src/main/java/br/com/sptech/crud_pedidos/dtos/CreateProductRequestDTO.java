package br.com.sptech.crud_pedidos.dtos;

public record CreateProductRequestDTO(
        String name,
        Double price
) {
}
