// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

contract eventTrigerContract {
    
    address payable ownerWallet;
    
    constructor (address payable _ownerWallet) {
        ownerWallet = _ownerWallet;
    }
    
    //Event descr
    event paymentEvent(
        address indexed _payer,
        uint256 _amount
    );
    
    function pay() public payable {
        ownerWallet.transfer(msg.value);
        emit paymentEvent(msg.sender, msg.value);
    }
}

/* Res inside the log:

    "event": "paymentEvent", "args":   { 
        "0": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4", 
        "1": "5543210000000000000", 
        "_payer": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4", 
        "_amount": "5543210000000000000", 
        "length": 2 
    }
        
*/