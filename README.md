SimpleBank Contract


Overview
The SimpleBank contract is a basic Ethereum smart contract that allows users to deposit and withdraw Ether. This contract serves as an example of how to use Solidity's require(), assert(), and revert() statements to enforce conditions, check assumptions, and handle errors within smart contracts.


Features
Deposit Ether: Users can deposit Ether into the contract, which is recorded against their address.


Withdraw Ether: Users can withdraw Ether from the contract, subject to having a sufficient balance.


Check Balance: Users can check their current balance in the contract.


Solidity Version
The contract is written in Solidity version ^0.8.24.

Smart Contract Code



Functions


1. deposit()

   
Description: Allows users to deposit Ether into the contract. The deposited amount is added to the user's balance.


Modifiers:


payable: Allows the function to receive Ether.


require(): Ensures that the deposit amount is greater than zero.


2. withdraw(uint amount)

3. 
Description: Allows users to withdraw a specified amount of Ether from their balance. The contract checks if the user has enough balance and transfers the requested amount if possible.


Parameters:


amount: The amount of Ether (in wei) to withdraw.


Modifiers:


require(): Ensures the user has enough balance.


assert(): Verifies that the balance is correctly updated after withdrawal.


revert(): Reverts the transaction if the Ether transfer fails.


getBalance()

   
Description: Allows users to check their current balance in the contract.


Returns: The balance of the caller (in wei).


Error Handling


The contract uses the following Solidity error handling mechanisms:


require():


Ensures that certain conditions are met before proceeding with a function execution. If the condition fails, the function execution is halted and any changes are reverted.


assert():


Used to check for conditions that should never be false. If an assert() statement fails, it indicates a bug in the contract and will cause the contract execution to be reverted.


revert():


Used to manually trigger an error, reverting the transaction and any state changes if something goes wrong.


Deployment


To deploy the contract, follow these steps:


Compile the SimpleBank contract using a Solidity compiler (solc) or any development environment like Remix, Hardhat, or Truffle.


Deploy the contract on an Ethereum network (such as a testnet or local development network).
Usage


Deposit Ether:


Call the deposit() function and send the desired amount of Ether.


Withdraw Ether:


Call the withdraw() function with the amount of Ether you wish to withdraw.


Check Balance:


Call the getBalance() function to check your current balance in the contract.


License


This project is licensed under the MIT License.

