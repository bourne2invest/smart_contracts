// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// interacting with other contracts
//in order for our contract to interact with another contract we don't own, we need to define an interface.
//suppose we had the following contract:
contract LuckyNumber {
    mapping(address => uint256) numbers;

    function setNum(uint256 _num) public {
        numbers[msg.sender] = _num;
    }

    function getNum(address _myAddress) public view returns (uint256) {
        return numbers[_myAddress];
    }
}

//now suppose we had an external contract that wanted to read data in this contract using the getNum function.
//to do this, we'd have to define an interface of the LuckyNumber contract:
contract NumberInterface {
    //declare fns we want to interact with (don't mention other fns or state vars)
    function getNum(address _myAddress) public view returns (uint256); //dont define fn body
    //this is how the compiler knows its an interface
}

//now our contract knows what the other contracts fns look like, how to call them, and what sort of response to expect.

//now that we have defined NumberInterface, we can use it in a contract:
contract MyContract {
    //address of FavoriteNumber contract on Ethereum
    address NumberInterfaceAddress = 0xab38;
    // `numberContract` is pointing to the other contract:
    NumberInterface numberContract = NumberInterface(NumberInterfaceAddress);

    function someFunction() public {
        //now we can call `getNum` from that contract:
        uint256 num = numberContract.getNum(msg.sender);
        //...and do something with `num` below:
    }
}

// in this way, our contract can interact with any other contract on Ethereum blockchain,
//so long as thoe fns are exposed as `public` or `external`.
