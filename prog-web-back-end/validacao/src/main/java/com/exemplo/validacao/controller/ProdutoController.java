package com.exemplo.validacao.controller;

import com.exemplo.validacao.model.Produto;
import com.exemplo.validacao.service.ProdutoService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/produtos")
public class ProdutoController {

    private final ProdutoService produtoService;


    public ProdutoController(ProdutoService produtoService) {
        this.produtoService = produtoService;
    }

    @PostMapping
    public ResponseEntity<Produto> criar(@Valid @RequestBody Produto produto, UriComponentsBuilder builder) {
        Produto novo = produtoService.salvar(produto);

        URI uri = builder.path("/produtos/{id}").buildAndExpand(novo.getId()).toUri();

        return ResponseEntity.created(uri).body(novo);
    }

    @GetMapping
    public ResponseEntity<List<Produto>> listar() {
        return ResponseEntity.ok(this.produtoService.listar());
    }


    @GetMapping("/{id}")
    public ResponseEntity<Produto> buscar(@PathVariable Long id) {
        return ResponseEntity.ok(this.produtoService.buscarPorId(id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Long id){
        this.produtoService.deletar(id);

        return ResponseEntity.noContent().build();
    }

}
