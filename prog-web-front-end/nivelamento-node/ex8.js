// 8. Crie uma função que receba um vetor de números e retorne o menor valor presente no vetor.

function menorNumero(vetor) {
    return vetor.sort((a, b) => a - b)[0];
}

const numeros = [10, 20, 30, 40, 50]
console.log(menorNumero(numeros));