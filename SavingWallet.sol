// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SavingWallet {

    uint amount;

    mapping (address => uint) savings;


    function Save() external payable {

        require(msg.sender != address(0), "You cannot make this call");

        require(msg.value > 0 ether, "Kindly input a valid amount of Ether");

        savings[msg.sender] = savings[msg.sender] + amount;
    }

    function withdraw(uint _amount) external {

        require(_amount > 0, "Enter a valid withdrawal amount");

        require(_amount <= savings[msg.sender], "Insufficient Balance.");

        savings[msg.sender] = savings[msg.sender] - _amount;

        payable(msg.sender).transfer(_amount);

        amount = amount - _amount;

        if(savings[msg.sender] == 0) {

            savings[msg.sender] = 0;

        }

    }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }
}
