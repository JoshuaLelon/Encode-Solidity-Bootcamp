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
    mapping(address => Payment[]) public payments;

    event SupplyIncrease(uint256 newSupply);

    constructor(address owner) {
        _mint(owner, _totalSupply);
    }

    function transfer(uint256 amount, address recipient) public payable {
        super.transfer(recipient, amount);
        logPayment(msg.sender, recipient, amount);
    }

    function logPayment(
        address from,
        address to,
        uint256 amount
    ) internal {
        Payment memory payment = Payment(amount, to);
        payments[from].push(payment);
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function increaseSupply() public onlyOwner {
        _totalSupply += 1000;
        emit SupplyIncrease(_totalSupply);
    }

    function mintToOwner(uint256 amount) public {
        _mint(msg.sender, amount);
    }
}
