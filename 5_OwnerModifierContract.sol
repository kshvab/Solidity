// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

contract MyModifierContract {
    
    //-----------------------------
    address ownerAdress;
    
    constructor () {
        ownerAdress = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == ownerAdress);
        _;
    }
    //-----------------------------
    
    
    uint256 public peopleCount = 0;
        
    mapping(uint => Person) public people;
    
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    
    
    function addPerson(string memory _firstName, string memory _lastName) public onlyOwner {    // onlyOwner modifier
        incrementCount();
        
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
    
    function incrementCount() internal {
        peopleCount += 1;
    }
    
    
    
}