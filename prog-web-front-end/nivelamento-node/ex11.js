// 11. Crie uma função que receba um vetor de números e retorne um novo vetor contendo apenas os números pares do vetor original.

function somentePares(vetor) {
    return vetor.filter(e => e % 2 == 0);
}

const numeros = [10, 20, 30, 40, 51]
console.log(somentePares(numeros));