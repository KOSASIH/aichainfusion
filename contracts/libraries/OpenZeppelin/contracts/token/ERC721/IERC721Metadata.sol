pragma solidity ^0.8.0;

interface IERC721Metadatais IERC721 {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
}
