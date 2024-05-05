pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721Burnable.sol";

contract MyERC721Burnable is ERC721Burnable {
    constructor(string memory name, string memory symbol) ERC721Burnable(name, symbol) {}
}
