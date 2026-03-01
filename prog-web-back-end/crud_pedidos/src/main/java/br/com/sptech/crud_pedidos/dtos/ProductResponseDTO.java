package br.com.sptech.crud_pedidos.dtos;

public record ProductResponseDTO(
        Long id,
        String name,
        Double price
) {
}
