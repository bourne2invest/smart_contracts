// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleEvents {
    // events allow our contract to communicate that something
    // happened on the blockchain to our app front-end, which
    // may be listening for certain events and take action
    // when they happen, for e.g:
    // decalare event
    event IntegersAdded(uint x, uint y, uint result);

    function add(uint _x, uint _y) public returns (uint) {
        uint result = _x + _y;
        // fire an event to let the app know the function was called:
        emit IntegersAdded(_x, _y, result);
        return result;
    }

    // our app front-end could then listen for the event.
    // a javascript implementation could look like:
    OurContract.IntegersAdded(function(error, result) {
        // do something with the result
    })
}