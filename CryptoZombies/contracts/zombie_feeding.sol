// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; //>=0.5.0 <0.6.0;

//import ZombieFactory contract:
import "./zombie_factory.sol";

contract ZombieFeeding is ZombieFactory {
    function feedAndMultiply(uint256 _zombieId, uint256 _targetDna) public {
        //only let zombie owner feed:
        require(msg.sender == zombieToOwner[_zombieId]);
        // declare local Zombie (storage pointer)
        Zombie storage myZombie = zombies[_zombieId];
    }
}
