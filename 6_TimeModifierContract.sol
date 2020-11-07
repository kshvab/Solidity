// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

contract MyModifierContract {

    //uint256 public openingTimeManualSet = 1604163657;

    uint256 public deployTime;
    constructor () {
        deployTime = block.timestamp;
    }

    modifier onlyAfter60Sec() {
        require(block.timestamp > deployTime+60);   //block.timestamp- the last block time
        _;
    }

    int public size = 888;

    function changeSize(int newSize) public onlyAfter60Sec {
        size = newSize;
    }
    
}