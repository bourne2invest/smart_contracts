// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; //>=0.5.0 <0.6.0;

//import ZombieFactory contract:
import "./zombie_factory.sol";

contract KittyInterface {
    function getKitty(uint256 _id)
        external
        view
        returns (
            bool isGestating,
            bool isReady,
            uint256 cooldownIndex,
            uint256 nextActionAt,
            uint256 siringWithId,
            uint256 birthTime,
            uint256 matronId,
            uint256 sireId,
            uint256 generation,
            uint256 genes
            //note:recall uint is alias for uint256
        );
}

contract ZombieFeeding is ZombieFactory {
    //set CrytpoKitties contract address:
    address ckAddress = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;
    //create KittyInterface & initialize with ckAddress:
    KittyInterface kittyContract = KittyInterface(ckAddress);

    function feedAndMultiply(
        uint256 _zombieId,
        uint256 _targetDna,
        string memory _species
    ) public {
        //only let zombie owner feed:
        require(msg.sender == zombieToOwner[_zombieId]);
        // declare local Zombie (storage pointer)
        Zombie storage myZombie = zombies[_zombieId];

        //ensure zombie/target Dna is 16 digits
        _targetDna = _targetDna % dnaModulus;
        //set newDna as average of Zombie and target dna
        uint256 newDna = (myZombie.dna + _targetDna) / 2;
        //modify new Dna if zombies is made from a kitty
        if (
            keccak256(abi.encodePacked(_species)) ==
            keccak256(abi.encodePacked("kitty"))
        ) {
            //enforce cat-zombie dna ends in 99 (for 9 lives):
            newDna = newDna - (newDna % 100) + 99;
            //e.g: newDna = 334455, then newDna % 100 is 55
            // then newDna - newDna % 100 is 334400.
            // finally add 99 so last 2 digits of dna ends in 99.
        }
        // create new zombie with new dna
        _createZombie("NoName", newDna);
    }

    // make fn feedOnKitty, gets kitty genes from the contract:
    function feedOnKitty(uint256 _zombieId, uint256 _kittyId) public {
        // declare uint kittyDna
        uint256 kittyDna;
        // get genes from getKitty and store as kittyDna:
        (, , , , , , , , , kittyDna) = kittyContract.getKitty(_kittyId);
        //call feedAndMultiply fn w/ zombie and kitty:
        feedAndMultiply(_zombieId, kittyDna, "kitty");
    }
}
