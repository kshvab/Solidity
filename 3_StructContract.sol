// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

contract MyStructContract {
    
    Person [] public people;
    
    struct Person {
        string _firstName;
        string _lastName;
    }
    
    uint256 public peopleCount;
    
    function addPerson(string memory _firstName, string memory _lastName) public {
        people.push(Person(_firstName, _lastName));
        peopleCount += 1;
    }
    
}