pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract UUPSUpgradeableBeacon is Initializable {
    address public implementation;

    constructor() Initializable {
        implementation = address(0);
    }

    function upgradeTo(address _newImplementation) public {
        require(msg.sender == implementation, "Only the current implementation can upgrade");
        implementation = _newImplementation;
    }

    function call(bytes memory _data) public returns (bytes memory) {
        return implementation.call(_data);
    }
}
