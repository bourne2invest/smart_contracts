// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    // return a value from a fn:
    string greeting = "Hello World... It smells like updog :-)";

    function sayHello() public view returns (string memory) {
        // declaring as view fn means it only views the data but does not modify it
        return greeting;
    }
}
