Array.prototype.bubbleSort = function() {
  sorted = false;

  while (!sorted) {
    sorted = true;
    for(i = 0; i < this.length - 1; i ++) {
      if (this[i] > this[i + 1]) {
        sorted = false;
        let temp = this[i];
        this[i] = this[i + 1];
        this[i + 1] = temp;
      }
    }
  }
  return this;
};

String.prototype.subStrings = function() {
  let result = []
  for(i = 0; i < this.length; i++) {
    let sub = "";
    for(j = i; j < this.length; j++) {
      sub += this[j];
      result.push(sub);
    }
  }
  return result;
}

