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
  let induction = subRec(arr.slice(1))
  return induction + arr[0];
  
}