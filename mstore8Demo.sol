// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract mstore8Demo {

    // store a single byte in location 0x80
    // for example, if we enter 1, word will be:
    // 0x01000000000000000000000000000000000000000000000000000000000000000
    function storeByte(uint8 byteValue) public pure returns (uint256) {
        uint256 word;

        assembly {
            // Using mstore8 to store a single byte at position 0x80. 
            // The rest of the 32-byte word will remain zeros.
            mstore8(0x80, byteValue)
            
            // Load the 32-byte word back into a Solidity variable.
            word := mload(0x80)
        }

        return word;
    }
}
