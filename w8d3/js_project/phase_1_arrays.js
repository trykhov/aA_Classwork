Array.prototype.uniq = function() {
  let hash = {};
  const result = [];
  for(let i = 0; i < this.length; i++) {
    el = this[i];
    if(!hash[el]) {
      result.push(el);
      hash[el] = true;
    }
  }
  return result;
}


Array.prototype.twoSum = function() {
  const result = [];
  const helper_hash = {};
  // debugger
  for(let i = 0; i < this.length; i++) {
    let el = this[i];
    if(helper_hash[-el] != null) {
      result.push([i, helper_hash[-el]]);
    }
    helper_hash[el] = i;
  }
  return result;
}

new Array(3) 

Array.prototype.transpose = function() {
  const rows = this[0].length;
  const cols = this.length;
  let result_matrix = new Array(rows).fill(0).map(() => new Array(cols).fill(0));
  for(let i = 0; i < this.length; i++) {
    for(let j = 0; j < this[i].length; j++) {
      result_matrix[j][i] = this[i][j];
    }
  }
  return result_matrix;
}

