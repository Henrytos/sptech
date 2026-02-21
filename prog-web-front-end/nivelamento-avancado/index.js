// 1.(Lista de Compras) Crie um programa o qual:

// a) Solicite o nome do item e a quantidade que será comprada;

const listaDeCompras = [];

// b) Ao clicar em "Adicionar à lista", armazene o item em um vetor e exiba "99x de NOME_DO_PRODUTO adicionado com sucesso!", abaixo do botão;

function cadastrarItem(nome = "", quantidade = 0) {
    if (nome === "" || quantidade <= 0) {
        console.log("Preencha os campos corretamente!");
        return;
    }

    const item = {
        nome,
        quantidade
    };

    listaDeCompras.push(item);
    console.log(`${quantidade}x de ${nome} adicionado com sucesso!`);
}



// c) Ao clicar em "Exibir lista", mostre todos os itens cadastrados com suas quantidades, um abaixo do outro.

//     OBS: use o forEach() para percorrer a lista.

function exibirLista() {
    console.log("Lista de Compras:");
    listaDeCompras.forEach((item, index) => {
        console.log(`${index + 1}. ${item.quantidade}x de ${item.nome}`);
    });

}

cadastrarItem("Leite", 2);
cadastrarItem("Pão", 5);
cadastrarItem("Ovos", 12);

exibirLista();

console.log("-----------------------------------------------------------------------------------")


// 2.(Cadastro de Livros) Crie um programa o qual:

const livros = [];

// a) O usuário informa o título do livro e o autor;

// b) Ao clicar em "Cadastrar", o livro deve ser adicionado a um vetor de objetos e exibir "NOME_LIVRO cadstrado com sucesso!", abaixo do botão;


function cadastrarLivro(titulo = "", autor = "") {
    if (titulo === "" || autor === "") {
        console.log("Preencha os campos corretamente!");
        return;
    }

    const livro = {
        titulo,
        autor
    };
    livros.push(livro);

    console.log(`${titulo} cadastrado com sucesso!`);
}



// c) Ao clicar em "Exibir livros", liste todos os livros cadastrados.

function exibirLivros() {
    console.log("Livros Cadastrados:");
    livros.forEach((livro, index) => {
        console.log(`${index + 1}. ${livro.titulo} - ${livro.autor}`);
    });
}

//     OBS: use push() e forEach().
cadastrarLivro("Dom Casmurro", "Machado de Assis");
cadastrarLivro("O Alquimista", "Paulo Coelho");
cadastrarLivro("1984", "George Orwell");

exibirLivros();


console.log("-----------------------------------------------------------------------------------")

// 3.(Ranking de Jogos) Crie um programa o qual:

const listaDeJogos = [];

// a) O usuário informa o nome do jogo e a pontuação;

// b) Ao clicar em "Adicionar", cadastre no vetor;

function cadastrarJogo(nome = "", pontuacao = 0) {
    if (nome === "" || pontuacao < 0) {
        console.log("Preencha os campos corretamente!");
        return;
    }

    const jogo = {
        nome,
        pontuacao
    };
    listaDeJogos.push(jogo);

    console.log(`${nome} adicionado com sucesso!`);
}

// c) Ao clicar em "Mostrar ranking", exiba os jogos ordenados da maior para a menor pontuação;

// d) Mostre o jogo com maior pontuação.

//     OBS: use push(), sort() e at().

function mostrarRanking() {
    const ranking = listaDeJogos.sort((a, b) => b.pontuacao - a.pontuacao);
    console.log("Ranking de Jogos:");
    ranking.forEach((jogo, index) => {
        console.log(`${index + 1}. ${jogo.nome} - ${jogo.pontuacao} pontos`);
    });

    const jogoMaisPontuado = ranking.at(0);
    if (jogoMaisPontuado) {
        console.log(`O jogo com maior pontuação é: ${jogoMaisPontuado.nome} com ${jogoMaisPontuado.pontuacao} pontos.`);
    }
}

cadastrarJogo("The Legend of Zelda: Breath of the Wild", 95);
cadastrarJogo("Red Dead Redemption 2", 97);
cadastrarJogo("The Witcher 3: Wild Hunt", 93);

mostrarRanking();

console.log("-----------------------------------------------------------------------------------")


// 4.(Controle de Estoque) Crie um programa o qual:

// a) O usuário informa o produto e a quantidade em estoque;

// b) Ao clicar em "Adicionar produto", armazene em um vetor;

const listaDeProdutosNoEstoque = [];

