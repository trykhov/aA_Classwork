function MovingObject(opt) {
  this.pos = opt.pos;
  this.vel = opt.vel;
  this.radius = opt.radius;
  this.color = opt.color;
  this.game = opt.game;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 360);
  ctx.stroke();
  ctx.fillStyle = this.color;
  ctx.fill();
};

MovingObject.prototype.move = function(){
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  let coordWrap = this.game.wrap(this.pos);
  this.pos[0] = coordWrap[0];
  this.pos[1] = coordWrap[1];
};

MovingObject.prototype.isCollidedWith = function(otherObject) {
  let totalRadii = this.radius + otherObject.radius;
  let x2 = ((this.pos[0] - otherObject.pos[0]) ** 2);
  let y2 = ((this.pos[1] - otherObject.pos[1]) ** 2);
  let distance = Math.sqrt(x2 + y2);
  return distance <= totalRadii;
};


module.exports = MovingObject;