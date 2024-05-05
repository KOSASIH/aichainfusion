pragma solidity ^0.8.0;

interface IChainlinkClient {
    function buildChainlinkRequest(
        string memory _jobId,
        address _paymentAddress,
        uint256 _callbackGasLimit
    ) external pure returns (bytes memory);

    function sendChainlinkRequest(
        bytes memory _req,
        uint256 _payment
    ) external;
}