function cadastrarProdutoNoEstoque(nome = "", quantidade = 0) {
    if (nome === "" || quantidade < 0) {
        console.log("Preencha os campos corretamente!");
        return;
    }

    const produto = {
        nome,
        quantidade
    };
    listaDeProdutosNoEstoque.push(produto);

    console.log(`${nome} adicionado com sucesso!`);
}

// c) Permita filtrar produtos com quantidade menor que um valor informado pelo usuário;

// d) Exiba os produtos filtrados em uma lista.

//     OBS: use push(), filter() e forEach().

function filtrarProdutosNoEstoque(quantidadeLimite = 0) {

    if (quantidadeLimite < 0) {
        console.log("Preencha o campo corretamente!");
        return;
    }

    const produtosFiltrados = listaDeProdutosNoEstoque.filter(produto => produto.quantidade < quantidadeLimite);

    console.log(`Produtos com quantidade menor que ${quantidadeLimite}:`);
    produtosFiltrados.forEach((produto, index) => {
        console.log(`${index + 1}. ${produto.nome} - ${produto.quantidade} em estoque`);
    });
}

cadastrarProdutoNoEstoque("Camiseta", 50);
cadastrarProdutoNoEstoque("Calça Jeans", 20);
cadastrarProdutoNoEstoque("Tênis", 10);
cadastrarProdutoNoEstoque("Boné", 100);
cadastrarProdutoNoEstoque("Jaqueta", 5);

filtrarProdutosNoEstoque(30);


console.log("-----------------------------------------------------------------------------------")

// 5.(Lista de Exercícios Físicos) Crie um programa o qual:
const listaDeExercicios = [];

// a) O usuário informa o nome do exercício e a quantidade de repetições;

// b) Ao clicar em "Adicionar", adicione no vetor;

function cadastrarExercicio(nome = "", repeticoes = 0) {
    if (nome === "" || repeticoes <= 0) {
        console.log("Preencha os campos corretamente!");
        return;
    }

    const exercicio = {
        nome,
        repeticoes
    };
    listaDeExercicios.push(exercicio);

    console.log(`${nome} com ${repeticoes} repetições adicionado com sucesso!`);
}

// c) Ao clicar em "Exibir exercícios", mostre todos os exercícios cadastrados;

// d) Permita ordenar os exercícios por quantidade de repetições.

function ordenarExerciciosPorRepeticoes() {
    const exerciciosOrdenados = listaDeExercicios.sort((a, b) => a.repeticoes - b.repeticoes);

    console.log("Exercícios ordenados por quantidade de repetições:");
    exerciciosOrdenados.forEach((exercicio, index) => {
        console.log(`${index + 1}. ${exercicio.nome} - ${exercicio.repeticoes} repetições`);
    });
}

//     OBS: use push(), sort() e forEach().

cadastrarExercicio("Flexão", 20);
cadastrarExercicio("Agachamento", 15);
cadastrarExercicio("Abdominal", 30);
cadastrarExercicio("Burpee", 10);

ordenarExerciciosPorRepeticoes();

console.log("-----------------------------------------------------------------------------------")


// 6.(Cadastro de Receitas) Crie um programa o qual:

// a) O usuário informa o nome da receita e tempo de preparo;

// b) Ao clicar em "Cadastrar", adicione no vetor;

const listaDeReceitas = [];

function cadastrarReceita(nome = "", tempoPreparo = 0) {
    if (nome === "" || tempoPreparo <= 0) {
        console.log("Preencha os campos corretamente!");
        return;
    }

    const receita = {
        nome,
        tempoPreparo
    };
    listaDeReceitas.push(receita);

    console.log(`${nome} com tempo de preparo de ${tempoPreparo} minutos adicionado com sucesso!`);
}

// c) Ao clicar em "Filtrar por tempo", exiba apenas as receitas com tempo menor ou igual ao informado;

// d) Mostre a lista filtrada abaixo do botão.

function filtrarReceitasPorTempo(tempoLimite = 0) {
    if (tempoLimite <= 0) {
        console.log("Preencha o campo corretamente!");
        return;
    }

    const receitasFiltradas = listaDeReceitas.filter(receita => receita.tempoPreparo <= tempoLimite);

    console.log(`Receitas com tempo de preparo menor ou igual a ${tempoLimite} minutos:`);

    receitasFiltradas.forEach((receita, index) => {
        console.log(`${index + 1}. ${receita.nome} - ${receita.tempoPreparo} minutos`);
    });
}

//     OBS: use push(), filter() e forEach().

cadastrarReceita("Bolo de Chocolate", 60);
cadastrarReceita("Salada de Frutas", 15);
cadastrarReceita("Lasagna", 90);
cadastrarReceita("Omelete", 10);

