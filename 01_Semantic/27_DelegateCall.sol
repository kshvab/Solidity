
/*
delegatecall is a low level function similar to call.

When contract B executes delegatecall to contract A, A's code is executed
with contract B's storage, msg.sender and msg.value.
*/


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

    // must be the same order!!!! A and B!
contract B {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _AContractAddress, uint _num) external payable {

        // _AContractAddress.delegatecall(
        //     abi.encodeWithSignature("setVars(uint256)", _num)
        // )
            // the same:
        (bool success, bytes memory data) = _AContractAddress.delegatecall(
            abi.encodeWithSelector(A.setVars.selector, _num)
        );

        require(success, "delegated call failed");

        //it uses A code and changes B state
    }
}