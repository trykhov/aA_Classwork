import Level, {} from './level.js';

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
  }

  animate(level) {

  }

  restart(canvas) {
    this.level = new Level(canvas);
    this.animate(this.level)
  }
}