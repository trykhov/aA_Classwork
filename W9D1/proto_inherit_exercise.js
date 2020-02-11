Function.prototype.inherits = function(supClass){
  function Surrogate() {};
  Surrogate.prototype = supClass.prototype;
  this.prototype = new Surrogate();
  
  this.prototype.constructor = this;
}


// function MovingObject() {
//   this.mass = 25;
//   this.direction = `West`;
//  }

// function Ship(mass, direction) { 
//   MovingObject.call(this, mass);
// }
// Ship.inherits(MovingObject);
// let rocket = new Ship();
// // console.log(Ship.prototype)
// rocket.mass = 26;
// rocket.fuel = 10
// // console.log(rocket.mass)
// console.log(rocket.fuel)

// let test = new Ship();
// console.log(test.fuel)
// function Asteroid() { }
// Asteroid.inherits(MovingObject);



Function.prototype.inherits = function(supClass){
  this.prototype = Object.create(supClass.prototype);   // this shortens the surrogate code
  this.prototype.constructor = this;
}

function MovingObject() {
  this.mass = 25;
  this.direction = `West`;
  console.log(this);
  
}

function Ship(mass, direction) {
  MovingObject.call(this, mass);

}
Ship.inherits(MovingObject);
let rocket = new Ship();
// console.log(Ship.prototype)
// rocket.mass = 26;
rocket.fuel = 10;
// console.log(rocket.mass)
console.log(rocket.mass);

let test = new MovingObject();
console.log(test.mass);
// function Asteroid() { }
// Asteroid.inherits(MovingObject);