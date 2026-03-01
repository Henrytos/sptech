package br.com.sptech.crud_produtos.repositories;


import br.com.sptech.crud_produtos.models.Product;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class ProductRepository {
    private final List<Product> items = new ArrayList<>();

    public Product save(Product product) {
        if (product.getId() == null) {
            Product newProduct = new Product(
                    (long) (items.size() + 1),
                    product.getName(),
                    product.getPrice(),
                    product.getStatus()
            );

            items.add(newProduct);

            return newProduct;
        }
        Product productFind = this.items.get(product.getId().intValue() - 1);

        productFind.setName(product.getName());
        productFind.setPrice(product.getPrice());

        return productFind;
    }

    public Optional<Product> findById(Long productId) {
        return this.items.stream().filter(product -> product.getStatus() && product.getId().equals(productId)).findAny();
    }

    public void delete(Product product) {
        this.items.get((int) (product.getId() - 1)).setStatus(false);
    }

    public List<Product> findAll() {
        return this.items.stream().filter(Product::getStatus).toList();
    }
}
