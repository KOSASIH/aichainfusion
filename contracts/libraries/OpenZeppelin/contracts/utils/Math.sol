// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Math {
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        // Return the sum of a and b
        return a + b;
    }

    function subtract(uint256 a, uint256 b) public pure returns (uint256) {
        // Return the difference between a and b
        return a - b;
    }

    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        // Return the product of a and b
        return a * b;
    }

    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        // Return the quotient of a and b
        require(b > 0, "Division by zero.");
        return a / b;
    }

    function modulo(uint256 a, uint256 b) public pure returns (uint256) {
        // Return the remainder of a divided by b
        require(b > 0, "Division by zero.");
        return a % b;
    }
}
