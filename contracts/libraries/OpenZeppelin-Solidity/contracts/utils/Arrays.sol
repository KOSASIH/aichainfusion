// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Arrays {
    /**
     * @dev Returns the index of the first occurrence of `element` in `array`
     * @param array The array to search
     * @param element The element to search for
     */
    function indexOf(uint256[] storage array, uint256 element) internal view returns (uint256) {
        for (uint256 i = 0; i < array.length; i++) {
            if (array[i] == element) {
                return i;
            }
        }
        return type(uint256).max;
    }

    /**
     * @dev Removes the first occurrence of `element` from `array`
     * @param array The array to modify
     * @param element The element to remove
     */
    function remove(uint256[] storage array, uint256 element) internal {
        uint256 index = indexOf(array, element);
        if (index!= type(uint256).max) {
            array[index] = array[array.length - 1];
            array.pop();
        }
    }
}
