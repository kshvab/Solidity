// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

contract redirectPaymentContract {
    
    address payable ownerWallet;
    
    constructor (address payable _ownerWallet) {
        ownerWallet = _ownerWallet;
    }
    
    
    address public lastPayer;
    
    uint256 public lastSumm;
    
    
    function pay() public payable {
        ownerWallet.transfer(msg.value);
        
        lastPayer = msg.sender;
        lastSumm = msg.value;
    }
    
}