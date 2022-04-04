// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleMappings {
    // Mappings:
    // mappings are another way of storing data in Solidity
    // think of mappings like Python dicts
    // they are key-value data structure
    mapping(address => uint256) public accountBalance;
    // financial app might sore uint that holds user's balance
    mapping(uint256 => string) userIdToName;
    // could store/lookup usernames based on a userId

    // msg.sender:
    // Solidity has global vars available to all fns.
    // `msg.sender` points to the `address` of the
    // person or smart contract who called the current fn.
    //
    // In Solidity, fn executions always start w/ am
    // external caller. Contracts will just sit on the
    // blockchain until someone calls one of its fns.
    // So there will always be a `msg.sender`.
    mapping(address => uint256) favoriteNumber;

    function setMyNumber(uint256 _myNumber) public {
        // Update our `favoriteNumber` mapping to store
        // `_myNumber` under `msg.sender`
        favoriteNumber[msg.sender] = _myNumber;
        // syntax is just like arrays
    }

    function whatIsMyNumber() public view returns (uint256) {
        // retrieve the value stored in the sender's address
        // will be `0` if sender hasn't called `setMyNumber`
        return favoriteNumber[msg.sender];
    }

    //anyone could call `setMyNumber` and store a uint in
    //our contract, which would be tied to their address.
    //Then, once `whatIsMyNumber` is called, they would
    //be returned the uint they stored

    //Moral: using msg.sender gives us security of the
    // blockchain the only way to moidy someone else's
    // data would be to steal their private key.
}
