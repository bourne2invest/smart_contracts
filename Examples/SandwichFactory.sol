// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// in solidity we can store variables in memory or in storage.
//storage means the variables are stored permanently on the blockchain.
//memory variables are temporary, and are erased between external function calls to your contract.
//like hard disk vs RAM on a computer.

//we will need to exert care when dealing with structs and arrays within functions, for e.g:
contract SandwichFactory {
    struct Sandwich {
        string name;
        string status;
    }

    Sandwich[] sandwiches;

    function eatSandwich(uint256 _index) public {
        // Sandwich mySandwich = sandwiches[_index];
        // Solidity would give us an errory stating to explicity declare `storage` or `memory` if we tried the above.

        //instead, declare with the `storage` keyword:
        Sandwich storage mySandwich = sandwiches[_index];
        // `mySandwich` is a pointer to `sandwiches[_index]` in storage
        mySandwich.status = "Eaten!";
        // this will permanently change `sandwiches[_index]`

        //for just a copy, use `memory`:
        Sandwich memory anotherSandwich = sandwiches[_index + 1];
        //so `anotherSanwich` will just be a copy of the data in memory
        anotherSandwich.status = "Eaten!";
        //modifies the temporary variable and have no effect on `sandwiches[_index +1]`, but can do:
        sandwiches[_index + 1] = anotherSandwich;
        //to copy the changes back into blockchain storage.
    }

    // require: makes it so the function will throw and error and stop executing if some condition is not true
    function sayHiToVitalik(string memory _name)
        public
        returns (string memory)
    {
        //compare if _name equals "Vitalik". Throws an error and exits if not True.
        //note: solidity doesn't have native string comparison, so
        //use keccak256 hashes to check if two strings are equal.
        require(
            keccak256(abi.encodePacked(_name)) ==
                keccak256(abi.encodePacked("Vitalik"))
        );
        //if True, proceed with the function:
        return "Hi!";
    }
}

// solidity compiler will give warnings to let us know if we should be using the `storage` or `memory` keywords.
//moral: there are cases where we'll need to explicity declare `storage` or `memory`--usually when dealing with `structs` and `arrays` within functions.

//if we were to compile zombie_feeding.sol, we would encounter an error.
//we called _createZombie which is a private function in ZombieFactory.
//i.e: no contracts inheriting from ZombieFactory can access it.

//in addition to public and private functions, solidity also has internal and external functions.
//internal is the same as private, except it's also accessible to contracts that inherit from this contract.
//external is public, except these functions can ONLY be called outside the contract (can't be called by other functions inside that contract)

contract Sandwich {
    uint256 private sandwichesEaten = 0;

    function eat() internal {
        sandwichesEaten++;
    }
}

contract BLT is Sandwich {
    uint256 private baconSandwichesEaten = 0;

    function eatWithBacon() public returns (string memory status) {
        baconSandwichesEaten++;
        //can call this b/c it's internal:
        eat();
    }

    //in Solidity, if-statements are similar to python/js:
    function eatBLT(string memory sandwich) public {
        //remember to compare keccak256 hash of strings to check equality of strings:
        if (
            keccak256(abi.encodePacked(sandwich)) ==
            keccak256(abi.encodePacked("BLT"))
        ) {
            eat();
        }
    }
}

contract Hamburger is Sandwich {
    function eatHamburgers(string memory _name, uint256 _amount) public {
        // an empty, public function
        // takes 2 params, a string and uint
        // var _name will be stored in memory
        // Note: in solidity fns can be invoked in 2 ways:
        // 1. by value, i.e: a copy of the param is passed, so that our fn can modify the value without changing the original
        // 2. by reference, which eferences the original variable so if the fn modifys this argument, then the original variable gets modified.
        // Note: sol convention is to prefix fn param names w/ _ to distinguish them from global vars
    }
}
