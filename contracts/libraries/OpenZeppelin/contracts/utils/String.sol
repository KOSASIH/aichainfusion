// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Strings {
    function length(string memory s) public view returns (uint256) {
        // Return the length of the string s
        return s.length;
    }

    function concat(string memory a, string memory b) public pure returns (string memory) {
        // Return the concatenation of strings a and b
        return string(abi.encodePacked(a, b));
    }

    function slice(string memory s, uint256 start, uint256 end) public view returns (string memory) {
        // Return a substring of s starting at index start and ending at index end
        bytes memory b = bytes(s);
        require(start < b.length, "Start index out of bounds.");
        require(end <= b.length, "End index out of bounds.");
        require(start <= end, "End index must be greater than start index.");
        bytes memory sub = new bytes(end - start);
        for (uint256 i = start; i < end; i++) {
            sub[i - start] = b[i];
        }
        return string(sub);
    }
}
