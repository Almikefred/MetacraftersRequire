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
