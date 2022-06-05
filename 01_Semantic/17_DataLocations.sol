// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

    // Data locations: storage, memory and calldata (like memory except can only be used by func imports, saves gas avoiding copyes)

    // Assignments between storage and memory (or from calldata) always create a separate copy.
    // Assignments from memory to memory only create references. Therefore changing one memory variable alters all other memory variables that refer to the same data.
    // Assignments from storage to a local storage variable also only assign a reference.
    // All other assignments to storage always copy.

contract DataLocations {
    
    //****************************************

    string public text;

    function set(string calldata _text) external {
        text = _text;
    }

    // dynamic datatype as output just example
    function get() external view returns (string memory) { 
        // sol will copy state var text to memory and return in memory
        return text;
    }
    //****************************************


    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples(uint[] memory y, string memory s) external returns (MyStruct memory){
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        MyStruct storage myOwnStructVariable = myStructs[msg.sender];
        myOwnStructVariable.text = "foo";

        MyStruct memory myOwnStructReadOnly = myStructs[msg.sender];
        myOwnStructVariable.text = "foo";

        return myOwnStructReadOnly;
    }

    function examples2(uint[] memory y, string memory s) external returns (uint[] memory){


        uint[] memory memArr = new uint[](3);
        memArr[0] = 123;
        return memArr;
    }

    function examples(uint[] calldata y, string calldata s) external returns (MyStruct memory){
  
        MyStruct memory myOwnStructReadOnly = myStructs[msg.sender];

        _internal(y);

        myOwnStructVariable.text = "foo";

        return myOwnStructReadOnly;
    }


    function _internal(uint[] calldata y) private {
        uint x = y[0];
    }

    //*********** Gas comparison *******************//

    // Gas used: 50992
    function func1 (uint[] memory nums) external {
    for (uint i = 0; i < nums.length; ++i) {
        ...
    }
    }// Gas used: 49163
    function func2 (uint[] calldata nums) external {
    for (uint i = 0; i < nums.length; ++i) {
        ...
    }
    }

}

