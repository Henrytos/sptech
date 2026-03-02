package br.com.sptech.crud_pedidos.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import br.com.sptech.crud_pedidos.dtos.ClientResponseDTO;
import br.com.sptech.crud_pedidos.dtos.CreateOrderRequestDTO;
import br.com.sptech.crud_pedidos.dtos.OrderResponseDTO;
import br.com.sptech.crud_pedidos.dtos.ProductResponseDTO;
import br.com.sptech.crud_pedidos.models.Client;
import br.com.sptech.crud_pedidos.models.Order;
import br.com.sptech.crud_pedidos.models.Product;
import br.com.sptech.crud_pedidos.repositories.ClientRepository;
import br.com.sptech.crud_pedidos.repositories.OrderRepository;
import br.com.sptech.crud_pedidos.repositories.ProductRepository;

@Service
public class OrderService {

        private final ClientRepository clientRepository;

        private final OrderRepository orderRepository;

        private final ProductRepository productRepository;

        public OrderService(ClientRepository clientRepository, OrderRepository orderRepository,
                        ProductRepository productRepository) {
                this.clientRepository = clientRepository;
                this.orderRepository = orderRepository;
                this.productRepository = productRepository;
        }

        public OrderResponseDTO createOrder(CreateOrderRequestDTO data) {

                Optional<Client> client = this.clientRepository.findById(data.clientId());

                if (client.isEmpty()) {
                        throw new RuntimeException("Client not found");
                }

                List<Product> products = data.productIds().stream().map(productId -> {
                        return this.productRepository.findById(productId).get();
                }).toList();

                Order order = new Order(client.get(), products);

                order = this.orderRepository.save(order);

                return new OrderResponseDTO(
                                order.getId(),
                                new ClientResponseDTO(order.getClient().getId(), order.getClient().getName(),
                                                order.getClient().getEmail()),
                                order.getProducts().stream()
                                                .map(product -> new ProductResponseDTO(product.getId(),
                                                                product.getName(),
                                                                product.getPrice()))
                                                .toList(),
                                order.getOrderDate());
        }

        public OrderResponseDTO get(Long orderId) {
                Optional<Order> order = this.orderRepository.findById(orderId);

                if (order.isEmpty()) {
                        throw new RuntimeException("Order not found");
                }

                return new OrderResponseDTO(
                                order.get().getId(),
                                new ClientResponseDTO(order.get().getClient().getId(),
                                                order.get().getClient().getName(),
                                                order.get().getClient().getEmail()),
                                order.get().getProducts().stream()
                                                .map(product -> new ProductResponseDTO(product.getId(),
                                                                product.getName(),
                                                                product.getPrice()))
                                                .toList(),
                                order.get().getOrderDate());
        }

        public List<OrderResponseDTO> findAll(Long clientId) {
                return this.orderRepository.findAllByClientId(clientId).stream().map(order -> new OrderResponseDTO(
                                order.getId(),
                                new ClientResponseDTO(order.getClient().getId(), order.getClient().getName(),
                                                order.getClient().getEmail()),
                                order.getProducts().stream()
                                                .map(product -> new ProductResponseDTO(product.getId(),
                                                                product.getName(),
                                                                product.getPrice()))
                                                .toList(),
                                order.getOrderDate())).toList();
        }

        public Double getTotalValue(Long orderId) {
                Optional<Order> order = this.orderRepository.findById(orderId);

                if (order.isEmpty()) {
                        throw new RuntimeException("Order not found");
                }

                return order.get().getProducts().stream().mapToDouble(Product::getPrice).sum();
        }
}
