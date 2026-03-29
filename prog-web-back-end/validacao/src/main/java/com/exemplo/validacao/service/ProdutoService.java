package com.exemplo.validacao.service;

import com.exemplo.validacao.model.Produto;
import com.exemplo.validacao.repository.ProdutoRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProdutoService {

    private  final ProdutoRepository produtoRepository;

    public ProdutoService(ProdutoRepository produtoRepository) {
        this.produtoRepository = produtoRepository;
    }

    public Produto salvar (Produto produto){
        return this.produtoRepository.save(produto);
    }

    public List<Produto> listar (){
        return  this.produtoRepository.findAll();
    }

    public Produto buscarPorId(Long id){
        return this.produtoRepository.findById(id)
                .orElseThrow(RuntimeException::new);
    }

    public Produto atualizar(Produto produto){
        Produto existente = this.buscarPorId(produto.getId());
        existente.setNome(produto.getNome());
        existente.setQuantidade(produto.getQuantidade());
        existente.setPreco(produto.getPreco());

        return this.produtoRepository.save(produto);
    }

    public void deletar(Long id){
        this.produtoRepository.deleteById(id);
    }


}