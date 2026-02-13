// 15. Crie uma função que receba um vetor de números e retorne a média dos valores.

function mediaValores(vetor) {
    const soma = vetor.reduce((acumulador, elemento) => acumulador + elemento, 0);
    return soma / vetor.length;
}

const numeros = [10, 20, 30, 40, 50]
console.log(mediaValores(numeros));