//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract addDemo {
    function addTwoNumbers (uint256 x, uint256 y) public pure returns (uint256 result) {

        assembly {
            result := add(x,y)
        }
    }
}