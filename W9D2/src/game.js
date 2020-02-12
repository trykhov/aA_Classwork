const Asteroid = require("./asteroid.js");
const Ship = require("./ship.js")

function Game() {
  this.DIM_X = 1000;
  this.DIM_Y = 800;
  this.NUM_ASTEROIDS = 4;
  this.asteroids = [];
  this.ship = new Ship(this);
}

Game.prototype.allObjects = function(){
  let all = [];
  all.push(this.ship);
  return all.concat(this.asteroids);
};

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    let pos = this.randomPosition();
    let asteroid = new Asteroid({pos: pos}, this);
    this.asteroids.push(asteroid);
  }
};

Game.prototype.randomPosition = function() {
  let x = Math.floor(Math.random() * this.DIM_X);
  let y = Math.floor(Math.random() * this.DIM_Y);
  return [x,y];
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0,0,this.DIM_X, this.DIM_Y);
  let all = this.allObjects();
  for (let el of all) {
    // console.log(all)
    el.draw(ctx);
  }
};

Game.prototype.moveObjects = function() {
  let all = this.allObjects();
  for (let el of all) {
    el.move();
  }
};

Game.prototype.wrap = function(pos) {
  let x = pos[0];
  let y = pos[1];
  if (x > this.DIM_X) {
    x = 0;
  }  else if (x < 0) {
    x = this.DIM_X;
  }
  if (y > this.DIM_Y) {
    y = 0;
  }  else if (y < 0) {
    y = this.DIM_Y;
  }
  return [x,y];
};

Game.prototype.checkCollisions = function(){
  for (let asteroid of this.asteroids) {
    if(asteroid.isCollidedWith(this.ship)) {
      asteroid.collideWith(this.ship);
    }
  }
};

Game.prototype.step = function(){
  this.moveObjects();
  this.checkCollisions();
};

Game.prototype.remove = function(asteroid){
    this.asteroids = this.asteroids.filter(function(el) {
      return el !== asteroid;
    });
};

module.exports = Game;