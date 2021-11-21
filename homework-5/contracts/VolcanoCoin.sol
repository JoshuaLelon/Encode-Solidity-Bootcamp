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

    function transfer(uint256 amount, address recipient) public payable {
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