filtrarReceitasPorTempo(30);


console.log("-----------------------------------------------------------------------------------")



// 7.(Lista de Contatos) Crie um programa o qual:

// a) O usuário informa o nome e o telefone do contato;

// b) Ao clicar em "Adicionar contato", armazene em um vetor;

const listaDeContatos = [];

function cadastrarContato(nome = "", telefone = "") {
    if (nome === "" || telefone === "") {
        console.log("Preencha os campos corretamente!");
        return;
    }

    const contato = {
        nome,
        telefone
    };
    listaDeContatos.push(contato);

    console.log(`${nome} adicionado com sucesso!`);
}

// c) Ao clicar em "Exibir contatos", liste todos em ordem alfabética;
function exibirContatos() {
    const contatosOrdenados = listaDeContatos.sort((a, b) => a.nome.localeCompare(b.nome));

    console.log("Contatos:");
    contatosOrdenados.forEach((contato, index) => {
        console.log(`${index + 1}. ${contato.nome} - ${contato.telefone}`);
    }
    );
}
// d) Permita remover um contato pelo nome.

function removerContato(nome = "") {
    if (nome === "") {
        console.log("Preencha o campo corretamente!");
        return;
    }

    const index = listaDeContatos.findIndex(contato => contato.nome === nome);
    if (index !== -1) {
        const contatoRemovido = listaDeContatos.splice(index, 1);
        console.log(`${contatoRemovido[0].nome} removido com sucesso!`);
    }
    else {
        console.log(`Contato com nome ${nome} não encontrado!`);
    }
}

//     OBS: use push(), toSorted() e splice().
cadastrarContato("Alice", "1234-5678");
cadastrarContato("Bob", "2345-6789");
cadastrarContato("Charlie", "3456-7890");

exibirContatos();

removerContato("Bob");
exibirContatos();

console.log("-----------------------------------------------------------------------------------")


// 8.(Registro de Pesos) Crie um programa o qual:

// a) O usuário informa o peso diário;

// b) Ao clicar em "Adicionar peso", registre no vetor;

const listaDePesos = [];

function cadastrarPeso(peso = 0) {
    if (peso <= 0) {
        console.log("Preencha o campo corretamente!");
        return;
    }

    listaDePesos.push(peso);
    console.log(`Peso de ${peso} kg adicionado com sucesso!`);
}

// c) Ao clicar em "Exibir histórico", mostre todos os pesos;

function exibirHistoricoPesos() {
    console.log("Histórico de pesos:");
    listaDePesos.forEach((peso, index) => {
        console.log(`${index + 1}. ${peso} kg`);
    });
}

// d) Permita calcular a média dos pesos cadastrados.

function calcularMediaPesos() {
    if (listaDePesos.length === 0) {
        console.log("Nenhum peso cadastrado!");
        return;
    }

    const soma = listaDePesos.reduce((total, peso) => total + peso, 0);
    const media = soma / listaDePesos.length;
    console.log(`Média dos pesos: ${media.toFixed(2)} kg`);
}

//     OBS: use push(), reduce() e forEach().


cadastrarPeso(70);
cadastrarPeso(68);
cadastrarPeso(69);
cadastrarPeso(71);

exibirHistoricoPesos();
calcularMediaPesos();

console.log("-----------------------------------------------------------------------------------")



// 9.(Lista de Filmes por Gênero) Crie um programa o qual:

const listaDeFilmesPorGenero = [];

// a) O usuário informa o nome do filme e o gênero;

// b) Ao clicar em "Cadastrar", armazene em vetor de objetos;

function cadastrarFilmePorGenero(nome = "", genero = "") {
    if (nome === "" || genero === "") {
        console.log("Preencha os campos corretamente!");
        return;
    }

    const filme = {
        nome,
        genero
    };
    listaDeFilmesPorGenero.push(filme);
    console.log(`${nome} do gênero ${genero} cadastrado com sucesso!`);

}

// c) Ao clicar em "Filtrar por gênero", mostre apenas os filmes do gênero selecionado.
function filtrarFilmesPorGenero(genero = "") {
    if (genero === "") {
        console.log("Preencha o campo corretamente!");
        return;
    }

    const filmesFiltrados = listaDeFilmesPorGenero.filter(filme => filme.genero.toLowerCase() === genero.toLowerCase());
    console.log(`Filmes do gênero ${genero}:`);
    filmesFiltrados.forEach((filme, index) => {
        console.log(`${index + 1}. ${filme.nome}`);
    }
    );
}
//     OBS: use push(), filter() e forEach().

