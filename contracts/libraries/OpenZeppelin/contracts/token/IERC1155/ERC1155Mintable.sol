pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155Mintable.sol";

contract MyERC1155Mintable is ERC1155Mintable {
    constructor() ERC1155Mintable() {}
}
