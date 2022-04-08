class Dog{

    constructor(name){
        this.name = name;
        this.behavior = 0;
    }

    get getName(){
        return this.name;
    }

    get getBehavior(){
        return this.behavior;
    }
}

const halley = new Dog("Halley");
console.log(halley.name);
console.log(halley.behavior);
console.log(halley.getName());
console.log(halley.getBehavior());