pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract MyContract is AccessControl {
    constructor() AccessControl("MyContract") {}

    // Add roles and assign permissions here
}
