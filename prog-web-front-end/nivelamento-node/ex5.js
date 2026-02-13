// 5. Crie uma função que receba um vetor de números e retorne a quantidade de números negativos presentes no vetor.



function quantidadeElementosNegativos(vetor) {
    return vetor.filter(e => e < 0).length;
}

const numeros = [10, 20, 30, 40, 51]
console.log(quantidadeElementosNegativos(numeros)); 