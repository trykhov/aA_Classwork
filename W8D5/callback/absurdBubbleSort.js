const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} > ${el2}?: `, res => {
    if(res ==='yes') {
      return callback(true);
    } else if(res === 'no') {
      return callback(false);
    }
    reader.close();
  })
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if(madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  outerBubbleSortLoop(true);
  console.log(arr);
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if(i === (arr.length - 1)) return outerBubbleSortLoop(madeAnySwaps);
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i + 1], isGreaterThan => {
      if (isGreaterThan) {
        let hold = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = hold;
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  }
}

let test = [5,15,8,29,14,0,-7]

absurdBubbleSort(test, function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});