// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// require, revert, assert
// - gas refund, state updates are reverted
// custom error - save gas


contract Errors {
    function testRequire(uint _i) public pure {
        require(_i <= 10, "i must be <= 10, but got i > 10");   // nice for 1 statement
        // code
    }

    function testRevert(uint _i) public pure {
        if (_i > 10) {
            // code
            if (_i > 20) {
                revert("i > 20");                               // nice for many statements
            }
        }
    }

    uint public num = 123;

    function testAssert() public view {
        assert(num == 123);                                     // to check the condition
    }

    function foo(uint _i) public {
        // accidentally update num
        num +=1;
        require(_i < 10);
    }


    error MyError(address caller, uint i);

    function customErrorExample(uint _i) public view {
        if (_i > 10) {
            revert MyError(msg.sender, _i);
        }
        
    }

}

