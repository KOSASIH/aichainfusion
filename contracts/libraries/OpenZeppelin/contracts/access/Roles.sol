pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Roles.sol";

contract MyContract is Roles {
    constructor() Roles("MyContract") {}

    // Add roles and assign permissions here
}
