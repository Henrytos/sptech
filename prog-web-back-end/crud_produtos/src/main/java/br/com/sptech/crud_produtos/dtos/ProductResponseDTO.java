package br.com.sptech.crud_produtos.dtos;

public record ProductResponseDTO(
        Long id,
        String name,
        Double price
) {
}
