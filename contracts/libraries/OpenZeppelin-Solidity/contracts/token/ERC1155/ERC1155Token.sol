pragma solidity ^0.8.0;

import "./ERC1155Supply.sol";

contract ERC1155Token is ERC1155Supply {
    string private _name;
    string private _symbol;

    constructor(string memory name, string memory symbol) {
        _name = name;
        _symbol = symbol;
    }

    function name() public view override returns (string memory) {
        return _name;
    }

    function symbol() public view override returns (string memory) {
        return _symbol;
    }
}
