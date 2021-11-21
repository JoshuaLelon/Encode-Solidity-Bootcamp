const { expect } = require("chai");
const { ethers } = require("hardhat");

// describe("Greeter", function () {
//   it("Should return the new greeting once it's changed", async function () {
//     const Greeter = await ethers.getContractFactory("Greeter");
//     const greeter = await Greeter.deploy("Hello, world!");
//     await greeter.deployed();

//     expect(await greeter.greet()).to.equal("Hello, world!");

//     const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

//     // wait until the transaction is mined
//     await setGreetingTx.wait();

//     expect(await greeter.greet()).to.equal("Hola, mundo!");
//   });
// });

describe("VolcanoCoin", function () {
  it("Should be able to send Ether", async function () {
    const VolcanoCoin = await ethers.getContractFactory("VolcanoCoin");
    const [owner, addr1] = await ethers.getSigners();
    const volcanoCoin = await VolcanoCoin.deploy(owner.address);
    await volcanoCoin.deployed();

    // Test 1: does it initialize with the initializer owning MAX_SUPPLY coins?

    expect(await volcanoCoin.totalSupply()).to.equal(10000);
    expect(await volcanoCoin.balanceOf(owner.address)).to.equal(10000);
    expect(await volcanoCoin.balanceOf(addr1.address)).to.equal(0);

    // Test 2: can I send coins to another user?

    // const setGreetingTx = await volcanoCoin.transfer(100, addr1.address);
    const setGreetingTx = await volcanoCoin.transfer(1000, addr1.address);

    // wait until the transaction is mined
    await setGreetingTx.wait();

    expect(await volcanoCoin.balanceOf(owner.address)).to.equal(9900);
    expect(await volcanoCoin.balanceOf(addr1.address)).to.equal(100);
  });
});
