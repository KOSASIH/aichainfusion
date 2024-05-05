pragma solidity ^0.8.0;

interface IERC1155Supply is IERC1155 {
    function totalSupply(uint256 id) external view returns (uint256);
}
