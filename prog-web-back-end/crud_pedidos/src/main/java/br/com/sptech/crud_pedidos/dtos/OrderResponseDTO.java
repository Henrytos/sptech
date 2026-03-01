package br.com.sptech.crud_pedidos.dtos;

import java.time.LocalDate;
import java.util.List;

public record OrderResponseDTO(
        Long id,
        ClientResponseDTO client,
        List<ProductResponseDTO> products,
        LocalDate orderDate) {

}
