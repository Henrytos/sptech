package br.com.sptech.crud_produtos.dtos;

public record CreateProductRequestDTO(
        String name,
        Double price
) {
}
