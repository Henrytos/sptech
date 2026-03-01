package br.com.sptech.crud_pedidos.controllers;

import java.time.LocalDate;
import java.util.List;

public record CreateOrderRequestDTO(
        Long clientId,
        List<Long> productIds,
        LocalDate orderDate) {

}
