pragma solidity ^0.8.0;

interface IERC721Enumerable is IERC721 {
    function tokenByIndex(uint256 index) external view returns (uint256);
    function tokenOfOwnerByIndex(address owner, uint256 index) external view returns (uint256);
    function indexOf(uint256 tokenId) external view returns (uint256);
    function indexOfTokenOfOwner(address owner, uint256 tokenId) external view returns (uint256);
}
