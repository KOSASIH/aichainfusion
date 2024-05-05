pragma solidity ^0.8.0;

import "./IERC721.sol";
import "./IERC721Enumerable.sol";
import "./IERC721Metadata.sol";

contract ERC721 is IERC721, IERC721Enumerable, IERC721Metadata {
    address private _owner;
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _owners;
    mapping(uint256 => address) private _approvals;
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    constructor() {
        _owner = msg.sender;
    }

    function balanceOf(address owner) public view override returns (uint256) {
        return _balances[owner];
    }

    function ownerOf(uint256 tokenId) public view override returns (address) {
        return _owners[tokenId];
    }

    function getApproved(uint256 tokenId) public view override returns (address) {
        return _approvals[tokenId];
    }

    function isApprovedForAll(address owner, address operator) public view override returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    function approve(address to, uint256 tokenId) public override {
        _approvals[tokenId] = to;
        emit Approval(_owners[tokenId], to, tokenId);
    }

    function setApprovalForAll(address operator, bool approved) public override {
        _operatorApprovals[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
    }

    function transferFrom(address from, address to, uint256 tokenId) public override {
        require(_owners[tokenId] == from, "ERC721: transfer from incorrect owner");
        require(_approvals[tokenId] == msg.sender || _operatorApprovals[from][msg.sender], "ERC721: transfer not approved");
        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;
        emit Transfer(from, to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId) public override {
        transferFrom(from, to, tokenId);
        if (to.code.length > 0) {
            bytes memory data = abi.encodeWithSelector(IERC721.onERC721Received.selector, msg.sender, from, tokenId, "");
            require(to.call(data), "ERC721: transfer to non ERC721Receiver implementer");
        }
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public override {
        transferFrom(from, to, tokenId);
        if (to.code.length > 0) {
            require(to.call(abi.encodeWithSelector(IERC721.onERC721Received.selector, msg.sender, from, tokenId, data)), "ERC721: transfer to non ERC721Receiver implementer");
        }
    }

    function totalSupply() public view override returns (uint256) {
        return _balances[_owner];
    }

    function tokenOfOwnerByIndex(address owner, uint256 index) public view override returns (uint256) {
       require(owner == msg.sender, "ERC721: caller is not owner nor approved");
        uint256 tokenId = 0;
        uint256 i = 0;
        while (i < _balances[owner]) {
            if (_owners[tokenId] == owner) {
                if (i == index) {
                    return tokenId;
                }
                i += 1;
            }
            tokenId += 1;
        }
    }

    function tokenByIndex(uint256 index) public view override returns (uint256) {
        require(_balances[_owner] > index, "ERC721: index out of bounds");
        uint256 tokenId = 0;
        uint256 i = 0;
        while (i < _balances[_owner]) {
            if (i == index) {
                return tokenId;
            }
            i += 1;
            tokenId += 1;
        }
    }

    function name() public view override returns (string memory) {
        return "ERC721";
    }

    function symbol() public view override returns (string memory) {
        return "ERC721";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return "";
    }
}
