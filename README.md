# DrivingSchool Smart Contract

This smart contract, `DrivingSchool`, is designed to manage the registration and licensing of students in a decentralized driving school system. It allows students to register, take a driving test, and receive a license if they pass.

## Overview

The `DrivingSchool` contract enables the following functionalities:
- Register a student.
- Assign a license to a student if they pass the driving test.
- Retrieve the license status and details of a student.

## Contract Details

### State Variables

- **studentCounter**: A counter that increments with each new student registration.
- **Student**: A struct representing a student with the following properties:
  - `address student`: The student's Ethereum address.
  - `uint id`: A unique identifier for the student.
  - `uint age`: The student's age.
  - `bool registrationStatus`: A flag indicating whether the student is registered.
  - `bool licenseStatus`: A flag indicating whether the student has obtained a license.
  - `uint licenseExpiryDate`: The expiry date of the student's license.

- **students**: A mapping from student addresses to their corresponding `Student` struct.

### Functions

#### `register(uint _age) public returns(bool)`

Registers a new student with the given age.

- **Parameters**:
  - `_age`: The age of the student.
  
- **Returns**:
  - `true` if the registration is successful.
  
- **Reverts**:
  - If the student is already registered.

#### `getLicense(uint _testScore) public`

Issues a driving license to a registered student if they pass the driving test.

- **Parameters**:
  - `_testScore`: The score obtained in the driving test.

- **Reverts**:
  - If the student is not registered.
  - If the student's age is below 18.
  - If the student's test score is below the passing threshold (60).

- **Effects**:
  - Assigns a license to the student if they pass the test.
  - Sets the license expiry date to one year from the current time.

#### `getStudentLicenseStatus(address _student) public view returns(bool)`

Checks the license status of a specific student.

- **Parameters**:
  - `_student`: The address of the student.

- **Returns**:
  - `true` if the student has a valid license, otherwise `false`.

#### `getStudentDetails(address _student) public view returns(Student memory)`

Retrieves the complete details of a specific student.

- **Parameters**:
  - `_student`: The address of the student.

- **Returns**:
  - The `Student` struct containing the student's details.

## Usage

1. **Register a Student**: 
   - Call the `register` function with the student's age.
  
2. **Get a License**:
   - After registration, call the `getLicense` function with the student's test score.

3. **Check License Status**:
   - Use `getStudentLicenseStatus` to check if a student has a valid license.

4. **Get Student Details**:
   - Use `getStudentDetails` to retrieve all details of a student.

## License

This project is licensed under the MIT License.
