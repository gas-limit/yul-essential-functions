//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract signedmodDemo {
    function smodTwoNumbers (int256 x, int256 y) public pure returns (int256 result) {

        assembly {
            result := smod(x,y)
        }
    }
}