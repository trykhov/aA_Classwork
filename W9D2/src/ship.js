const MovingObject = require("./moving_object.js");
const Util = require("./util.js");


function Ship(game) {
  this.radius = 10;
  this.color = "red";
  this.vel = [0,0];
  let opt = {
    pos: game.randomPosition(),
    radius: this.radius,
    color: this.color,
    vel: this.vel,
    game: game,
  };
  MovingObject.call(this, opt);

};


Util.inherits(Ship, MovingObject);

Ship.prototype.relocate = function() {
  this.pos = this.game.randomPosition();
};

Ship.prototype.power = function(impulse) {
  this.vel[0] += impulse[0];
  this.vel[1] += impulse[1];
};



module.exports = Ship;
