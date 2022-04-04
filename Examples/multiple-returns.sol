// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleMultipleReturns {
    //handling multiple return values:
    function multipleReturns()
        internal
        pure
        returns (
            uint256 a,
            uint256 b,
            uint256 c
        )
    {
        return (1, 2, 3);
    }

    function processMultipleReturns() external pure {
        uint256 a;
        uint256 b;
        uint256 c;
        //how to do multiple assignment:
        (a, b, c) = multipleReturns();
        //very similar to Python..
    }

    //or if we only care about one value:
    function getLastReturnValue() external pure {
        uint256 c;
        //leave other fields blank:
        (, , c) = multipleReturns();
        //again, v similar to Python!
    }
}
