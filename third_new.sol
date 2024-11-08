// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract BankAccount {

    // Private state variables
    address private owner;
    uint256 private balance;

    // Event to log deposits and withdrawals
    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Constructor to set the owner of the contract
    constructor() {
        owner = msg.sender; // The account that deploys the contract is the owner
        balance = 0; // Initial balance is 0
    }

    // Deposit function: Allows anyone to deposit ETH to the contract
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balance += msg.value; // Increase the balance with the deposited amount
        emit Deposited(msg.sender, msg.value); // Emit an event for deposit
    }

    // Withdraw function: Allows the owner to withdraw ETH from the contract
    function withdraw(uint256 amount) public onlyOwner {
        require(amount > 0, "Withdrawal amount must be greater than zero");
        require(balance >= amount, "Insufficient balance in the contract");
        
        balance -= amount; // Decrease the balance by the withdrawal amount
        payable(owner).transfer(amount); // Transfer the amount to the owner
        emit Withdrawn(msg.sender, amount); // Emit an event for withdrawal
    }

    // Get the contract's balance
    function getBalance() public view returns (uint256) {
        return balance;
    }

    // Get the owner's address
    function getOwner() public view returns (address) {
        return owner;
    }
}
