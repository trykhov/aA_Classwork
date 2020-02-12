/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\n\nfunction Asteroid(opt = {}, game) {\n  this.color = \"grey\";\n  this.radius = 20;\n  this.pos = opt.pos;\n  opt.game = game;\n  opt.color = this.color;\n  opt.radius = this.radius;\n  opt.vel = Util.randomVec(20);\n  MovingObject.call(this, opt);\n};\n\nUtil.inherits(Asteroid, MovingObject);\n\nAsteroid.prototype.collideWith = function(otherObject) {\n  if(otherObject instanceof Ship) {\n    otherObject.relocate();\n  }\n};\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\")\n\nfunction Game() {\n  this.DIM_X = 1000;\n  this.DIM_Y = 800;\n  this.NUM_ASTEROIDS = 4;\n  this.asteroids = [];\n  this.ship = new Ship(this);\n}\n\nGame.prototype.allObjects = function(){\n  let all = [];\n  all.push(this.ship);\n  return all.concat(this.asteroids);\n};\n\nGame.prototype.addAsteroids = function() {\n  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {\n    let pos = this.randomPosition();\n    let asteroid = new Asteroid({pos: pos}, this);\n    this.asteroids.push(asteroid);\n  }\n};\n\nGame.prototype.randomPosition = function() {\n  let x = Math.floor(Math.random() * this.DIM_X);\n  let y = Math.floor(Math.random() * this.DIM_Y);\n  return [x,y];\n};\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0,0,this.DIM_X, this.DIM_Y);\n  let all = this.allObjects();\n  for (let el of all) {\n    // console.log(all)\n    el.draw(ctx);\n  }\n};\n\nGame.prototype.moveObjects = function() {\n  let all = this.allObjects();\n  for (let el of all) {\n    el.move();\n  }\n};\n\nGame.prototype.wrap = function(pos) {\n  let x = pos[0];\n  let y = pos[1];\n  if (x > this.DIM_X) {\n    x = 0;\n  }  else if (x < 0) {\n    x = this.DIM_X;\n  }\n  if (y > this.DIM_Y) {\n    y = 0;\n  }  else if (y < 0) {\n    y = this.DIM_Y;\n  }\n  return [x,y];\n};\n\nGame.prototype.checkCollisions = function(){\n  for (let asteroid of this.asteroids) {\n    if(asteroid.isCollidedWith(this.ship)) {\n      asteroid.collideWith(this.ship);\n    }\n  }\n};\n\nGame.prototype.step = function(){\n  this.moveObjects();\n  this.checkCollisions();\n};\n\nGame.prototype.remove = function(asteroid){\n    this.asteroids = this.asteroids.filter(function(el) {\n      return el !== asteroid;\n    });\n};\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(ctx){\n  this.game = new Game();\n  this.ctx = ctx;\n  this.game.addAsteroids();\n}\n\nGameView.prototype.start = function(){\n  let that = this;\n  that.bindKeyHandlers();\n  setInterval(function(){\n    that.game.step();\n    that.game.draw(that.ctx);\n  }, 20);\n};\n\nGameView.prototype.bindKeyHandlers = function() {\n  // this.game.ship.power\n  // console.log(key)\n  let that = this;\n  key('⇧', function() {\n    that.game.ship.power([2,3]);\n    return false;\n  });\n  key('s', function () {\n    that.game.ship.power([-2, -3]);\n    return false;\n  });\n};\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\n\n\ndocument.addEventListener(\"DOMContentLoaded\", function(){\n  const canvas = document.getElementById(\"game-canvas\");\n  let ctx = canvas.getContext(\"2d\"); \n  \n  let gameView = new GameView(ctx);\n  gameView.start();\n});\n\nwindow.MovingObject = MovingObject;\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(opt) {\n  this.pos = opt.pos;\n  this.vel = opt.vel;\n  this.radius = opt.radius;\n  this.color = opt.color;\n  this.game = opt.game;\n}\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 360);\n  ctx.stroke();\n  ctx.fillStyle = this.color;\n  ctx.fill();\n};\n\nMovingObject.prototype.move = function(){\n  this.pos[0] += this.vel[0];\n  this.pos[1] += this.vel[1];\n  let coordWrap = this.game.wrap(this.pos);\n  this.pos[0] = coordWrap[0];\n  this.pos[1] = coordWrap[1];\n};\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n  let totalRadii = this.radius + otherObject.radius;\n  let x2 = ((this.pos[0] - otherObject.pos[0]) ** 2);\n  let y2 = ((this.pos[1] - otherObject.pos[1]) ** 2);\n  let distance = Math.sqrt(x2 + y2);\n  return distance <= totalRadii;\n};\n\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\n\n\nfunction Ship(game) {\n  this.radius = 10;\n  this.color = \"red\";\n  this.vel = [0,0];\n  let opt = {\n    pos: game.randomPosition(),\n    radius: this.radius,\n    color: this.color,\n    vel: this.vel,\n    game: game,\n  };\n  MovingObject.call(this, opt);\n\n};\n\n\nUtil.inherits(Ship, MovingObject);\n\nShip.prototype.relocate = function() {\n  this.pos = this.game.randomPosition();\n};\n\nShip.prototype.power = function(impulse) {\n  this.vel[0] += impulse[0];\n  this.vel[1] += impulse[1];\n};\n\n\n\nmodule.exports = Ship;\n\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("// Function.prototype.inherits = function(parent) {\n//   function Surrogate() {};\n//   Surrogate.prototype = parent.prototype;\n//   this.prototype = new Surrogate();\n//   this.prototype.constructor = this;\n// };\n\nconst Util = {\n  inherits(childClass, parentClass) {\n    \n    function Surrogate() {};\n    Surrogate.prototype = parentClass.prototype;\n    childClass.prototype = new Surrogate();\n    childClass.prototype.constructor = childClass;  \n    let s = \"s\"\n  }, \n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n};\n\nmodule.exports = Util;\n\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });