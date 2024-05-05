pragma solidity ^0.8.0;
pragma abicoder v2;

interface IERC1155Metadata {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function uri(uint256 id) external view returns (string memory);
}
