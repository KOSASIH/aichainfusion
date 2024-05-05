pragma solidity ^0.8.0;

import "./ERC721.sol";

contract ERC721Burnable is ERC721 {
    function burn(uint256 tokenId) public {
        require(_owners[tokenId] == msg.sender, "ERC721Burnable: caller is not owner nor approved");
        require(_approvals[tokenId] == address(0) || _approvals[tokenId] == msg.sender || _operatorApprovals[_owners[tokenId]][msg.sender], "ERC721Burnable: transfer not approved");
        _balances[_owners[tokenId]] -= 1;
        delete _owners[tokenId];
        emit Transfer(_owners[tokenId], address(0), tokenId);
    }
}
