const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const GameView = require("./game_view.js")


document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("game-canvas");
  let ctx = canvas.getContext("2d"); 
  
  let gameView = new GameView(ctx);
  gameView.start();
});

window.MovingObject = MovingObject;