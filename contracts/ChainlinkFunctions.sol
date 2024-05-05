pragma solidity ^0.8.0;

abstract contract ChainlinkFunctions {
    GeneralFunction public inputFunction;
    GeneralFunction public outputFunction;

    abstract function generalFunction(
        bytes32[] calldata _data
    ) external;

    function callInputFunction(
        bytes32[] calldata _data
    ) external {
        inputFunction.generalFunction(_data);
    }

    function callOutputFunction(
        bytes32[] calldata _data
    ) external {
        outputFunction.generalFunction(_data);
    }
}

contract GeneralFunction {
    ChainlinkFunctions internal _chainlinkFunctions;

    constructor(
        ChainlinkFunctions _chainlinkFunctions
    ) {
        _chainlinkFunctions = _chainlinkFunctions;
    }

    function generalFunction(
        bytes32[] calldata _data
    ) external {
        _chainlinkFunctions.generalFunction(_data);
    }
}
