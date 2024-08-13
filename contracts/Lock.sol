// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleBank {
    mapping(address => uint) private balances;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Deposit Ether into the contract
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value;
    }

    // Withdraw Ether from the contract
    function withdraw(uint amount) public {
        // Check if the user has enough balance
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Using assert to ensure the balance calculation is correct
        uint oldBalance = balances[msg.sender];
        balances[msg.sender] -= amount;
        assert(balances[msg.sender] == oldBalance - amount);

        // Transfer the amount to the user
        (bool success, ) = msg.sender.call{value: amount}("");
        if (!success) {
            // If the transfer fails, revert the transaction
            revert("Transfer failed");
        }
    }

    // Check balance
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
