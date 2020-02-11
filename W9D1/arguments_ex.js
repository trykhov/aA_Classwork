function sum(){
  let args = arguments;
  let sum = 0;

  for(let i = 0; i < args.length; i++){
    sum += args[i];
  }
  return sum
}

// console.log(sum) //just a function, donn't expect it to do anything
// console.log(sum(1,2,3,4)) // calling the function, expect a result

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

function sum2(...args){
  let sum = 0;
  for (let i = 0; i < args.length; i++) {
    sum += args[i];
  }
  return sum
}

// console.log(sum2(1, 2, 3, 4) === 10);
// console.log(sum2(1, 2, 3, 4, 5) === 15);

// ******************************************************************************
Function.prototype.myBind = function() {
  let args_1 = Array.from(arguments); // array takes every input, Array.from(arguments) puts them into an array
  let cxt = args_1[0]; // retrieve the cxt from the arguments array
  args_1.shift(); // remove the cxt from the arguments array
  let that = this; // allows return function to have this context
  return function cb() {
    let args_2 = Array.from(arguments);
    that.apply(cxt, args_1.concat(args_2));
  };
};

// ...[1,2,3] => 1,2,3
// ...1,2,3 ==> [1,2,3]

Function.prototype.myBind = function(cxt, ...args) {
  // console.log(`args: ${args}`)
  let that = this;
  return function cb(...args_2) {
    // console.log(`args_2: ${args_2}`)
    that.apply(cxt, args.concat(args_2));
  };
};




class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}



const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true


// ******************************************************************************

function curriedSum(numArgs) {
  const numbers = [];
  return function _curriedSum(num) {
    numbers.push(num);
    if(numbers.length === numArgs) {
      return sum(...numbers);
    } else {
      return _curriedSum; // not recursive, simply just returning the function (NOT running it)
    }
  }
}

// const sum_test = curriedSum(4);
// console.log(sum_test(5)(30)(20)(1))
// console.log(sum_test(5)(30)(20)(1));

// ******************************************************************************


Function.prototype.curry = function(numArgs){
  let store = [];
  let that = this;
  return function cb_curry(el){
    store.push(el);
    if(store.length === numArgs){
      return that(...store);
    }else{
      return cb_curry;
    }

  };

};
const sum_test2 = sum.curry(4);
console.log(sum_test2(5)(30)(20)(1));

Function.prototype.curry2 = function(ctx, numArgs){
  let store = [];
  let that = this;
  return function cb_curry(el){
    store.push(el);
    if(store.length === numArgs){
      that.apply(ctx, store);
    }else{
      return cb_curry;
    }

  }
}
let test2 = markov.says.curry2(pavlov, 2);
// Pavlov says meow to a tree!
// true
test2('hello')('mellow')