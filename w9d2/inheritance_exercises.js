Function.prototype.inherits  = function (obj) {
  function Surrogate() {}
  Surrogate.prototype = obj.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}

function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);