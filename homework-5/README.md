Use `npx hardhat test --logs` to see emitted events during testing.

From: https://www.npmjs.com/package/hardhat-tracer

---

To use etherscan-verify, run the verify task, passing the address of the contract, the network where it's deployed, and the constructor arguments that were used to deploy it (if any):

`npx hardhat verify --network mainnet DEPLOYED_CONTRACT_ADDRESS "Constructor argument 1"`

From: https://www.npmjs.com/package/@nomiclabs/hardhat-etherscan

---

For solidity coverage, try

`npx hardhat coverage --file="test/registry/*.js"`

From: https://www.npmjs.com/package/solidity-coverage
