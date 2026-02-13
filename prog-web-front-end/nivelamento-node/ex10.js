// 10. Crie uma função que receba um vetor de números e um valor, e retorne a quantidade de vezes que esse valor aparece no vetor.

function quantidadeElementos(vetor, valor) {
    return vetor.reduce(
        (acumulador, item) => {

            if (item == valor) {
                acumulador++;
            }

            return acumulador;

        }, 0
    );
}

const numeros = [10, 20, 30, 40, 50, 10, 10]
console.log(quantidadeElementos(numeros, 10));