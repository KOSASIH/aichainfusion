// contracts/access/AccessControl.sol
pragma solidity ^0.8.0;

import "./Context.sol";
import "./Roles.sol";

contract AccessControl {
    address private _owner;
    mapping (address => bool) private _admins;
    mapping (string => mapping (address => bool)) private _roleMembers;

    constructor() public {
        _owner = msg.sender;
        _admins[msg.sender] = true;
    }

    modifier onlyOwner() {
        require(msg.sender == _owner, "Only the owner can call this function");
        _;
    }

    modifier onlyAdmin() {
        require(_admins[msg.sender], "Only admins can call this function");
        _;
    }

    function addAdmin(address newAdmin) public onlyOwner {
        _admins[newAdmin] = true;
    }

    function removeAdmin(address oldAdmin) public onlyOwner {
        _admins[oldAdmin] = false;
    }

    function hasRole(string memory role, address account) public view returns (bool) {
        return _roleMembers[role][account];
    }

    function addRoleMember(string memory role, address member) public onlyAdmin {
        _roleMembers[role][member] = true;
    }

    function removeRoleMember(string memory role, address member) public onlyAdmin {
        _roleMembers[role][member] = false;
    }
}
