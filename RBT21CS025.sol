// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.6.8;

contract StructDemo{

    struct Employee{

        int empid;
        string name;
        string department;
        string designation;
    }
    Employee []emps;
    uint public contractBalance; 

    function addEmployee(
        int empid, string memory name,
        string memory department,
        string memory designation
        ) public{
        Employee memory e
        =Employee(empid,
        name,
        department,
        designation);
        emps.push(e);
    }

    function getEmployee(int empid) public view returns(string memory, string memory,string memory){
        uint i;
        for(i=0;i<emps.length;i++)
        {
        Employee memory e
        =emps[i];

        if(e.empid==empid)
        {
        return(e.name,
        e.department,
        e.designation);
        }
    }

    return("Not Found","Not Found","Not Found");
    }

    receive() external payable {
        // Update the contract's balance when Ether is received
        contractBalance += msg.value;
    }

    // Fallback function to handle calls and Ether (if necessary)
    fallback() external payable {
        // This can be used to handle calls that do not match any function
        contractBalance += msg.value;  // You can also handle Ether here
    }

    
}