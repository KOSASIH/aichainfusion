// contracts/access/AccessControlEnumerable.sol
pragma solidity ^0.8.0;

import "./AccessControl.sol";

contract AccessControlEnumerable is AccessControl {
    mapping (string => address[]) private _roleMembersArray;

    function getRoleMemberCount(string memory role) public view returns (uint256) {
        return _roleMembersArray[role].length;
    }

    function getRoleMember(string memory role, uint256 index) public view returns (address) {
        return _roleMembersArray[role][index];
    }

    function addRoleMember(string memory role, address member) public override onlyAdmin {
        super.addRoleMember(role, member);
        _roleMembersArray[role].push(member);
    }

    function removeRoleMember(string memory role, address member) public override onlyAdmin {
        super.removeRoleMember(role, member);
        for (uint256 i = 0; i < _roleMembersArray[role].length; i++) {
            if (_roleMembersArray[role][i] == member) {
                _roleMembersArray[role][i] = _roleMembersArray[role][_roleMembersArray[role].length - 1];
                _roleMembersArray[role].pop();
                break;
            }
        }
    }
}
