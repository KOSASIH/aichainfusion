pragma solidity ^0.8.0;
pragma abicoder v2;

interface ISignatureMintERC721 {
    function mint(address to, uint256 tokenId) external;
    function mintWithSignature(address to, uint256 tokenId, bytes calldata signature) external;
}
