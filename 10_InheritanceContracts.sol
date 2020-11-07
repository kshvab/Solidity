// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

contract myERC20TokenContract {
    string public name;
    
    constructor (string memory _name) 
        {
            name = _name;
        }
    
    mapping(address => uint256) public balances;

    function mintAddBalance() public {
        balances[tx.origin] ++;
    }
    
}


contract MyChildTokenContract  is myERC20TokenContract{

    string public symbol;
    address[] public owners;
    uint256 ownerCount;
    address payable receivingWallet;


    constructor (
            string memory _name,
            string memory _symbol,
            address payable _receivingWallet
        ) 
        myERC20TokenContract(_name)
        {
            receivingWallet = _receivingWallet;
            symbol = _symbol;
        }


    function mint() public payable{
        
        super.mintAddBalance();
        ownerCount++;
        owners.push(msg.sender);
        receivingWallet.transfer(msg.value);
    }

}