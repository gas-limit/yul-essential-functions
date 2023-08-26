// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract sstoreExample {

    // This variable is automatically stored in storage slot 0
    uint256 public storageSlot0;  

    function setStorageSlot0(uint256 _value) public {
        assembly {
            sstore(0, _value)  // This stores _value in storage slot 0
        }
    }

}
