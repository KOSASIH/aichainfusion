pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Context.sol";

contract MyContract is Context {
    constructor() Context("MyContract") {}
}
