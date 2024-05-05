pragma solidity ^0.8.0;
pragma abicoder v2;

interface IERC1155 {
    function balanceOf(address account, uint256 id) external view returns (uint256);
    function balanceOfBatch(address[] memory accounts, uint256[] memory ids) external view returns (uint256[] memory);
    function setApprovalForAll(address operator, bool approved) external;
    function isApprovedForAll(address owner, address operator) external view returns (bool);
    function safeTransferFrom(address from, address to, uint256 id, uint256 value) external payable;
    function safeBatchTransferFrom(address from, address to, uint256[] memory ids, uint256[] memory values) external payable;
    function getApproved(uint256 id) external view returns (address);
    function interfaceId(string memory interfaceName) external pure returns (bytes4);
}
