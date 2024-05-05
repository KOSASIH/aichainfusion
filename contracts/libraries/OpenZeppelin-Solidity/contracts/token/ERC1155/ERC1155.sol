pragma solidity ^0.8.0;

import "./IERC1155.sol";
import "./IERC1155Metadata.sol";
import "./IERC1155MetadataURI.sol";
import "./IERC1155Supply.sol";

contract ERC1155 is IERC1155, IERC1155Metadata, IERC1155MetadataURI, IERC1155Supply {
    mapping(address => mapping(uint256 => uint256)) private _balances;
    mapping(uint256 => address) private _owners;
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    constructor() {
    }

    function balanceOf(address owner, uint256 id) public view override returns (uint256) {
        return _balances[owner][id];
    }

    function balanceOfBatch(address[] memory accounts, uint256[] memory ids) public view override returns (uint256[] memory) {
        uint256 length = accounts.length;
        uint256[] memory result = new uint256[](length);
        for (uint256 i = 0; i < length; i++) {
            result[i] = _balances[accounts[i]][ids[i]];
        }
        return result;
    }

    function ownerOf(uint256 id) public view override returns (address) {
        return _owners[id];
    }

    function approve(address to, uint256 id, uint256 amount) public override {
        _approvals[id] = to;
        emit Approval(msg.sender, to, id, amount);
    }

    function getApproved(uint256 id) public view override returns (address) {
        return _approvals[id];
    }

    function isApprovedForAll(address owner, address operator) public view override returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    function setApprovalForAll(address operator, bool approved) public override {
        _operatorApprovals[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
    }

    function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes memory data) public override {
        require(_balances[from][id] >= amount, "ERC1155: transfer amount exceeds balance");
        require(_owners[id] == from, "ERC1155: transfer from incorrect owner");
        require(_approvals[id] == address(0) || _approvals[id] == to || _operatorApprovals[from][to], "ERC1155: transfer not approved");
        _balances[from][id] -= amount;
        _balances[to][id] += amount;
        emit TransferSingle(msg.sender, from, to, id, amount);
        if (to.code.length > 0) {
            bytes memory data
