package br.com.sptech.crud_produtos.controllers;

import br.com.sptech.crud_produtos.dtos.CreateProductRequestDTO;
import br.com.sptech.crud_produtos.dtos.ProductResponseDTO;
import br.com.sptech.crud_produtos.services.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping("/api/v1/products")
@RequiredArgsConstructor
@Slf4j
public class ProductController {

    private final ProductService productService;

    @GetMapping("/{productId}")
    public ResponseEntity<ProductResponseDTO> get(
            @PathVariable Long productId
    ) {
        ProductResponseDTO response = this.productService.get(productId);

        return ResponseEntity.ok(response);
    }

    @PostMapping
    public ResponseEntity<ProductResponseDTO> save(
            @RequestBody CreateProductRequestDTO request,
            UriComponentsBuilder uriComponentsBuilder
    ) {
        ProductResponseDTO response = this.productService.save(request);

        URI uri = uriComponentsBuilder.path("/api/v1/products/{productId}").buildAndExpand(response.id()).toUri();

        return ResponseEntity.created(uri).body(response);
    }


    @PutMapping("/{productId}")
    public ResponseEntity<ProductResponseDTO> update(
            @RequestBody CreateProductRequestDTO request,
            @PathVariable Long productId
    ) {
        ProductResponseDTO response = this.productService.update(productId, request);

        return ResponseEntity.ok(response);
    }


    @DeleteMapping("/{productId}")
    public ResponseEntity<Void> delete(
            @PathVariable Long productId
    ) {
        this.productService.delete(productId);

        return ResponseEntity.noContent().build();
    }
}
