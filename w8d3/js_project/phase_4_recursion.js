function range(start, end) {
  if (end === start) {
    return [start]
  }
  let induction = range(start, end - 1);
  induction.push(end);
  return induction;
}

// function range(start, end) {
//   if (end === start) {
//     return [start];
//   }
//   return [start].concat(range(start + 1, end));
// }

function subRec(arr) {
  if (arr.length === 1) {
    return arr[0];
  }
  return arr[0] + subRec(arr.slice(1));
}


function exp(b, n) {
  if (n == 0) return 1;
  return b * exp(b, n - 1);
}


function exp(b, n) {
  if (n == 0) return 1;
  if (n == 1) return b;
  if (n % 2 == 0) return exp(b, n / 2) ** 2;
  if (n % 2 == 1) return b * (exp(b, (n - 1) / 2) ** 2);
}


function mergesort(arr) {
  if (arr.length == 1) return arr;
  let mid = arr.length / 2;
  let left = mergesort(arr.slice(0, mid));
  let right = mergesort(arr.slice(mid));
  return merge(left, right);
}

function merge(left, right) {
  let new_arr = new Array(left.length + right.length);
  let i = 0;
  let j = 0;
  while ((i < left.length) && (j < right.length)) {
    if(left[i] < right[j]) {
      new_arr[i + j] = left[i];
      i += 1;
    } else {
      new_arr[i + j] = right[j];
      j += 1;
    }
  }
  while (i < left.length) {
    new_arr[i + j] = left[i];
    i += 1; 
  } 
  while (j < right.length) {
    new_arr[i + j] = right[j];
    j += 1;
  }
  return new_arr;
}