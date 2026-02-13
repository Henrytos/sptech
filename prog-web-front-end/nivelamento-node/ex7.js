// 7. Crie uma função que receba um vetor de números e retorne o maior valor presente no vetor.
function maiorNumero(vetor) {
    return vetor.sort((a, b) => b - a)[0];
}

const numeros = [10, 20, 30, 40, 50]
console.log(maiorNumero(numeros));