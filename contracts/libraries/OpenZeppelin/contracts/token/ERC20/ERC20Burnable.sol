pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";

contract MyERC20Burnable is ERC20Burnable {
    constructor(uint256 initialSupply, string memory name, string memory symbol) ERC20Burnable(name, symbol) {
        _mint(msg.sender, initialSupply);
    }
}
