// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract VolcanoCoin {
    uint256 totalSupply = 10000;
    address owner;

    event SupplyIncrease(uint256 newSupply);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(address _owner) {
        owner = _owner;
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    function increaseSupply() public onlyOwner {
        totalSupply += 1000;
        emit SupplyIncrease(totalSupply);
    }
}
