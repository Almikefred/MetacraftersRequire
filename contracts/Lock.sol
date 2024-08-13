// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FreeBar{

    uint regId;

    struct Person{
        uint age;
        uint id;
        uint noOfDrinks;
        address person;
    }

    mapping (uint => Person) people;
    mapping (address => bool) registered;


    function register( uint _age) public returns (uint){
          uint _id = regId + 1;
    Person storage newPerson = people[_id];
    require(!registered[msg.sender], "Already registered");

    newPerson.age = _age;
    newPerson.person = msg.sender;
    newPerson.noOfDrinks = 0;
    registered[msg.sender]= true;

    regId++;
    
    return _id;
    }

    function orderDrink(uint _id) public   {
        Person storage newPerson = people[_id];
        require(newPerson.person == msg.sender, "not your id");
        assert(newPerson.age > 18);
        if (newPerson.noOfDrinks > 2){
            revert();
        }
        else{
            newPerson.noOfDrinks ++;
        }
            



    }
}
