// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryDemo {
    
    function storeAndLoadMultiple(uint256 value1, uint256 value2, uint256 value3) public pure returns (uint256, uint256, uint256) {

        // These local variables are not stored in a memory location yet
        uint256 storedValue1; // will hold the value from memory location 0x80
        uint256 storedValue2; // will hold the value from memory location 0xA0
        uint256 storedValue3; // will hold the value from memory location 0xC0
        
        assembly {
            // Store values in memory locations
            // 0x00 - Reserved
            // 0x40 - Free memory pointer
            mstore(0x80, value1) // 0x80 - Start of free memory
            mstore(0xA0, value2) // 0xA0 = 0x80 + (32 bytes)
            mstore(0xC0, value3) // 0xC0 = 0xA0 + (32 bytes)

            
            // Load values back from memory
            storedValue1 := mload(0x80)
            storedValue2 := mload(0xA0)
            storedValue3 := mload(0xC0)
        }
        
        return (storedValue1, storedValue2, storedValue3);
    }
}
