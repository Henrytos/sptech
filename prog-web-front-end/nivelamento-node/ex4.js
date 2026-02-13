// 4. Crie uma função que receba um vetor de números e retorne a quantidade de elementos ímpares no vetor.

function quantidadeElementosImpares(vetor) {
    return vetor.filter(e => e % 2 == 1).length;
}

const numeros = [10, 20, 30, 40, 51]
console.log(quantidadeElementosImpares(numeros)); 
