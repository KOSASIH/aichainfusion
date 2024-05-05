pragma solidity ^0.8.0;

import "./ERC1155.sol";

contract ERC1155URI is ERC1155 {
    string private _uri;

    constructor(string memory uri) {
        _uri = uri;
    }

    function uri(uint256) public view override returns (string memory) {
        return _uri;
    }
}
