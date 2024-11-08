// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MyContract 
{ 
    // Private state variable 
    address private owner; 

    // Defining a constructor 
    constructor() public 
    { 
        owner = msg.sender; 
    } 

    // Function to get address of owner 
    function getOwner() public view returns (address) 
    {  
        return owner; 
    } 

    // Function to return current balance of owner 
    function getBalance() public view returns(uint256)
    { 
        return owner.balance;
    }
}
