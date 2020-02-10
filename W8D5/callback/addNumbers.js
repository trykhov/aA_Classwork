const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  
  if(numsLeft > 0) {
    reader.question("Give us a number: ", (num) => {
      num = parseInt(num)
      console.log(num + sum);
      return addNumbers(num + sum, numsLeft - 1, completionCallback);
      reader.close();
    })
  }
  
  if(numsLeft === 0) {
    return completionCallback(sum);
  } 
} 

// const cb = function(sum) {
//   console.log(`Thanks! Here's your sum: ${sum}`);
// }

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));