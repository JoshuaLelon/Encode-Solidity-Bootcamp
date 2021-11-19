// 1. In order to keep track of user balances, we need to associate a user’s address with the balance that they have.
// a) What is the best data structure to hold this association ?
// Probably a mapping
// b) Using your choice of data structure, set up a variable called balance to keep track of the number of volcano coins that a user has.
// CHECK
// 2. We want to allow the balance variable to be read from the contract, there are 2 ways to do this.
// a) What are those ways ?
// Add a public function that takes an address and returns the balance.
// Not sure of the other way yet
// b) Use one of the ways to make your balances variable visible to users of the contract.
// CHECK
// 3. Now change the constructor, to give all of the total supply to the owner of the contract.
// CHECK
// 4. Now add a public function called transfer to allow a user to transfer their tokens to another address.
// This function should have 2 parameters :
// the amount to transfer and the recipient address.
// a) Why do we not need the sender’s address here ?
// because there is already a global variable with the sender's address
// b) What would be the implication of having the sender’s address as a parameter ?
// that someone is moving tokens from one address that isn't theirs to another
// 5. Add an event to the transfer function to indicate that a transfer has taken place, it should record the amount and the recipient address.
// CHECK
// 6. We want to keep a record for each user’s transfers. Create a struct called Payment that can be used to hold the transfer amount and the recipient’s address.
// CHECK
// 7. We want to reference a payments array to each user sending the payment. Create a mapping which returns an array of Payment structs when given this user’s address.
// CHECK

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract VolcanoCoin {
    struct Payment {
        uint256 transferAmount;
        address recipient;
    }

    uint256 totalSupply = 10000;
    address owner;
    mapping(address => uint256) balance;
    mapping(address => Payment[]) payments;

    event SupplyIncrease(uint256 newSupply);
    event Transfer(uint256 amount, address recipient);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(address _owner) {
        owner = _owner;
        balance[owner] = totalSupply;
    }

    function transfer(uint256 amount, address recipient) public {
        balance[msg.sender] -= amount;
        balance[recipient] += amount;
        emit Transfer(amount, recipient);
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    function increaseSupply() public onlyOwner {
        totalSupply += 1000;
        emit SupplyIncrease(totalSupply);
    }

    function getBalance(address user) public view returns (uint256) {
        return balance[user];
    }
}
