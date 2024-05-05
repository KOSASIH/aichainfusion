pragma solidity ^0.8.0;
pragma abicoder v2;

interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}
