package br.com.sptech.crud_pedidos.controllers;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.sptech.crud_pedidos.dtos.CreateOrderRequestDTO;
import br.com.sptech.crud_pedidos.dtos.OrderResponseDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/api/v1/orders")
@RequiredArgsConstructor
@Log4j2
public class OrderController {

    @PostMapping
    public ResponseEntity<OrderResponseDTO> createOrder(@RequestBody CreateOrderRequestDTO request) {
        log.info("Creating order with description: " + request.clientId());

        OrderResponseDTO response = new OrderResponseDTO(1L, request.clientId());

        return ResponseEntity.ok(response);
    }

}
