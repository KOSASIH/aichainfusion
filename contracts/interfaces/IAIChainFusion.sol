pragma solidity ^0.8.0;

interface IAIChainFusion {
    function requestInputData(
        string memory _jobId,
        string memory _feed,
        uint256 _payment,
        uint256 _callbackGasLimit
    ) external;

    function requestOutputData(
        string memory _jobId,
        string memory _feed,
        uint256 _payment,
        uint256 _callbackGasLimit
    ) external;
}
