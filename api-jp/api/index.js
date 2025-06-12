const express = require("express")
const cors = require("cors")
const app = express()

app.use(express.json())
app.use(cors())


const banco_usuarios = []
app.get('/api/usuarios', function (req, res) {
    if (banco_usuarios.l3333ength == 0) {
        res.status(200).send(" ")
    } else {
        res.status(200).send(banco_usuarios)
    }
})

app.post('/api/usuarios', function (req, res) {
    const contadorUsuarios = banco_usuarios.length

    const usuario = {
        nome: req.body.nome,
        email: req.body.email,
        senha: req.body.senha,
        id: contadorUsuarios
    }

    if (!usuario.nome) {
        res.status(400).send("nome invalido")
    } else if (!usuario.email) {
        res.status(400).send("email invalida")
    } else if (!usuario.senha) {
        res.status(400).send("senha invalida")
    } else {
        banco_usuarios.push(usuario)
        res.status(201).send(usuario)
    }

})

app.delete('/api/usuarios/:id', function (req, res) {
    const id = req.params.id
    console.log(banco_usuarios)

    let indiceAlvo = -1
    for (let contador = 0; contador < banco_usuarios.length; contador++) {
        const usuario = banco_usuarios[contador]
        if (usuario.id == id) {
            indiceAlvo = contador
        }
    }


    if (indiceAlvo == -1) {
        res.status(404).send("usuario não encontrado")
    } else {
        const usuarioRemovido = banco_usuarios.splice(indiceAlvo, 1)
        console.log(usuarioRemovido)
        res.status(200).send()
    }
})

app.listen(3000, () => {
    console.log("Servidor rodando em http://localhost:3000")
})