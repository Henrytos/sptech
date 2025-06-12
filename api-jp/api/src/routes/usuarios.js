

const express = require('express')

const router = express()

router.get('/', (req, res) => {
    return res.send([{
        nome: 'jp',
    },
    {
        nome: 'frizza',
    }])
})

module.exports = router