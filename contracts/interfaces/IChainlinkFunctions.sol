pragma solidity ^0.8.0;

interface IChainlinkFunctions {
    function inputFunction(
        bytes32[] calldata _data
    ) external;

    function outputFunction(
        bytes32[] calldata _data
    ) external;
}
