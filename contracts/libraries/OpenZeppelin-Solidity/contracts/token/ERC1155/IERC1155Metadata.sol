pragma solidity ^0.8.0;

interface IERC1155Metadata is IERC1155 {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function uri(uint256 id) external view returns (string memory);
}
