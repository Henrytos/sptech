// 9. Crie uma função que receba um vetor de números e retorne true se todos os elementos forem positivos, ou false caso contrário.


function estaPositivo(vetor) {
    return vetor.every(e => e > 0);
}

const numeros = [10, 20, 30, 40, 50]
console.log(estaPositivo(numeros));