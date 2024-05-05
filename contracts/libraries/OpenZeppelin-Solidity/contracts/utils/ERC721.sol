// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Metadata.sol";

contract ERC721 is IERC721, IERC721Enumerable, IERC721Metadata {
    using Address for address;
    using Strings for uint256;

    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => string) private _tokenURIs;
    mapping(address => mapping(address => bool)) private _approvals;
    mapping(address => mapping(address => bool)) private _operatorApprovals;
    uint256 private _nextTokenId;

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );

    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    constructor() {
        _nextTokenId = 1;
    }

    function name() external view override returns (string memory) {
        return "MyNFT";
    }

    function symbol() external view override returns (string memory) {
        return "MNFT";
    }

    function totalSupply() external view override returns (uint256) {
        return _balances.length;
    }

    function balanceOf(address owner) external view override returns (uint256) {
        return _balances[owner];
    }

    function ownerOf(uint256 tokenId) external view override returns (address owner) {
        return _owners[tokenId];
    }

    function approve(address to, uint256 tokenId) external override {
        require(_owners[tokenId] == msg.sender, "ERC721: transfer caller is not owner");
        _approvals[tokenId][to] = true;
        emit Approval(msg.sender, to, tokenId);
    }

    function getApproved(uint256 tokenId) external view override returns (address operator) {
        return _approvals[tokenId][address(0)];
    }

    function setApprovalForAll(address operator, bool _approved) external override {
        _operatorApprovals[msg.sender][operator] = _approved;
        emit ApprovalForAll(msg.sender, operator, _approved);
    }

    function isApprovedForAll(address owner, address operator) external view override returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external override {
        require(_owners[tokenId] == from, "ERC721: transfer caller is not owner");
        require(to != address(0), "ERC721: transfer to the zero address");

        _transfer(from, to, tokenId);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external override {
        require(_owners[tokenId] == from, "ERC721: transfer caller is not owner");
        require(to != address(0), "ERC721: transfer to the zero address");

        _transfer(from, to, tokenId);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external override {
        require(_owners[tokenId] == from, "ERC721: transfer caller is not owner");
        require(to != address(0), "ERC721: transfer to the zero address");

        _transfer(from, to, tokenId);
    }

    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal {
        require(to != address(0), "ERC721: transfer to the zero address");

_beforeTransfer(from, to, tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);

        _afterTransfer(from, to, tokenId);
    }

    function _beforeTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal {
        require(!_isApprovedOrOwner(_approvals[tokenId][address(0)], from, tokenId), "ERC721: transfer to non-approved address");
        require(!_isApprovedOrOwner(_operatorApprovals[from][msg.sender], from, tokenId), "ERC721: transfer to non-approved operator");
    }

    function _afterTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal {
        _approvals[tokenId][address(0)] = address(0);
    }

    function _mint(address to, uint256 tokenId) internal {
        require(_owners[tokenId] == address(0), "ERC721: token already minted");
        require(_nextTokenId <= type(uint256).max, "ERC721: max supply reached");

        _balances[to] += 1;
        _owners[tokenId] = to;
        _nextTokenId += 1;

        emit Transfer(address(0), to, tokenId);
    }

    function tokenOfOwnerByIndex(address owner, uint256 index) external view override returns (uint256 tokenId) {
        require(index < _balances[owner], "ERC721Enumerable: index out of bounds");

        uint256 tokenId = 0;
        uint256 i = 0;
        for (; i < _balances[owner]; i++) {
            if (_owners[_nextTokenId - i - 1] == owner) {
                if (i == index) {
                    return _nextTokenId - i - 1;
                }
            }
        }
    }

    function tokenByIndex(uint256 index) external view override returns (uint256) {
        require(index < totalSupply(), "ERC721Enumerable: index out of bounds");

        uint256 tokenId = 0;
        uint256 i = 0;
        for (; i < totalSupply(); i++) {
            if (_owners[i] != address(0)) {
                if (i == index) {
                    return i;
                }
            }
        }
    }

    function supportsInterface(bytes4 interfaceId) external view override returns (bool) {
        return IERC721Metadata.supportsInterface(interfaceId) ||
            IERC721Enumerable.supportsInterface(interfaceId);
    }

    function tokenURI(uint256 tokenId) external view override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory baseURI = "";
        if (baseURI != "") {
            return baseURI + _tokenURIs[tokenId];
        } else {
            return _tokenURIs[tokenId];
        }
    }

    function _exists(uint256 tokenId) internal view returns (bool) {
        return _owners[tokenId] != address(0);
    }

    function _setTokenURI(uint256 tokenId, string memory uri) internal {
        require(_exists(tokenId), "ERC721Metadata: setting URI of nonexistent token");

        _tokenURIs[tokenId] = uri;
    }
}
