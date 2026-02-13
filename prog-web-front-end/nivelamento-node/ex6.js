// 6. Crie uma função que receba um vetor de números e retorne a soma de todos os elementos do vetor.


function somaElementos(vetor) {
    return vetor.reduce((acumulador, elemento) => acumulador + elemento, 0);
}

const numeros = [10, 20, 30, 40, 50]
console.log(somaElementos(numeros));
