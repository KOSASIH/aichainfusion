pragma solidity ^0.8.0;

interface IERC1155 {
    function balanceOf(address account, uint256 id) external view returns (uint256);
    function balanceOfBatch(address[] memory accounts, uint256[] memory ids) external view returns (uint256[] memory);
    function setApprovalForAll(address operator, bool approved) external;
    function isApprovedForAll(address owner, address operator) external view returns (bool);
    function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes memory data) external;
    function safeBatchTransferFrom(address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data) external;

    event TransferSingle(address indexed from, address indexed to, uint256 id, uint256 value);
    event TransferBatch(address indexed from, address indexed to, uint256[] calldata ids, uint256[] calldata values);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);
}
