package br.com.sptech.crud_pedidos.services;

import br.com.sptech.crud_pedidos.dtos.CreateProductRequestDTO;
import br.com.sptech.crud_pedidos.dtos.ProductResponseDTO;
import br.com.sptech.crud_pedidos.models.Product;
import br.com.sptech.crud_pedidos.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {

    private final ProductRepository productRepository;

    public ProductResponseDTO save(CreateProductRequestDTO data) {
        if (data.name().isBlank() || data.price().isNaN()) throw new RuntimeException("bad request data");

        Product product = new Product(data);

        Product productSaved = this.productRepository.save(product);

        return new ProductResponseDTO(productSaved.getId(), productSaved.getName(), productSaved.getPrice());
    }


    public ProductResponseDTO update(Long productId, CreateProductRequestDTO data) {
        if (data.name().isBlank() || data.price().isNaN()) throw new RuntimeException("bad request data");

        Product product = new Product(productId, data);

        Product productSaved = this.productRepository.save(product);

        return new ProductResponseDTO(productSaved.getId(), productSaved.getName(), productSaved.getPrice());
    }


    public void delete(Long productId) {
        Optional<Product> product = this.productRepository.findById(productId);

        if (product.isEmpty()) throw new RuntimeException("product not found");

        this.productRepository.delete(product.get());
    }

    public ProductResponseDTO get(Long productId) {
        Optional<Product> product = this.productRepository.findById(productId);

        if (product.isEmpty()) throw new RuntimeException("product not found");

        return new ProductResponseDTO(product.get().getId(), product.get().getName(), product.get().getPrice());
    }

    public List<ProductResponseDTO> findAll() {
        return this.productRepository.findAll().stream()
                .map(
                        product -> new ProductResponseDTO(product.getId(), product.getName(), product.getPrice())
                ).toList();
    }

}
