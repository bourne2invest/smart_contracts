pragma solidity >=0.5.0;

contract HelloWorld {}

contract Example {
    uint256 myUnsignedInteger = 100; // create uint == 100
    // this will be stored permanently in the blockchain

    uint256 x = 5**2; // equal to 5^2 == 25 (math in solidity is straightforward)

    // create string state var greeting
    string greeting = "Hello world!";

    // create Person struct with age and name properties:
    struct Person {
        uint256 age;
        string name;
    }

    //// add example arrays
    // array with fixed length of 2 elements:
    uint256[2] fixedArray;
    // another fixed Array, can contain 5 strings:
    string[5] stringArray;
    // a dynamic array with no fixed size and can keep growing:
    uint256[] dynamicArray;

    // create an array of structs, named people:
    // Person[] people; // dynamic array, can keep adding to it

    // useful for storing structured data in our contract (like a database)

    // can declare array as public:
    Person[] public people; // solidity automatically creates getter method
    // other contracts can now read from, but not write to this array
    // this is a useful pattern for storing public data in our contract
}
