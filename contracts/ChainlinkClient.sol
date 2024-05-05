pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract ChainlinkClient {
    function buildChainlinkRequest(
        string memory _jobId,
        address _paymentAddress,
        uint256 _callbackGasLimit
    ) internal pure returns (Chainlink.Request memory) {
        Chainlink.Request memory req = new Chainlink.Request(_jobId);
        req.add("payment", _paymentAddress);
        req.add("callbackGasLimit", _callbackGasLimit);
        return req;
    }

    function sendChainlinkRequest(
        Chainlink.Request memory _req,
        uint256 _payment
    ) internal {
        (bool success, bytes memory result) = _req.call({value: _payment});
        require(success, "Failed to send Chainlink request");
    }
}
