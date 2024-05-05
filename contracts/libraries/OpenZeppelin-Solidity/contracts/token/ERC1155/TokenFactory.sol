pragma solidity ^0.8.0;

import "./ERC1155Token.sol";

contract TokenFactory {
    mapping(address => address[]) public _tokens;
    mapping(address => address) public _ownerToToken;

    function createToken(string memory name, string memory symbol) public returns (address) {
        ERC1155Token token = new ERC1155Token(name, symbol);
        _tokens[msg.sender].push(address(token));
        _ownerToToken[address(token)] = msg.sender;
        return address(token);
    }

    function getTokens() public view returns (address[] memory) {
        return _tokens[msg.sender];
    }

    function getToken(uint256 index) public view returns (address) {
        return _tokens[msg.sender][index];
    }

    function getOwner(address token) public view returns (address) {
        return _ownerToToken[token];
    }
}
