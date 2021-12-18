pragma solidity >=0.5.0 <0.6.0; // solidity version

// create contract:
contract ZombieFactory {

    uint dnaDigits = 16; // zombie DNA is determined by 16-digit number
    uint dnaModulus = 10 ** dnaDigits; // to ensure zombie DNA is only 16 chars

}
