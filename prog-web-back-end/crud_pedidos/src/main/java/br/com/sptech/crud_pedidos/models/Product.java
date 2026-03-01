package br.com.sptech.crud_pedidos.models;

import br.com.sptech.crud_pedidos.dtos.CreateProductRequestDTO;

public class Product {

    private Long id;

    private String name;

    private Double price;

    private Boolean status = true; // deletion logic

    public Product(String name, Double price) {
        this.name = name;
        this.price = price;
    }

    public Product(String name, Double price, Boolean status) {
        this(name, price);
        this.status = status;
    }

    public Product(Long id, String name, Double price, Boolean status) {
        this(name, price);
        this.id = id;
        this.status = status;
    }

    public Product(CreateProductRequestDTO data) {
        this(data.name(), data.price());
    }

    public Product(Long productId, CreateProductRequestDTO data) {
        this(data);
        this.id = productId;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Double getPrice() {
        return price;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
}
