// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// we just set `setKittyContractAddress` to be external, which means anyone who called the function could change the address of the CryptoKitties contract and break our app for all its users.
// we want the ability to update this address in our contract, but we don't want anyone to be able to do this.
// a best practice has emerged to address this, and it's the make contracts `Ownable`, i.e: they have an owner (you) with special privileges.

// the Ownable.sol contract from OpenZeppelin Solidity library:
/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    // note: constructor() is a constructor.
    // it is a optional special fn that has the same name as the contract.
    // it will get executed only once, when the contract is created.

    /**
     * @return the address of the owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    // note: function modifiers like above, are half-functions used to modify other functions
    // this usually checks some requirements prior to execution
    // in this case, `onlyOwner` can be used to limit access so *only* the *owner* of the contract can run this function.
    //while there are other ways to use modifiers, the most
    //common application is for require checks before executing a fn.

    /**
     * @return true if `msg.sender` is the owner of the contract.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }

    /**
     * @dev Allows the current owner to relinquish control of the contract.
     * @notice Renouncing to ownership will leave the contract without an owner.
     * It will not be possible to call the functions with the `onlyOwner`
     * modifier anymore.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    //note: the onlyOwner modifier. When calling this fn,
    //the code in onlyOwner executes first. Then, when it
    //hits the `_;` statement in `onlyOwner`, it goes back
    //and executes the code in renounceOwnership fn above.

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

// Ownable.sol basically does the following:
// 1. When a contract is made, its constructor sets the `owner` to `msg.sender` (the person who deployed it)
// 2. It adds an `onlyOwner` modifier, which can restrict access to certain functions to only the `owner`.
// 3. It allows you to transfer the contract to a new `owner`.

// `onlyOwner` is such a common requirement for contracts that most Solidity DApps start with a copy/paste of this `Ownable` contract, and then their first contract inherits from it.
