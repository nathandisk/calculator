// SPDX-License-Identifier: Public Domain
pragma solidity ^0.8.0;

contract Calculator {
    
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
    
    function subtract(uint256 a, uint256 b) public pure returns (uint256) {
        require(a >= b, "Result would be negative");
        return a - b;
    }
    
    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }
    
    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        require(b != 0, "Cannot divide by zero");
        return a / b;
    }
    
    function modulus(uint256 a, uint256 b) public pure returns (uint256) {
        require(b != 0, "Cannot divide by zero");
        return a % b;
    }
    
    function exponent(uint256 base, uint256 exp) public pure returns (uint256) {
        return power(base, exp);
    }
    
    function factorial(uint256 n) public pure returns (uint256) {
        require(n >= 0, "Factorial of negative number is not defined");
        uint256 result = 1;
        for (uint256 i = 1; i <= n; i++) {
            result *= i;
        }
        return result;
    }
    
    function squareRoot(uint256 x) public pure returns (uint256) {
        uint256 z = (x + 1) / 2;
        uint256 y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
        return y;
    }
    
    function power(uint256 base, uint256 exp) private pure returns (uint256) {
        uint256 result = 1;
        for (uint256 i = 0; i < exp; i++) {
            result *= base;
        }
        return result;
    }
}
