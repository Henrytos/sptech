package br.com.sptech.crud_pedidos.repositories;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Repository;

import br.com.sptech.crud_pedidos.models.Order;

@Repository
public class OrderRepository {

    private final List<Order> items = new ArrayList<>();

    public Order save(Order order) {
        if (order.getId() == null) {
            Order newOrder = new Order(
                    (long) (items.size() + 1),
                    order.getClient(),
                    order.getProducts(),
                    order.getOrderDate());

            items.add(newOrder);

            return newOrder;
        }
        Order orderFind = this.items.get(order.getId().intValue() - 1);

        orderFind.setClient(order.getClient());
        orderFind.setProducts(order.getProducts());
        orderFind.setOrderDate(order.getOrderDate());

        return orderFind;
    }

    public Optional<Order> findById(Long orderId) {
        return this.items.stream().filter(order -> order.getId().equals(orderId)).findAny();
    }

    public void delete(Order order) {
        this.items.remove(order);
    }

    public List<Order> findAll() {
        return this.items;
    }

    public List<Order> findAllByClientId(Long clientId) {
        return this.items.stream().filter(order -> order.getClient().getId().equals(clientId)).toList();
    }
}
