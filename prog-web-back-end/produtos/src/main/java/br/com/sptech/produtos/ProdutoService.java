package br.com.sptech.produtos;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProdutoService {

    private final ProdutoRepository produtoRepository;


    public ProdutoService(ProdutoRepository produtoRepository) {
        this.produtoRepository = produtoRepository;
    }

    public List<Produto> listarTodos() {
        return this.produtoRepository.findAll();
    }

    public Optional<Produto> buscarPorId(Long id) {
        return this.produtoRepository.findById(id);
    }

    public Optional<Produto> salvar(Produto produto) {

        Optional<Produto> produtoExistente = this.produtoRepository.findById(produto.getId());

        if (produtoExistente.isEmpty()) {
            return Optional.empty();
        }

        Produto produtoAtualizado = produtoExistente.get();

        produtoAtualizado.setId(produto.getId());
        produtoAtualizado.setNome(produto.getNome());
        produtoAtualizado.setPreco(produto.getPreco());
        produtoAtualizado.setQuantidade(produto.getQuantidade());

        return Optional.of(this.produtoRepository.save(produtoAtualizado));
    }

    public boolean deletar(Long id){
        if(produtoRepository.existsById(id)){
            produtoRepository.deleteById(id);
            return true;
        }

        return false;
    }

}
