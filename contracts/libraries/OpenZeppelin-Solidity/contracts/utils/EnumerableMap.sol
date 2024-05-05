// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library EnumerableMap {
    struct Map {
        address[] _keys;
        mapping(address => uint256) _values;
    }

    /**
     * @dev Returns the value associated with `key` in `map`
     * @param map The map to query
     * @param key The key to query
     */
    function get(Map storage map, address key) internal view returns (uint256) {
        return map._values[key];
    }

    /**
     * @dev Sets the value associated with `key` in `map` to `value`
     * @param map The map to modify
     * @param key The key to modify
     * @param value The new value
     */
    function set(Map storage map, address key, uint256 value) internal {
        map._values[key] = value;
        if (!contains(map, key)) {
            map._keys.push(key);
        }
    }

    /**
     * @dev Returns whether `map` contains `key`
     * @param map The map to query
     * @param key The key to query
     */
    function contains(Map storage map, address key) internal view returns (bool) {
        return map._values[key]!= 0;
    }

    /**
     * @dev Returns the number of key-value pairs in `map`
     * @param map The map to query
     */
    function length(Map storage map) internal view returns (uint256) {
        return map._keys.length;
    }

    /**
     * @dev Returns the key at `index` in `map`
     * @param map The map to query
     * @param index The index to query
     */
    function keyAt(Map storage map, uint256 index) internal view returns (address) {
        return map._keys[index];
    }
}
