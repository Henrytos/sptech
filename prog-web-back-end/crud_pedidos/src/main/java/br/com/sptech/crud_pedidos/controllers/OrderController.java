package br.com.sptech.crud_pedidos.controllers;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.sptech.crud_pedidos.dtos.CreateOrderRequestDTO;
import br.com.sptech.crud_pedidos.dtos.OrderResponseDTO;
import br.com.sptech.crud_pedidos.services.OrderService;

@RestController
@RequestMapping("/api/v1/orders")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping
    public ResponseEntity<OrderResponseDTO> createOrder(@RequestBody CreateOrderRequestDTO request) {

        OrderResponseDTO response = this.orderService.createOrder(request);

        return ResponseEntity.ok(response);

    }

    @GetMapping("/clients/{clientId}")
    public ResponseEntity<List<OrderResponseDTO>> getAllOrdersByClientId(@PathVariable Long clientId) {
        return ResponseEntity.ok(this.orderService.findAll(clientId));
    }

    @GetMapping("/{orderId}")
    public ResponseEntity<OrderResponseDTO> getOrder(@PathVariable Long orderId) {
        OrderResponseDTO response = this.orderService.get(orderId);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/calculate-total/{orderId}")
    public ResponseEntity<Double> calculateTotal(@PathVariable Long orderId) {
        Double total = this.orderService.getTotalValue(orderId);
        return ResponseEntity.ok(total);
    }

}
