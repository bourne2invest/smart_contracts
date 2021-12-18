pragma solidity >=0.5.0; // solidity version

// create contract:
contract ZombieFactory {
    uint256 dnaDigits = 16; // zombie DNA is determined by 16-digit number
    uint256 dnaModulus = 10**dnaDigits; // to ensure zombie DNA is only 16 chars

    // create Zombie struct with name and dna properties:
    struct Zombie {
        string name;
        uint256 dna;
    }

    // create public array of Zombie structs & store our zombie army in our app:
    Zombie[] public zombies; // dynamic can keep growing; can show to other apps
}
