// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title UUPSUpgradeable
 * @dev Implements upgradeability using the UUPS pattern.
 */
contract UUPSUpgradeable {
    // Storage position of the implementation address
    address private immutable _implementation;

    /**
     * @dev Initializes the implementation address.
     */
    constructor(address implementation_) {
        _implementation = implementation_;
    }

    /**
     * @dev Delegates the current call to the implementation.
     */
    fallback() external payable {
        _delegate(_implementation);
    }

    /**
     * @dev Delegates the current call to the implementation.
     */
    receive() external payable {
        _delegate(_implementation);
    }

    /**
     * @dev Delegates the current call to the implementation.
     */
    function _delegate(address implementation) internal {
        assembly {
            // Copy msg.sender and msg.data to memory
            calldatacopy(0, 0, calldatasize())

            // Call the implementation
            let result := delegatecall(gas(), implementation, 0, calldatasize(), 0, 0)

            // Copy the return data to memory
            returndatacopy(0, 0, returndatasize())

            // Return the return data
            switch result
                case 0 {
                    revert(0, returndatasize())
                }
                default {
                    return(0, returndatasize())
                }
        }
    }

    /**
     * @dev Upgrades the implementation address.
     * @param newImplementation The new implementation address.
     */
    function _upgradeTo(address newImplementation) internal {
        _implementation = newImplementation;
    }

    /**
     * @dev Upgrades the implementation address.
     * @param newImplementation The new implementation address.
     */
    function upgradeTo(address newImplementation) public {
        _upgradeTo(newImplementation);
    }

    /**
     * @dev Upgrades the implementation address and calls a function on the new implementation.
     * @param newImplementation The new implementation address.
     * @param data The data to pass to the function.
     */
    function upgradeToAndCall(address newImplementation, bytes memory data) public payable {
        _upgradeTo(newImplementation);
        (bool success,) = newImplementation.delegatecall(data);
        require(success, "UUPSUpgradeable: delegatecall failed");
    }
}
