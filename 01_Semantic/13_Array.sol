// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// Array - dynamic or fixed size
// Initialization
// Insert (push), get, update, delete, pop, length
// Creating Arr in memory
// returning Arr from function

contract Array {
    uint[] public nums = [1, 2, 3];
    uint[3] public numsFixed = [4, 5, 6];

    function examples() external {
        nums.push(4);
        uint x = nums[1];

        nums[2] = 777;      // [1, 2, 777, 4];
        delete nums[1];     // [1, 0, 777, 4];

        nums.pop();         // [1, 0, 777];

        uint len = nums.length;

        // create Arr in memory:
        uint[] memory a = new uint[](5);    // alw fixed size, no push or pop!!!
        a[1] = 123;
    }

    function returnArray() external view returns(uint[] memory) {
        return nums;
    }

    // Remove el from Arr totaly by Shifting elements to left - NOT GAS EFFICIENT
    // [1,2,3,4,5] --> remove(2) --> [1,2,4,5,6,6] --> [1,2,4,5,6]

    function remove(uint _index) public {
        require(_index < nums.length, "index out of bound");

        for (uint i = _index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
        nums.pop();
    }

    function test() external {
        nums = [1,2,3,4,5];

        remove(2);
        assert(nums[0] == 1);
        assert(nums[1] == 2);
        assert(nums[2] == 4);
        assert(nums[3] == 5);
        assert(nums.length == 4);

        nums = [1];
        remove(0);
        // []
        assert(nums.length == 0);
    }

    // Remove el from Arr by Replacing Last - MORE EFFICIENT, but changes the order
    // [1,2,3,4] --> remove(1) --> [1,4,3]

    function removeByReplacing(uint _index) public {
        nums[_index] = nums[nums.length - 1];
        nums.pop();
    }

    function test2() external {
        nums = [1,2,3,4,5];

        removeByReplacing(2);
        assert(nums[0] == 1);
        assert(nums[1] == 2);
        assert(nums[2] == 5);
        assert(nums[3] == 4);
        assert(nums.length == 4);

        nums = [1];
        removeByReplacing(0);
        // []
        assert(nums.length == 0);
    }

}

