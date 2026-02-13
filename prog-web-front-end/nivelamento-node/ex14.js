// 14. Crie uma função que receba um vetor de números e retorne true se houver elementos duplicados no vetor, ou false caso contrário.
// function elementosDuplicados(vetor) {
//     const elementosUnicos = new Set(vetor);

//     return elementosUnicos.size !== vetor.length;
// }

function elementosDuplicados(vetor) {
    const map = {}

    vetor.forEach(e => {
        if (map[e]) {
            map[e] = map[e] + 1;
        } else {
            map[e] = 1;
        }
    })

    return Object.values(map).some(e => e > 1);

}

const numeros = [10, 20, 30, 40, 50, 10];
console.log(elementosDuplicados(numeros));