cadastrarFilmePorGenero("Vingadores: Ultimato", "Ação");
cadastrarFilmePorGenero("O Senhor dos Anéis: O Retorno do Rei", "Ação");
cadastrarFilmePorGenero("Matrix", "Ação");
cadastrarFilmePorGenero("Gladiador", "Ação");
cadastrarFilmePorGenero("Mad Max: Estrada da Fúria", "Ação");
cadastrarFilmePorGenero("John Wick", "Ação");
cadastrarFilmePorGenero("Titanic", "Romance");
cadastrarFilmePorGenero("Diário de uma Paixão", "Romance");

filtrarFilmesPorGenero("Ação");
filtrarFilmesPorGenero("Romance");


console.log("-----------------------------------------------------------------------------------")

// 10.(Sistema de Votação de Atividades) Crie um programa o qual:

// a) O usuário seleciona uma atividade favorita(ex: corrida, natação, yoga);

// b) Ao clicar em "Votar", adicione o voto no vetor;

const listaDeVotos = [];

function votarAtividade(atividade = "") {
    if (atividade === "") {
        console.log("Preencha o campo corretamente!");
        return;
    }

    listaDeVotos.push(atividade);
    console.log(`Voto para ${atividade} registrado com sucesso!`);
}


// c) Ao clicar em "Resultado", mostre a quantidade de votos para cada atividade;

function exibirResultadoVotos() {
    const resultado = listaDeVotos.reduce((acc, atividade) => {
        acc[atividade] = (acc[atividade] || 0) + 1;
        return acc;
    }, {});

    console.log("Resultado da votação:");
    for (const atividade in resultado) {
        console.log(`${atividade}: ${resultado[atividade]} votos`);
    }
}


// d) Exiba a atividade mais votada com uma frase especial.

//     OBS: use push(), reduce(), map() e forEach().


votarAtividade("Corrida");
votarAtividade("Natação");
votarAtividade("Yoga");
votarAtividade("Corrida");
votarAtividade("Yoga");
votarAtividade("Corrida");

exibirResultadoVotos();

console.log("-----------------------------------------------------------------------------------")


// 11.(Sistema de Controle de Notas com Ranking) Crie um programa que:

// a) O usuário cadastra alunos com nome e nota final;

const listaDeAlunos = [];

function cadastrarAluno(nome = "", nota = 0) {
    if (nome === "" || nota < 0 || nota > 10) {
        console.log("Preencha os campos corretamente!");
        return;
    }

    const aluno = {
        nome,
        nota
    };
    listaDeAlunos.push(aluno);
    console.log(`${nome} com nota ${nota} cadastrado com sucesso!`);
}


// b) Armazene os alunos em um vetor de objetos { nome, nota };

// c) Ao clicar em “Exibir aprovados”, o programa deve:

// Filtrar alunos com nota ≥ 6(filter)
// Ordenar do maior para o menor nota(sort)
// Exibir apenas os nomes e notas formatados com map
// Mostrar a lista abaixo do botão.
// Desafio adicional: Mostrar a média das notas aprovadas usando reduce.

function exibirAprovados() {
    const aprovados = listaDeAlunos
        .filter(aluno => aluno.nota >= 6)
        .sort((a, b) => b.nota - a.nota)
        .map(aluno => `${aluno.nome} - Nota: ${aluno.nota}`);

    console.log("Alunos Aprovados:");
    aprovados.forEach((aluno, index) => {
        console.log(`${index + 1}. ${aluno}`);
    });

    const mediaAprovados = listaDeAlunos
        .filter(aluno => aluno.nota >= 6)
        .reduce((total, aluno) => total + aluno.nota, 0) / aprovados.length;
    console.log(`Média das notas aprovadas: ${mediaAprovados.toFixed(2)}`);
}

//     OBS: use push(), filter(), sort(), map(), reduce().

cadastrarAluno("Alice", 8.5);
cadastrarAluno("Bob", 5.0);
cadastrarAluno("Charlie", 7.2);
cadastrarAluno("Diana", 9.0);
cadastrarAluno("Eve", 4.8);

exibirAprovados();

console.log("-----------------------------------------------------------------------------------")


// 12.(Lista de Produtos com Estoque e Preço) Crie um programa que:

// a) O usuário informa produtos com nome, preço e quantidade em estoque;

// b) Armazene os produtos em um vetor de objetos com nome, preço e quantidade;

const listaDeProdutos = [];

