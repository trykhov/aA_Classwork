Array.prototype.myEach = function(call_back) {
  for(let el of this) {
    call_back(el);
  }
};


Array.prototype.myMap = function(call_back) {
  let result = [];
  for(let el of this) {
    result.push(call_back(el));
  }
  return result;
};

// const call_back_func = (banana) => {
//   return 2 * banana;
// }

Array.prototype.myReduce = function(call_back, initialValue = null) {
  let i = initialValue === null ? 1 : 0;
  let acc = initialValue === null ? this[0] : initialValue;
  for(let j = i; j < this.length; j++) {
    acc = call_back(acc, this[j]);
  }
  return acc;
};

let add = function (acc, el) {
  return acc + el;
};





