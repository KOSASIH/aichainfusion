pragma solidity ^0.8.0;
pragma abicoder v2;

interface IERC1820Registry {
    function setManager(address addr, address newManager) external;
    function getManager(address addr) external view returns (address);
    function setInterfaceImplementer(address addr, bytes32 interfaceHash, address implementer) external;
    function getInterfaceImplementer(address addr, bytes32 interfaceHash) external view returns (address);
    function interfaceHash(string calldata interfaceName) external pure returns (bytes32);
}
