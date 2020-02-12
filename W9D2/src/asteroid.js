const Util = require("./util.js");
const MovingObject = require("./moving_object.js");
const Ship = require('./ship.js');

function Asteroid(opt = {}, game) {
  this.color = "grey";
  this.radius = 20;
  this.pos = opt.pos;
  opt.game = game;
  opt.color = this.color;
  opt.radius = this.radius;
  opt.vel = Util.randomVec(20);
  MovingObject.call(this, opt);
};

Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function(otherObject) {
  if(otherObject instanceof Ship) {
    otherObject.relocate();
  }
};

module.exports = Asteroid;