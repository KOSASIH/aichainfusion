pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract ERC1967Upgrade is Initializable {
    address public implementation;

    constructor() Initializable {
        implementation = address(this);
    }

    function upgradeTo(address _newImplementation) public {
        require(msg.sender == implementation, "Only the current implementation can upgrade");
        implementation = _newImplementation;
    }

    function call(bytes memory _data) public returns (bytes memory) {
        return implementation.call(_data);
    }
}