function cadastrarProduto(nome = "", preco = 0, quantidade = 0) {

    if (nome === "" || preco < 0 || quantidade < 0) {
        console.log("Preencha os campos corretamente!");
        return;
    }

    const produto = {
        nome,
        preco,
        quantidade
    };
    listaDeProdutos.push(produto);
    console.log(`${nome} com preço R$${preco.toFixed(2)} e quantidade ${quantidade} em estoque cadastrado com sucesso!`);
}


// c) Ao clicar em “Produtos em promoção”, o programa deve:

// Filtrar produtos com preço menor que um valor informado(filter)
// Aplicar um desconto de 10 % no preço de cada produto filtrado(map)
// Ordenar os produtos pelo preço final em ordem crescente(sort)
// Exibir o nome e preço final dos produtos formatados.
// Desafio adicional: Calcular o total do estoque em valor monetário usando reduce.

function exibirProdutosEmPromocao(precoLimite = 0) {
    if (precoLimite < 0) {
        console.log("Preencha o campo corretamente!");
        return;
    }

    const produtosEmPromocao = listaDeProdutos
        .filter(produto => produto.preco < precoLimite)
        .map(produto => ({
            nome: produto.nome,
            precoFinal: produto.preco * 0.9
        }))
        .sort((a, b) => a.precoFinal - b.precoFinal);

    console.log(`Produtos em promoção com preço menor que R$${precoLimite.toFixed(2)}:`);
    produtosEmPromocao.forEach((produto, index) => {
        console.log(`${index + 1}. ${produto.nome} - Preço final: R$${produto.precoFinal.toFixed(2)}`);
    });

    const totalEstoqueValor = listaDeProdutos.reduce((total, produto) => total + (produto.preco * produto.quantidade), 0);
    console.log(`Valor total do estoque: R$${totalEstoqueValor.toFixed(2)}`);
}


//     OBS: use push(), filter(), map(), sort(), reduce().

cadastrarProduto("Camiseta", 50, 100);
cadastrarProduto("Calça Jeans", 120, 50);
cadastrarProduto("Tênis", 200, 30);
cadastrarProduto("Boné", 30, 150);
cadastrarProduto("Jaqueta", 250, 20);

exibirProdutosEmPromocao(100);


console.log("-----------------------------------------------------------------------------------")


// 13.(Ranking de Filmes por Avaliação) Crie um programa que:

// a) O usuário cadastra filmes com nome, gênero e nota de avaliação;

// b) Armazene os filmes em um vetor de objetos { nome, genero, nota };
const listaDeFilmes = []

function cadastrarFilme(nome = "", genero = "", nota = 0) {

    if (nome == null || genero == null || nota == null || nome == undefined || genero == undefined || nota == undefined) {
        console.log("Preencha o campo corretamente!");
        return
    }

    const novoFilme = { nome, genero, nota }

    listaDeFilmes.push(novoFilme)

    console.log(`${nome} cadastrado com sucesso!`);
}

// c) Ao clicar em “Top Filmes Ação”, o programa deve:

// Filtrar apenas filmes do gênero “Ação” (filter)
// Ordenar por nota da maior para a menor(sort)
// Criar uma lista de frases formatadas como "Filme: X | Nota: Y"(map)
// Exibir os top 5 filmes com maior nota
// Desafio adicional: Calcular a média das notas dos filmes de ação usando reduce.

function filtrarPorFilmeDeAcao() {

    const lisatFilmesFiltrados = listaDeFilmes
        .filter(filme => filme.genero.toLowerCase() == "ação")
        .sort((filmeA, filmeB) => filmeB.nota - filmeA.nota)
        .map(filme => `Filme: ${filme.nome} | Nota: ${filme.nota}`)
        .slice(0, 5)

    console.log("Top 5 filmes de ação:")


    lisatFilmesFiltrados.forEach((filme) => {
        console.log(filme)
    })

    const mediaDeNotas = listaDeFilmes.reduce(
        (total, filme) => total + filme.nota, 0
    ) / listaDeFilmes.length

    console.log("Nota media dos filmes eh:" + mediaDeNotas.toFixed(2))
}

//     OBS: use push(), filter(), sort(), map(), slice(), reduce().


cadastrarFilme("Vingadores: Ultimato", "Ação", 9.5)
cadastrarFilme("O Senhor dos Anéis: O Retorno do Rei", "Ação", 9.0)
cadastrarFilme("Matrix", "Ação", 8.7)
cadastrarFilme("Gladiador", "Ação", 8.5)
cadastrarFilme("Mad Max: Estrada da Fúria", "Ação", 8.1)
cadastrarFilme("John Wick", "Ação", 7.4)

filtrarPorFilmeDeAcao()