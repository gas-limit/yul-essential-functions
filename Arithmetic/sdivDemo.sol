//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract modDemo {
    function modTwoNumbers (uint256 x, uint256 y) public pure returns (uint256 result) {

        assembly {
            result := mod(x,y)
        }
    }
}