pragma solidity >=0.5.0 <0.6.0;

contract HelloWorld {

}

contract Example{

    uint myUnsignedInteger = 100; // create uint == 100
    // this will be stored permanently in the blockchain

    uint x = % **2; // equal to 5^2 == 25 (math in solidity is straightforward)

    string greeting = "Hello world!"

    // create Person strcut with age and name properties
    struct Person {
        uint age;
        string name;
    }

    // array with fixed length of 2 elements
    uint[2] fixedArray;
    // another fixed Array, can contain 5 strings:
    string[5] stringArray;
    // a dynamic array with no fixed size and can keep growing:
    uint[] dynamicArray;

    // create an array of structs:
    Person[] people; // dynamic array, can keep adding to it
    // useful for storing structured data in our contract (like database)

    // can declare array as public:
    Person[] public people; // solidity automaticaly creates getter method
    // other contracts can now read from, but not write to this array
    // useful pattern for storing public data in our contract

}