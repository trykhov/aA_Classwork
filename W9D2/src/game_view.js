const Game = require("./game.js");

function GameView(ctx){
  this.game = new Game();
  this.ctx = ctx;
  this.game.addAsteroids();
}

GameView.prototype.start = function(){
  let that = this;
  that.bindKeyHandlers();
  setInterval(function(){
    that.game.step();
    that.game.draw(that.ctx);
  }, 20);
};

GameView.prototype.bindKeyHandlers = function() {
  // this.game.ship.power
  // console.log(key)
  let that = this;
  key('⇧', function() {
    that.game.ship.power([2,3]);
    return false;
  });
  key('s', function () {
    that.game.ship.power([-2, -3]);
    return false;
  });
};

module.exports = GameView;