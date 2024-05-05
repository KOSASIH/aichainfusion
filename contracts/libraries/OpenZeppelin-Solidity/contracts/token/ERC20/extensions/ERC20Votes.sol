// contracts/token/ERC20/extensions/ERC20Votes.sol
pragma solidity ^0.8.0;

import "../ERC20.sol";
import "../../../utils/math/SafeCast.sol";
import "../../../utils/Counters.sol";
import "../../../access/IAccessControlEnumerable.sol";

contract ERC20Votes is ERC20, IAccessControlEnumerable {
    using SafeCast for uint256;
    using Counters for Counters.Counter;

    struct Delegate {
        address account;
        uint256 votes;
    }

    struct Checkpoint {
        uint32 fromBlock;
        uint256 votes;
    }

    mapping (address => Delegate) private _delegates;
    mapping (address => Checkpoint[]) private _checkpoints;
    Counters.Counter private _numCheckpoints;

    constructor(string memory name, string memory symbol, uint8 decimals) ERC20(name, symbol, decimals) {
    }

    function getVotes(address account) public view returns (uint256) {
        return _getVotes(account, _checkpoints[account].length - 1);
    }

    function getPastVotes(address account, uint256 blockNumber) public view returns (uint256) {
        return _getVotes(account, _getCheckpointIndex(account, blockNumber));
    }

    function getPastTotalSupply(uint256 blockNumber) public view returns (uint256) {
        return _totalSupplyAt(_checkpoints[address(0)].length - 1, blockNumber);
    }

    function delegate(address delegatee) public {
        return _delegate(msg.sender, delegatee);
    }

    function delegateBySig(address delegatee, uint256 nonce, uint256 expiry, uint8 v, bytes32 r, bytes32 s) public {
        require(block.timestamp <= expiry, "ERC20Votes: signature expired");
        address signer = ecrecover(keccak256(abi.encodePacked(abi.encodePacked(nonce, expiry, msg.sender), delegatee)), v, r, s);
        require(signer != address(0), "ERC20Votes: invalid signature");
        return _delegate(msg.sender, delegatee);
    }

    function _delegate(address delegator, address delegatee) internal {
        address currentDelegate = _delegates[delegator].account;
        uint256 delegatorBalance = balanceOf(delegator);
        _delegates[delegator].account = delegatee;

        emit DelegateChanged(delegator, currentDelegate, delegatee);

        _moveDelegates(currentDelegate, delegatee, delegatorBalance);
    }

    function _moveDelegates(address srcRep, address dstRep, uint256 amount) internal {
        if (srcRep != dstRep && amount > 0) {
            if (srcRep != address(0)) {
                uint32 srcRepNum = numCheckpoints[srcRep];
                uint256 srcRepOld = srcRepNum > 0 ? checkpoints[srcRep][srcRepNum - 1].votes : 0;
                uint256 srcRepNew = srcRepOld - amount;
                _writeCheckpoint(srcRep, srcRepNum, srcRepOld, srcRepNew);
            }

            if (dstRep != address(0)) {
                uint32 dstRepNum = numCheckpoints[dstRep];
                uint delegatee);
    }

    function delegateBySig(address delegatee, uint256 nonce, uint256 expiry, uint8 v, bytes32 r, bytes32 s) public {
        require(block.timestamp <= exp256 dstRepOld = dstRepNum > 0 ? checkpoints[dstRep][dstRepNum - 1].votes : 0;
                uint256 dstRepNew = dstRepOld + amount;
                _writeCheckpoint(dstRep, dstRepNum, dstRepOld, dstRepNew);
iry, "ERC20Votes: signature expired");
        address signer = ecrecover(keccak256(abi.encodePacked(byte            }
        }
    }

    function _writeCheckpoint(address delegatee, uint32 nCheckpoints, uint256 oldVotes, uint256 newVotes) internal(0x19), byte(0), address(this), nonce, delegatee, expiry)), v, r, s);
        require(signer != address(0), "ERC20 {
      uint32 blockNumber = safe32(block.number, "ERC20Votes: block number exceeds 32 bits");

      if (Votes: invalid signature");
        return _delegate(signer, delegatee);
    }

    function _delegate(address delegator, address delegatee) internal {
nCheckpoints > 0 && checkpoints[delegatee][nCheckpoints - 1].fromBlock == blockNumber) {
          checkpoints[delegatee][nCheckpoints - 1].votes = newV        address currentDelegate = _delegates[delegator].account;
        uint256 delegatorBalance = balanceOf(delegator);
        _delegates[delegator].accountotes;
      } else {
          checkpoints[delegatee][nCheckpoints] = Checkpoint(blockNumber, newVotes);
          numCheckpoints[delegatee] = nCheckpoints +  = delegatee;

        emit DelegateChanged(delegator, currentDelegate, delegatee);

        _moveDelegates(currentDelegate, delegatee, delegatorBalance);
    }

1;
      }

      emit DelegateVotesChanged(delegatee, oldVotes, newVotes);
    }

    function _getVotes(address account, uint32 nCheck    function _moveDelegates(address srcRep, address dstRep, uint256 amount) internal {
        if (srcRep != dstRep && amount > 0) {
            if (srcRep !=points) internal view returns (uint256) {
        return nCheckpoints > 0 ? checkpoints[account][nCheckpoints - 1].votes : 0;
    }

    function _getCheckpointIndex address(0)) {
                uint32 srcRepNum = numCheckpoints[srcRep];
                uint256 srcRepOld = srcRepNum > 0 ? checkpoints[srcRep][srcRepNum - 1].(address account, uint256 blockNumber) internal view returns (uint32) {
        require(blockNumber < block.number, "ERC20Votes: block not yet determined");

        uint32 nCheckpoints =votes : 0;
                uint256 srcRepNew = srcRepOld - amount;
                _writeCheckpoint(srcRep, srcRepNum, srcRepOld, srcRepNew);
            }

            if (dstRep != numCheckpoints[account];
        for (uint32 i = nCheckpoints; i > 0; i--) {
            if (checkpoints[account][i - 1].fromBlock <= blockNumber) {
                return i -  address(0)) {
                uint32 dstRepNum = numCheckpoints[dstRep];
                uint256 dstRepOld = dstRepNum > 0 ? checkpoints[dstRep][dstRepNum - 1].votes : 1;
            }
        }
        return 0;
    }

    function _totalSupplyAt(uint32 checkpointIndex, uint256 blockNumber) private view returns (uint256) {
        if (check0;
                uint256 dstRepNew = dstRepOld + amount;
                _writeCheckpoint(dstRep, dstRepNum, dstRepOld, dstRepNew);
            }
        }
    }

    function _writeCheckpoint(address account, uint32 nCheckpoints, uint256 oldVotes, uint256 newVotes) internal {
        uint32 blockNumber = _safe32(block.number, "ERC20Votes: block number exceeds 3pointIndex == 0) {
            return 0;
        }

        uint256 totalSupply = 0;
        for (uint32 i = 0; i < checkpointIndex; i++) {
            totalSupply += checkpoints[address(2 bits");

        if (nCheckpoints > 0 && checkpoints[account][nCheckpoints - 1].fromBlock == blockNumber) {
            checkpoints[account][nCheckpoints - 1].votes = newVotes;
        } else {
            checkpoints[account][nCheck0)][i].vpoints] = Checkpoint(blockNumber, newVotes);
            numCheckpoints[account] = nCheckpoints + 1;
        }

        emit DelegateVotesChanged(account, oldVotes, newVotes);
    }

    function _getVotes(address account, uint32 nCheckpoints) internal view returns (uint256) {
        return nCheckpoints > 0 ? checkpoints[account][nCheckpoints - 1].votes : 0;
    }

    function _getCheckpointIndex(address account, uint256 blockNumber) internal view returns (uint32) {
        uint32 nCheckpoints = numCheckpoints[account];
        for (uint32 i = nCheckpoints; i > 0; --i) {
            if (checkpoints[account][i - 1].fromBlock <= blockNumber) {
                return i;
            }
        }
        return 0;
    }

    function _safe32(uint256 n, string memory errorMessage) internal pure returns (uint32) {
        require(n < 2**32, errorMessage);
        return uint32(n);
    }

    function totalSupplyAt(uint256 blockNumber) public view returns (uint256) {
        return _totalSupplyAt(_checkpoints[address(0)].length - 1, blockNumber);
    }

    function _totalSupplyAt(uint32 checkpointId, uint256 blockNumber) internal viewreturns (uint256) {
        if (checkpointId == 0) {
            return 0;
        }

        uint256 totalSupply = 0;
        for (uint32 i = 0; i < checkpointId; i++) {
            totalSupply += checkpoints[address(0)][i].votes;
        }

        for (uint32 i = 0; i < numCheckpoints[address(0)]; i++) {
            if (checkpoints[address(0)][i].fromBlock <= blockNumber) {
                totalSupply += checkpoints[address(0)][i].votes;
            }
        }

        return totalSupply;
    }
}
