package br.com.sptech.crud_pedidos.controllers;

import br.com.sptech.crud_pedidos.dtos.ProductResponseDTO;
import br.com.sptech.crud_pedidos.services.ProductService;
import br.com.sptech.crud_pedidos.dtos.CreateProductRequestDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/api/v1/products")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping
    public ResponseEntity<List<ProductResponseDTO>> findAll() {
        List<ProductResponseDTO> response = this.productService.findAll();

        return ResponseEntity.ok(response);
    }

    @GetMapping("/{productId}")
    public ResponseEntity<ProductResponseDTO> get(
            @PathVariable Long productId) {
        ProductResponseDTO response = this.productService.get(productId);

        return ResponseEntity.ok(response);
    }

    @PostMapping
    public ResponseEntity<ProductResponseDTO> save(
            @RequestBody CreateProductRequestDTO request,
            UriComponentsBuilder uriComponentsBuilder) {
        ProductResponseDTO response = this.productService.save(request);

        URI uri = uriComponentsBuilder.path("/api/v1/products/{productId}").buildAndExpand(response.id()).toUri();

        return ResponseEntity.created(uri).body(response);
    }

    @PutMapping("/{productId}")
    public ResponseEntity<ProductResponseDTO> update(
            @RequestBody CreateProductRequestDTO request,
            @PathVariable Long productId) {
        ProductResponseDTO response = this.productService.update(productId, request);

        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/{productId}")
    public ResponseEntity<Void> delete(
            @PathVariable Long productId) {
        this.productService.delete(productId);

        return ResponseEntity.noContent().build();
    }
}
