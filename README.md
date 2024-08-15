# DrivingSchool Smart Contract

## Summary
The `DrivingSchool` smart contract is designed to manage the registration and licensing of students within a decentralized driving school system. It allows students to register, take a driving test, and receive a license if they pass. This contract provides a foundational implementation for managing driving schools on the Ethereum blockchain.

## Description
The `DrivingSchool` contract offers a decentralized solution for managing student registrations and driving licenses. Students can register with their age, take a driving test, and if they pass, receive a license with an expiration date. The contract tracks the registration and licensing status of each student and provides functions for retrieving this information. This smart contract serves as an example for those looking to understand how to implement a registration and licensing system on the blockchain and can be extended for more complex scenarios.

## Getting Started


### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


contract DrivingSchool{

    uint studentCounter;
    
    struct Student{
        address student;
        uint id;
        uint age;
        bool registrationStatus;
        bool licenseStatus;
        uint licenseExpiryDate;
    }

    mapping(address => Student) students;

    function register(uint _age) public returns(bool){
        studentCounter++;
        Student storage newStudent = students[msg.sender];

       if (newStudent.registrationStatus){
            revert("Already registered");
       }
        newStudent.student = msg.sender;
        newStudent.id = studentCounter;
        newStudent.age = _age;
        newStudent.registrationStatus = true;

        return true;
    }

    function getLicense(uint _testScore) public {
        Student storage newStudent = students[msg.sender];
        require(newStudent.registrationStatus, "You are not Registered");
        
        assert(newStudent.age >= 18);

        if(_testScore >= 60){
            newStudent.licenseStatus = true;
            newStudent.licenseExpiryDate = block.timestamp + 31536000;
        }
            else {
                revert("Not eligible");
            }


    }

    function getStudentLicenseStatus(address _student) public view returns(bool){
        Student storage newStudent = students[_student];

        return newStudent.licenseStatus;
    }

    function getStudentDetails(address _student) public view returns(Student memory){
        return students[_student];
    }
}

```

### Deployment

To deploy the `DrivingSchool` contract, follow these steps:

1. Deploy the contract on the Ethereum blockchain.
2. Students can register using the `register` function.
3. After registration, students can take a driving test and obtain a license if they pass.
4. The contract will manage the registration and licensing process, including tracking license expiration.

### Interacting with the Contract

To interact with the `DrivingSchool` contract, you can use any Ethereum development environment like [Remix](https://remix.ethereum.org/) or Hardhat.

**Register a Student:**  

Students can register themselves using the `register` function:
```javascript
register(uint _age) public returns(bool)
```
**Get a License:**

After registration, students can obtain a driving license by passing the test using the getLicense function:

```javascript
getLicense(uint _testScore) public
```
**Check License Status:**

To check if a student has a valid license, use the getStudentLicenseStatus function:

```javascript
getStudentLicenseStatus(address _student) public view returns(bool)
```
**Retrieve Student Details:**

To retrieve the complete details of a student, use the getStudentDetails function:

```javascript
getStudentDetails(address _student) public view returns(Student memory)
```
**Author**

Alfred Michael

**License**

This project is licensed under the MIT License.
