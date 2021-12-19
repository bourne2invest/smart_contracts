pragma solidity >=0.5.0;

contract HelloWorld {}

contract Example {
    uint256 myUnsignedInteger = 100; // create uint == 100
    // this will be stored permanently in the blockchain

    uint256 x = 5**2; // equal to 5^2 == 25 (math in solidity is straightforward)

    // create string state var greeting
    string greeting = "Hello world!";

    //// add example arrays
    // array with fixed length of 2 elements:
    uint256[2] fixedArray;
    // another fixed Array, can contain 5 strings:
    string[5] stringArray;
    // a dynamic array with no fixed size and can keep growing:
    uint256[] dynamicArray;

    // create Person struct with age and name properties:
    struct Person {
        uint256 age;
        string name;
    }

    // create an array of structs, named people:
    // Person[] people; // dynamic array, can keep adding to it
    // useful for storing structured data in our contract (like a database)

    // can declare array as public:
    Person[] public people; // solidity automatically creates getter method

    // other contracts can now read from, but not write to this array
    // this is a useful pattern for storing public data in our contract

    function eatHamburgers(string memory _name, uint256 _amount) public {
        // an empty, public function
        // takes 2 params, a string and uint
        // var _name will be stored in memory
        // Note: in solidity fns can be invoked in 2 ways:
        // 1. by value, i.e: a copy of the param is passed, so that our fn can modify the value without changing the original
        // 2. by reference, which eferences the original variable so if the fn modifys this argument, then the original variable gets modified.
        // Note: sol convention is to prefix fn param names w/ _ to distinguish them from global vars
    }

    // create new Person's and add them to our array
    Person satoshi = Person(172, "Satoshi");

    // add this person to array
    people.push(satoshi);

    // this is equivalent to:
    people.push(Person(172, "Satoshi));

    // elements are added in order:
    uint[] numbers;
    numbers.push(5);
    numbers.push(10);
    numbers.push(15);
    // numbers is now equal to [5,10,15] 


    // solidity fns are public by default, i.e:
    // anyone or any other contract can call your
    // contract's fn and execute its code.

    // declare private fn:
    function _addToArray(uint _number) private {
        numbers.push(_number);
        // Note: convention to prefix private fn names with _
    }
    // now only other functions within our contract
    // will be able to call this number and add to the 
    // numbers array.

    // return a value from a fn:
    string greeting = "It smells like updog";
    function sayHello() public view returns (string memory) {
        // declaring as view fn means it only views the data but does not modify it
        return greeting;
    }

    // fns can also be pure, meaning they don't access ANY data in the app, e.g:
    function _multiply(uint a, uint b) private pure returns (uint) {
        return a * b;
    }

    // Ethereum has the hash fn keccak256 built in
    // hash fns maps an input into a random 256-bit hexadeciaml number
    // slight changes in inputs cause large changes in the hash
    // keccak256 expects a single param of type bytes, i.e: we have to "pack" ant params before calling it, e.g:

    //6e91ec6b618bb462a4a6ee5aa2cb0e9cf30f7a052bb467b0ba58b8748c00d2e5
    keccak256(abi.encodePacked("aaaab"));
    //b1f078126895a1424524de5321b339ab00408010b7cf0e6ed451514981e58aa9
    keccak256(abi.encodePacked("aaaac"));

    // example of converting between data types:
    uint8 a = 5;
    uint b = 6;
    // will throw error b/c a * b returns uint, not uint8
    uint8 c = a * b;
    // we have to typecast:
    uint8 c = a * uint8(b);
}