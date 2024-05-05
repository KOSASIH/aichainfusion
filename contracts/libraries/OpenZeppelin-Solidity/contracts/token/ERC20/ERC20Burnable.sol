// contracts/token/ERC20/ERC20Burnable.sol
pragma solidity ^0.8.0;

import "../ERC20.sol";

contract ERC20Burnable is ERC20 {
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function burnFrom(address account, uint256 amount) public {
        uint256 currentAllowance = allowance(account, msg.sender);
        require(currentAllowance >= amount, "ERC20: burn amount exceeds allowance");
        _approve(account, msg.sender, currentAllowance - amount);
        _burn(account, amount);
    }
}
