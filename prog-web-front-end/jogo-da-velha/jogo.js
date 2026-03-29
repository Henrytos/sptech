let jogadorAtual = 1;
let vencedor = null;

function inserirJogada(matriz, linha, coluna) {
    if (matriz[linha][coluna] != '') {
        return false
    }
    matriz[linha][coluna] = jogadorAtual

    return true
}

function alternarJogador() {
    jogadorAtual = jogadorAtual == 2 ? 1 : 2
}

function validarJogada(matriz) {

    console.log("aqui", matriz)
    if (
        (matriz[0][0] == 1
            &&
            matriz[0][1] == 1
            && matriz[0][2] == 1
        )

        ||

        (matriz[1][0] == 1
            &&
            matriz[1][1] == 1
            && matriz[1][2] == 1
        )

        ||

        (matriz[2][0] == 1
            &&
            matriz[2][1] == 1
            && matriz[2][2] == 1
        )

        ||
        (matriz[0][0] == 1
            &&
            matriz[1][0] == 1
            && matriz[2][0] == 1
        )
        ||
        (matriz[0][1] == 1
            &&
            matriz[1][1] == 1
            && matriz[2][1] == 1
        )
        ||
        (matriz[0][2] == 1
            &&
            matriz[1][2] == 1
            && matriz[2][2] == 1
        )
        ||

        (matriz[0][0] == 1
            &&
            matriz[1][1] == 1
            && matriz[2][2] == 1
        )

        ||

        (matriz[2][0] == 1
            &&
            matriz[1][1] == 1
            && matriz[0][2] == 1
        )
    ) {
        vencedor = 1
    }
    else if
        (
        (matriz[0][0] == 2
            &&
            matriz[0][1] == 2
            && matriz[0][2] == 2
        )

        ||

        (matriz[1][0] == 2
            &&
            matriz[1][1] == 2
            && matriz[1][2] == 2
        )

        ||

        (matriz[2][0] == 2
            &&
            matriz[2][1] == 2
            && matriz[2][2] == 2
        )

        ||
        (matriz[0][0] == 2
            &&
            matriz[1][0] == 2
            && matriz[2][0] == 2
        )
        ||
        (matriz[0][1] == 2
            &&
            matriz[1][1] == 2
            && matriz[2][1] == 2
        )
        ||
        (matriz[0][2] == 2
            &&
            matriz[1][2] == 2
            && matriz[2][2] == 2
        )
        ||

        (matriz[0][0] == 2
            &&
            matriz[1][1] == 2
            && matriz[2][2] == 2
        )

        ||

        (matriz[2][0] == 2
            &&
            matriz[1][1] == 2
            && matriz[0][2] == 2
        )
    ) {
        vencedor = 2
    }

    const estaCheia = matriz.every(linha => linha.every(celula => celula != ''))

    if (estaCheia && vencedor == null) {
        vencedor = 0
    }
}

function getMensagem() {

    if (vencedor == 1) {
        return "O Vencedor é o jogador 1"
    } else if (vencedor == 2) {
        return "O Vencedor é o jogador 2"
    } else if (vencedor == 0) {
        return "Houve um empate"
    } else {
        return "Em andamento"
    }
}
