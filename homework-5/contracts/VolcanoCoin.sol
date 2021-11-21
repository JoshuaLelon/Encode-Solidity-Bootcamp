// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VolcanoCoin is ERC20("VolcanoToken", "VCNO"), Ownable {
    struct Payment {
        uint256 transferAmount;
        address recipient;
    }

    uint256 private _totalSupply = 10000;
    mapping(address => uint256) balance;
    mapping(address => Payment[]) payments;

    event SupplyIncrease(uint256 newSupply);

    constructor(address owner) {
        balance[owner] = _totalSupply;
    }

    // function transfer(uint256 amount, address recipient) public payable {
    //     balance[msg.sender] -= amount;
    //     balance[recipient] += amount;
    //     emit Transfer(amount, recipient);
    // }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function increaseSupply() public onlyOwner {
        _totalSupply += 1000;
        emit SupplyIncrease(_totalSupply);
    }

    function getBalance(address user) public view returns (uint256) {
        return balance[user];
    }
}
