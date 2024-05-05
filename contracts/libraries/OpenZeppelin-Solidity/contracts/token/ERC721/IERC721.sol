// contracts/token/ERC721/ERC721.sol
pragma solidity ^0.8.0;

import "../access/AccessControlEnumerable.sol";
import "./IERC721.sol";
import "./IERC721Metadata.sol";

contract ERC721 is AccessControlEnumerable, IERC721, IERC721Metadata {
    string private _name;
    string private _symbol;
    mapping (address => uint256) private _balances;
    mapping (uint256 => _InternalToken) private _tokens;
    mapping (address => mapping (uint256 => bool)) private _ownedTokens;
    Counters.Counter private _tokenIdCounter;

    constructor(string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function totalSupply() public view returns (uint256) {
        return _tokenIdCounter.current();
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    function ownerOf(uint256 tokenId) public view returns (address) {
        return _ownedTokens[msg.sender][tokenId];
    }

    function approve(address to, uint256 tokenId) public {
        _approve(msg.sender, to, tokenId);
    }

    function getApproved(uint256 tokenId) public view returns (address) {
        return _approved[tokenId];
    }

    function setApprovalForAll(address operator, bool approved) public {
        _setApprovalForAll(msg.sender, operator, approved);
    }

    function isApprovedForAll(address owner, address operator) public view returns (bool) {
        return _isApprovedForAll[owner][operator];
    }

    function transferFrom(address from, address to, uint256 tokenId) public {
        _transfer(from, to, tokenId);
    }

    function _safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) internal {
        _transfer(from, to, tokenId);
        require(to.call(bytes4(keccak256("onERC721Received(address,address,uint256,bytes)")), from, msg.sender, tokenId, data), "ERC721: transfer to non ERC721Receiver implementer");
    }

    function _approve(address owner, address approved, uint256 tokenId) internal {
        require(owner == msg.sender, "ERC721: approve caller is not owner nor approved");
        require(approved != msg.sender, "ERC721: approve to caller");
        require(_ownedTokens[owner][tokenId], "ERC721: approve of non-existent token");
        require(!_approved[tokenId], "ERC721: token already approved");

        _approved[tokenId] = approved;
        emit Approval(owner, approved, tokenId);
    }

    function _setApprovalForAll(address owner, address operator, bool approved) internal {
        require(owner != operator, "ERC721: approve
