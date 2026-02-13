// 16. Crie uma função que receba um vetor de números e um número n, e retorne um novo vetor contendo os valores da lista original que são maiores que n.
function maioresQueN(vetor, n) {
    return vetor.filter(e => e > n);
}

const numeros = [10, 20, 30, 40, 50]
console.log(maioresQueN(numeros, 25));

