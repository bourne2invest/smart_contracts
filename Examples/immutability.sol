// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Solidity contracts are immutable, i.e: after deploying a contract to Ethereum, it can never be modified or updated again.

// code deployed to the blockchain will stay there permanently.
// so if there's a flaw with the contract, there's no way to patch it.
// We would need to tell our users to start using a different smart contract address that has the fix.
// this is a feature not a bug--every time you call a smart contract function it will do exactly what the code says it will do.
// the code can not be changed later to give unexpected results.

// External dependencies.
// Suppose the CryptoKitties contract had a bug and someone destroyed all the kitties.
// our DApp would point to a hardcoded address that no longer returns any kitties.
// our zombies would be unable to feed off cats, and we'd be unable to modify ourcontract.
// So: instead of hard coding the CK contract address into our app, we should have used a setKittyContractAddress function that lets us change this adddress in the future.
