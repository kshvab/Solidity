// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract FunctionIntro {
    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }

    function sub(uint x, uint y) external pure returns (uint) {
        return x - y;
    }
}

// view - can read data from state vars and global vars
// external - accessable from outside of blockchain
// pure - means that function is readOnly, doesNot change the blockchain