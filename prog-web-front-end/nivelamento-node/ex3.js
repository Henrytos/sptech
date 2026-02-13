// 3. Crie uma função que receba um vetor de números e retorne a quantidade de elementos pares no vetor.


function quantidadeElementosPares(vetor) {
    return vetor.filter(e => e % 2 == 0).length;
}

const numeros = [10, 20, 30, 40, 51]
console.log(quantidadeElementosPares(numeros)); 
