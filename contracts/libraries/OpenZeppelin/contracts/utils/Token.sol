// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Tokens {
    function transfer(
        IERC20 token,
        address recipient,
        uint256 amount
    ) public{
        // Transfer the specified amount of tokens from the calling address to the recipient
        token.transferFrom(msg.sender, recipient, amount);
    }

    function approve(
        IERC20 token,
        address spender,
        uint256 amount
    ) public {
        // Approve the spender to transfer the specified amount of tokens on behalf of the calling address
        token.approve(spender, amount);
    }

    function transferFrom(
        IERC20 token,
        address sender,
        address recipient,
        uint256 amount
    ) public {
        // Transfer the specified amount of tokens from the sender to the recipient,
        // with the caller's approval
        token.transferFrom(sender, recipient, amount);
    }
}
