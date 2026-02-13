const example = {
    title: 'Example',
    one: () => {
        console.log(this.title)
    },
    two: function () {
        console.log(this.title)
    }

}

example.one() // undefined
example.two() // Example