// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;


contract Mapping {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => bool)) public isFriend;

    function examples() external {
        balances[msg.sender] = 123;
        uint bal = balances[msg.sender];
        uint bal2 = balances[address(1)];   // 0

        balances[msg.sender] += 456; // 123 + 456 = 579

        delete balances[msg.sender]; // 0

        isFriend[msg.sender][address(this)] = true;
    }
}

contract IterableMapping {
    mapping(address => uint) public balances;
    mapping(address => bool) public isInserted;
    address[] public keys;

    function set(address _key, uint _val) external {
        balances[_key] = _val;

        if(!isInserted[_key]) {
            isInserted[_key] = true;
            keys.push(_key);
        }
    }

    function getSize() external view returns (uint) {
        return keys.length;
    }

    function get(uint _i) external view returns (uint) {
        return balances[keys[_i]];
    }

}

