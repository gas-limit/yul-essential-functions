// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./child.sol";


contract Factory {

    // A state variable to store the address of the deployed Child contract.
    address public storedChildAddress;

    // A public function that deploys the Child contract using the provided 'salt'.
    function deployChildWithCreate2(uint256 salt) public  {

        // A local variable to store the address of the Child contract once it's deployed.
        address childAddress;

        // Gets the bytecode of the Child contract. This is used by 'create2' to deploy the contract.
        bytes memory bytecode = type(Child).creationCode;


        assembly {
            // The 'create2' opcode deploys a new contract.
            // 0 is the endowment (in wei) sent to the new contract (in this case, nothing is sent).
            // add(bytecode, 0x20) is a pointer to the start of the bytecode data.
            // mload(bytecode) gives the length of the bytecode.
            // 'salt' can be any value; when changed, it will result in a different contract address.
            childAddress := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
        }
        
        // Ensures that the contract was successfully deployed. If not, it reverts the transaction with an error message.
        require(childAddress != address(0), "Deployment failed");

        // Stores the address of the deployed Child contract in the 'storedChildAddress' state variable.
        storedChildAddress = childAddress;
    }
}
