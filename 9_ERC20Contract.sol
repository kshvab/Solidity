// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

contract myERC20FirstToken {
    string public name;
    mapping(address => uint256) public balances;

    function mint() public {
        balances[tx.origin] ++;
    }
    
}


contract MyContract {
    address payable receivingWallet;
    address public tokenMinterContractAddress;

    constructor (address payable _receivingWallet, address _tokenMinterContractAddress) {
        receivingWallet = _receivingWallet;
        tokenMinterContractAddress = _tokenMinterContractAddress;
    }

    receive() external payable {
        buyToken();
    }

    function buyToken() public payable {
        
        myERC20FirstToken(address(tokenMinterContractAddress)).mint();

        receivingWallet.transfer(msg.value);
    }

}