// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Math {
    /**
     * @dev Returns the minimum of `x` and `y`
     * @param x The first value to compare
     * @param y The second value to compare
     */
    function min(uint256 x, uint256 y) internal pure returns (uint256) {
        return x < y ? x : y;
    }

    /**
     * @dev Returns the maximum of `x` and `y`
     * @param x The first value to compare
     * @param y The second value to compare
     */
    function max(uint256 x, uint256 y) internal pure returns (uint256) {
        return x > y ? x : y;
    }

    /**
     * @dev Returns the sum of `x` and `y`
     * @param x The first value to add
     * @param y The second value to add
     */
    function add(uint256 x, uint256 y) internal pure returns (uint256) {
        return x + y;
    }

    /**
     * @dev Returns the difference between `x` and `y`
     * @param x The value to subtract from
     * @param y The value to subtract
     */
    function sub(uint256 x, uint256 y) internal pure returns (uint256) {
        return x - y;
    }

    /**
     * @dev Returns the product of `x` and `y`
     * @param x The first value to multiply
     * @param y The second value to multiply
     */
    function mul(uint256 x, uint256 y) internal pure returns (uint256) {
        return x * y;
    }

    /**
     * @dev Returns the quotient of `x` and `y`
     * @param x The dividend
     * @param y The divisor
     */
    function div(uint256 x, uint256 y) internal pure returns (uint256) {
        require(y != 0, "Math: division by zero");
        return x / y;
    }

    /**
     * @dev Returns the remainder of `x` and `y`
     * @param x The dividend
     * @param y The divisor
     */
    function mod(uint256 x, uint256 y) internal pure returns (uint256) {
        require(y != 0, "Math: modulo by zero");
        return x % y;
    }
}
