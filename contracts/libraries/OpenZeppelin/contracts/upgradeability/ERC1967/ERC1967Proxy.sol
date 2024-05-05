pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract ERC1967Proxy is Initializable {
    address public admin;
    address public implementation;

    constructor(address _implementation) Initializable {
        admin = msg.sender;
        implementation = _implementation;
    }

    function upgradeTo(address _newImplementation) public {
        require(msg.sender == admin, "Only admin can upgrade the contract");
        implementation = _newImplementation;
    }

    function call(bytes memory _data) public returns (bytes memory) {
        return implementation.call(_data);
    }
}
