// SPDX-License-Identifier: GPL-3.0
  
pragma solidity ^0.8.0;
// Creating a Smart Contract
contract StructDemo {
    // Structure of employee
    struct Employee {
        // State variables
        int empid;
        string name;
        string department;
        string designation;
    }

    // Array to store employees
    Employee[] emps;

    // Function to add employee details
    function addEmployee(int empid, string memory name, string memory department, string memory designation)
        public
    {
        Employee memory e = Employee(empid, name, department, designation);
        emps.push(e);
    }

    // Function to get details of employee by empid
    function getEmployee(int empid)
        public
        view
        returns (string memory, string memory, string memory)
    {
        for (uint i = 0; i < emps.length; i++) {
            Employee memory e = emps[i];

            // Looks for a matching employee id
            if (e.empid == empid) {
                return (e.name, e.department, e.designation);
            }
        }

        // Return "Not Found" if employee id is not found
        return ("Not Found", "Not Found", "Not Found");
    }
}


