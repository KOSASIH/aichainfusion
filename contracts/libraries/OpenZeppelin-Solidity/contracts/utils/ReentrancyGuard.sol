// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title ReentrancyGuard
 * @dev A simple contract that ensures that a function cannot be called again before it has finished executing.
 */
contract ReentrancyGuard {
    bool internal _isExecuting;

    /**
     * @dev Modifier to ensure that a function cannot be called again before it has finished executing.
     */
    modifier onlyOnce() {
        require(!_isExecuting, "ReentrancyGuard: function already executing");
        _isExecuting = true;
        _;
        _isExecuting = false;
    }
}
