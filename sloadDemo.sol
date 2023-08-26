// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract sloadExample {

    //this variable is in storage slot 1 and i have hard coded it
    // to be '42069'
    uint256 private storageSlot0 = 42069;  

    function getStorageSlot0() public view returns (uint256) {
        uint256 value;
        assembly {
            value := sload(0)  // This loads the value from storage slot 0
        }
        return value;
    }
}
