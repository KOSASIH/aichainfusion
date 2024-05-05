pragma solidity ^0.8.0;
pragma abicoder v2;

interface IERC721Metadata {
    function name()external view returns (string memory);
    function symbol() external view returns (string memory);
    function tokenURI(uint256 tokenId) external view returns (string memory);
}
