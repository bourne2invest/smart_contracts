// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//when you have multiple files and one to import one into another, use import:
import "./someothercontract.sol";

contract newContract is SomeOtherContract {}

// inheritance.
// rather than make one really long contract, it can make sense to split
// code logic across multiple contracts to keep code organized, for e.g:
contract Doge {
    function catchphrase() public returns (string memory) {
        return "So Wow CryptoDoge";
    }
}

contract BabyDoge is Doge {
    function anotherCatchphrase() public returns (string memory) {
        return "Such Moon BabyDoge";
    }
}

// BabyDoge inherits from Doge, i.e:
// if we were to compile and deploy BabyDoge, it would have access to both
// catchphrase() and anotherCatchphrase(), as well as any
//other public functions defined in Doge.
