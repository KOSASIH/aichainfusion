// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Address {
    function isContract(address account) public view returns (bool) {
        // Check if the account is a contract by looking at its code size
        return account.code.length > 0;
    }

    function sendValue(address payable recipient, uint256 amount) public payable {
        // Send the specified amount of wei to the recipient
        require(recipient.send(amount), "Transfer failed.");
    }

    function transferValue(address payable recipient, uint256 amount) public {
        // Transfer the specified amount of wei to the recipient
        recipient.transfer(amount);
    }
}
