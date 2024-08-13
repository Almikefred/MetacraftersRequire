FreeBar Smart Contract
The FreeBar smart contract is designed to manage registrations and drink orders at a fictional bar. Users can register themselves and then order drinks, with specific rules and constraints enforced by the contract.

Contract Overview
Name: FreeBar
Solidity Version: ^0.8.8
License: MIT
Features
Registration:

Users can register themselves by providing their age.
Each user is assigned a unique ID upon registration.
A user can only register once.
Order Drink:

Registered users can order drinks.
A user can only order drinks using their own ID.
Users must be older than 18 to order drinks.
Each user is limited to a maximum of 3 drinks.
Contract Details
State Variables
uint regId: Tracks the total number of registered users.
struct Person: Represents a person with the following properties:
uint age: The age of the person.
uint id: The unique ID of the person.
uint noOfDrinks: The number of drinks ordered by the person.
address person: The address of the person.
mapping (uint => Person) people: Maps a unique ID to a Person struct.
mapping (address => bool) registered: Tracks whether an address has registered.
Functions
register
solidity
Copy code
function register(uint _age) public returns (uint)
Registers a new user.

Parameters:
uint _age: The age of the user.
Returns:
uint: The unique ID assigned to the registered user.
Requirements:
The user must not have registered before.
Increments regId for the next registration.
orderDrink
solidity
Copy code
function orderDrink(uint _id) public
Allows a registered user to order a drink.

Parameters:
uint _id: The unique ID of the user.
Requirements:
The user must be ordering using their own ID.
The user must be older than 18.
The user can order a maximum of 3 drinks.
Usage
Deploying the Contract
Deploy the FreeBar contract to your desired Ethereum network using your preferred tool (e.g., Remix, Hardhat, Truffle).

Interacting with the Contract
Register a User:
Call the register function with the user's age as the argument.

solidity
Copy code
freeBar.register(25);
Order a Drink:
Call the orderDrink function with the user's unique ID as the argument.

solidity
Copy code
freeBar.orderDrink(1);
License
This project is licensed under the MIT License - see the LICENSE file for details.
