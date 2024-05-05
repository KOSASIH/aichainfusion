pragma solidity ^0.8.0;

import "./ERC1155.sol";

contract ERC1155Supply is ERC1155 {
    mapping(uint256 => uint256) private _totalSupply;

    function totalSupply(uint256 id) public view override returns (uint256) {
        return _totalSupply[id];
    }

    function _mint(address account, uint256 id, uint256 amount, bytes memory data) internal {
        require(_owners[id] == address(0), "ERC1155: token already minted");
        _owners[id] = account;
        _totalSupply[id] += amount;
        _balances[account][id] += amount;
        emit TransferSingle(msg.sender, address(0), account, id, amount);
    }

    function _burn(address account, uint256 id, uint256 amount) internal {
        require(_owners[id] == account, "ERC1155: burn from incorrect owner");
        require(_balances[account][id] >= amount, "ERC1155: burn amount exceeds balance");
        _balances[account][id] -= amount;
        _totalSupply[id] -= amount;
        emit TransferSingle(msg.sender, account, address(0), id, amount);
    }
}
