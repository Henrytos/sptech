package br.com.sptech.crud_pedidos.models;

import java.time.LocalDate;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Order {

    private Long id;
    private Client client;
    private List<Product> products;
    private LocalDate orderDate;

    public Order(Client client, List<Product> products) {
        this.client = client;
        this.products = products;
        this.orderDate = LocalDate.now();
    }

    public Order(Client client, List<Product> products, LocalDate orderDate) {
        this.client = client;
        this.products = products;
        this.orderDate = orderDate;
    }

}
