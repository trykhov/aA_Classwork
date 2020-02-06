class Cat {

    constructor(name, owner) {
        this.name = name;
        this.owner = owner;
    };

    meow = () => {
        return `${this.name} meows`
    }
};


Cat.prototype.cuteStatement = function() {
    return `Everyone loves ${this.name}!`
}

cat1 = new Cat('tsktsk', 'you');
cat1.meow = function() {
    return "tsk tsk tsk"
}