// SPDX-License-Identifier: Public Domain
pragma solidity ^0.8.0;

contract StatefulCalculator {
    
    uint256 private storedResult;
    bool private hasStoredResult;

    function clearStoredResult() public {
        storedResult = 0;
        hasStoredResult = false;
    }

    function add(uint256 a, uint256 b) public returns (uint256) {
        uint256 result = hasStoredResult ? storedResult + a : a + b;
        _storeResult(result);
        return result;
    }
    
    function subtract(uint256 a, uint256 b) public returns (uint256) {
        uint256 result;
        if (hasStoredResult) {
            require(storedResult >= a, "Result would be negative");
            result = storedResult - a;
        } else {
            require(a >= b, "Result would be negative");
            result = a - b;
        }
        _storeResult(result);
        return result;
    }
    
    function multiply(uint256 a, uint256 b) public returns (uint256) {
        uint256 result = hasStoredResult ? storedResult * a : a * b;
        _storeResult(result);
        return result;
    }
    
    function divide(uint256 a, uint256 b) public returns (uint256) {
        uint256 result;
        if (hasStoredResult) {
            require(a != 0, "Cannot divide by zero");
            result = storedResult / a;
        } else {
            require(b != 0, "Cannot divide by zero");
            result = a / b;
        }
        _storeResult(result);
        return result;
    }
    
    function modulus(uint256 a, uint256 b) public returns (uint256) {
        uint256 result;
        if (hasStoredResult) {
            require(a != 0, "Cannot divide by zero");
            result = storedResult % a;
        } else {
            require(b != 0, "Cannot divide by zero");
            result = a % b;
        }
        _storeResult(result);
        return result;
    }
    
    function exponent(uint256 base, uint256 exp) public returns (uint256) {
        uint256 result = hasStoredResult ? power(storedResult, base) : power(base, exp);
        _storeResult(result);
        return result;
    }
    
    function factorial(uint256 n) public returns (uint256) {
        require(n >= 0, "Factorial of negative number is not defined");
        uint256 value = hasStoredResult ? storedResult : n;
        uint256 result = 1;
        for (uint256 i = 1; i <= value; i++) {
            result *= i;
        }
        _storeResult(result);
        return result;
    }
    
    function squareRoot(uint256 x) public returns (uint256) {
        uint256 value = hasStoredResult ? storedResult : x;
        uint256 z = (value + 1) / 2;
        uint256 y = value;
        while (z < y) {
            y = z;
            z = (value / z + z) / 2;
        }
        _storeResult(y);
        return y;
    }

    function power(uint256 base, uint256 exp) private pure returns (uint256) {
        uint256 result = 1;
        for (uint256 i = 0; i < exp; i++) {
            result *= base;
        }
        return result;
    }
    
    function _storeResult(uint256 result) private {
        storedResult = result;
        hasStoredResult = true;
    }

    function getStoredResult() public view returns (uint256) {
        require(hasStoredResult, "No stored result available");
        return storedResult;
    }
}
