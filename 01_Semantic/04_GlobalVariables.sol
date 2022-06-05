// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract GlobalVariables {

    function globalVars() external view returns (address, uint, uint) {
        address sender = msg.sender;
        uint timeStamp = block.timestamp;
        uint blockNum = block.number;

        return (sender, timeStamp, blockNum);
    }

}

// view - can read data from state vars and global vars
// external - accessable from outside of blockchain
// pure - means that function is readOnly, doesNot change the blockchain