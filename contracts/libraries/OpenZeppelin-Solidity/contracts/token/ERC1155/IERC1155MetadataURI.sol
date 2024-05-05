pragma solidity ^0.8.0;

interface IERC1155MetadataURI is IERC1155Metadata {
    function uri(uint256 id) external view returns (string memory);
}
