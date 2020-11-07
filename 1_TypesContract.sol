// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

contract MyTypesContract {
    
    
    string public myPublicValue = "Public text";
    
    string public constant myConstantValue = "Constant text";
     
    string value;
    
    constructor() {
        value = "myValue";
    }
    
    function get() public view returns(string memory) {
        return value;
    }
    
    function set(string memory _value) public {
        value = _value;
    }
    
    
    //------------------------------------------------------------
    
    string public stringValue = "myString";
    bool public myBool = true;
    int public myInt = -1;
    uint public myUint = 1;
    uint8 public myUint8 = 8;
    uint256 public myUint256 = 99999;
    
}