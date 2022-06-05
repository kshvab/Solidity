// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ViewAndPure {

    uint public num;

    function viewFunc() external view returns (uint) {  //readOnly and reads data from BC
        return num;
    }

    function pureFunc() external pure returns (uint) { //readonly and doesNot read from BC
        return 1;
    }

    function addToNum(uint x) external view returns (uint) {
        return x + num;
    } 

    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }

}

// view - readOnly, can read data from state vars and global vars
// external - accessable from outside of blockchain
// pure - readOnly, doesNot change the blockchain, does not read from BC