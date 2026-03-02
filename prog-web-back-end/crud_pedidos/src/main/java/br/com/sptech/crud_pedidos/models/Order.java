package br.com.sptech.crud_pedidos.models;

import java.time.LocalDate;
import java.util.List;

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

    public Order(Long id, Client client, List<Product> products, LocalDate orderDate) {
        this.id = id;
        this.client = client;
        this.products = products;
        this.orderDate = orderDate;
    }

    public Long getId() {
        return id;
    }

    public Client getClient() {
        return client;
    }

    public List<Product> getProducts() {
        return products;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

}
