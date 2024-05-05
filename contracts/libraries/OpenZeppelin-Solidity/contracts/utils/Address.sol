// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Address {
    /**
     * @dev Returns whether the target address is a contract
     * @param target The target address to check
     */
    function isContract(address target) internal view returns (bool) {
        return target.code.length > 0;
    }

    /**
     * @dev Sends ether to the target address
     * @param target The target address to send ether to
     * @param value The amount of ether to send
     */
    function sendValue(address payable target, uint256 value) internal {
        require(address(this).balance >= value, "Address: insufficient balance");
        (bool success, ) = target.call{value: value}("");
        require(success, "Address: unable to send value");
    }
}
