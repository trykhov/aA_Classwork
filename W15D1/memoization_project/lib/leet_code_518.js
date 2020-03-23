// Work through this problem on https://leetcode.com/problems/coin-change-2/ and use the specs given there.
// Feel free to use this file for scratch work.

function coinChange2(amount, coins) {
    const change = new Array(amount + 1).fill(0);
    change[0] = 1;
    for(let coin of coins) {
        for(let i = 1; i < change.length; i++) {
            change[i] += i - coin > -1 ? change[i - coin] : 0;
        }
    }
    return change[amount];
}