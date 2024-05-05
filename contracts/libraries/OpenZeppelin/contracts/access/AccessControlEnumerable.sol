pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";

contract MyContract is AccessControlEnumerable {
    constructor() AccessControlEnumerable("MyContract") {}

    // Add roles and assign permissions here
}
