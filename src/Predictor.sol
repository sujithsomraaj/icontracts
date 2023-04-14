// SPDX-License-Identifier: Apache 3.0
pragma solidity ^0.8.13;

/// @title Sum Predictor Contract
/// @author Sujith Somraaj | twitter.com/sujithsomraaj
/// @dev To Demonstrate That Predictability & Cache Can Save A Lot Of Gas
contract Predictor {
    /// @dev caches previous results
    mapping(uint256 => mapping(uint256 => uint256)) public cache;

    /// @dev will add two variables if there is a cache miss
    /// else will return the value from cache
    /// @param a is the first variable
    /// @param b is the second variable
    /// @return the value of their sum looped over 500 times
    function add(uint256 a, uint256 b) external returns (uint256) {
        if (cache[a][b] == 0 && cache[b][a] == 0) {
            uint256 tempSum;
            for (uint256 i = 0; i < 500; i++) {
                tempSum = tempSum + a + b;
            }
            cache[a][b] = tempSum;
            return tempSum;
        } else {
            return cache[a][b];
        }
    }

    /// @dev simply adds the given 2 numbers, 500 times and return the sum
    /// @param a is the first variable
    /// @param b is the second variable
    function simpleAdd(
        uint256 a,
        uint256 b
    ) external pure returns (uint256 sum) {
        for (uint256 i = 0; i < 500; i++) {
            sum += a + b;
        }
    }
}
