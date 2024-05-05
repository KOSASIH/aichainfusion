// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library EnumerableSet {
    struct Set {
        address[] _values;
    }

    /**
     * @dev Returns whether `set` contains `value`
     * @param set The set to query
     * @param value The value to query
     */
    function contains(Set storage set, address value) internal view returns (bool) {
        for (uint256 i = 0; i < set._values.length; i++) {
            if (set._values[i] == value) {
                return true;
            }
        }
        return false;
    }

    /**
     * @dev Adds `value` to `set`
     * @param set The set to modify
     * @param value The value to add
     */
    function add(Set storageset, address value) internal {
        if (!contains(set, value)) {
            set._values.push(value);
        }
    }

    /**
     * @dev Removes `value` from `set`
     * @param set The set to modify
     * @param value The value to remove
     */
    function remove(Set storage set, address value) internal {
        uint256 index = indexOf(set, value);
        if (index != type(uint256).max) {
            set._values[index] = set._values[set._values.length - 1];
            set._values.pop();
        }
    }

    /**
     * @dev Returns the number of elements in `set`
     * @param set The set to query
     */
    function length(Set storage set) internal view returns (uint256) {
        return set._values.length;
    }

    /**
     * @dev Returns the value at `index` in `set`
     * @param set The set to query
     * @param index The index to query
     */
    function valueAt(Set storage set, uint256 index) internal view returns (address) {
        return set._values[index];
    }

    /**
     * @dev Returns the index of `value` in `set`
     * @param set The set to query
     * @param value The value to query
     */
    function indexOf(Set storage set, address value) internal view returns (uint256) {
        for (uint256 i = 0; i < set._values.length; i++) {
            if (set._values[i] == value) {
                return i;
            }
        }
        return type(uint256).max;
    }
}
