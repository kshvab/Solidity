// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract StateVariables {
    uint public myUint = 123; //stored in BC - is not in function

    function foo() external {
        uint notStateVariable = 456; // local, not stored in BC

        myUint = 888; //change state in BC
    }
}