// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

contract MyEnumContract {
    
    enum State { Waiting, Ready, Active }
    State public itemState;
    
    constructor() {
        itemState = State.Waiting;
    }
    
    function activate() public {
        itemState = State.Active;
    }  
    
    function isActive() public view returns(bool) {
        return itemState == State.Active;
    }
}