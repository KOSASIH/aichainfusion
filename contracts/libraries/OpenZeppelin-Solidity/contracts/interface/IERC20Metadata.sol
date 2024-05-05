pragma solidity ^0.8.0;
pragma abicoder v2;

interface IERC20Metadata {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
}
