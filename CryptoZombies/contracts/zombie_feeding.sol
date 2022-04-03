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
        );
}

contract ZombieFeeding is ZombieFactory {
    //set CrytpoKitties contract address:
    address ckAddress = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;
    //create KittyInterface & initialize with ckAddress:
    KittyInterface kittyContract = KittyInterface(ckAddress);

    function feedAndMultiply(uint256 _zombieId, uint256 _targetDna) public {
        //only let zombie owner feed:
        require(msg.sender == zombieToOwner[_zombieId]);
        // declare local Zombie (storage pointer)
        Zombie storage myZombie = zombies[_zombieId];

        //ensure zombie/target Dna is 16 digits
        _targetDna = _targetDna % dnaModulus;
        //set newDna as average of Zombie and target dna
        uint256 newDna = (myZombie.dna + _targetDna) / 2;
        // create new zombie with new dna
        _createZombie("NoName", newDna);
    }
}
