// 2. Crie uma função que receba um vetor de números e retorne uma nova lista com os 3 últimos elementos. 

function ultimosElementos(vetor) {
    return vetor.slice(vetor.length - 3, vetor.length);
}

const numeros = [10, 20, 30, 40, 50];
console.log(ultimosElementos(numeros)); 