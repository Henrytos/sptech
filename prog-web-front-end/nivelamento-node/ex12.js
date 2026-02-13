// 12. Crie uma função que receba um vetor de números e retorne um novo vetor contendo apenas os números ímpares do vetor original.
function somenteImpares(vetor) {
    return vetor.reduce((vetorImpares, elemento) => {

        if (elemento % 2 == 1) {
            vetorImpares.push(elemento);
        }

        return vetorImpares;
    }, []);
}

const numeros = [10, 20, 30, 40, 51]
console.log(somenteImpares(numeros));