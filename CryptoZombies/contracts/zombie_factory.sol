pragma solidity >=0.5.0; // solidity version

// create contract:
contract ZombieFactory {
    // make event to let front-end know each time new
    // zombie was made, so app can display it:
    event NewZombie(uint256 zombieId, string name, uint256 dna);

    uint256 dnaDigits = 16; // zombie DNA is determined by 16-digit number
    uint256 dnaModulus = 10**dnaDigits; // to ensure zombie DNA is only 16 chars

    // create Zombie struct with name and dna properties:
    struct Zombie {
        string name;
        uint256 dna;
    }

    // create public array of Zombie structs & store our zombie army in our app:
    Zombie[] public zombies; // dynamic can keep growing; can show to other apps

    // use mappings to store zombie ownership:
    // 1. track address that owns a zombie,
    // 2. how many zombies an owner has.
    mapping(uint256 => address) public zombieToOwner;
    mapping(address => uint256) ownerZombieCount;

    // create private fn named createZombie
    // accept 2 params: _name::str and _dna::uint
    // pass the 1st param by value using memory keyword
    function _createZombie(string memory _name, uint256 _dna) private {
        // use args to create new Zombie, adding it to zombies array
        // zombies.push(Zombie(_name, _dna));
        // get idx of new zombie in zombies array:
        uint256 id = zombies.push(Zombie(_name, _dna)) - 1;
        // store new zombie ownership:
        zombieToOwner[id] = msg.sender;
        // update owner zombie count
        ownerZombieCount[msg.sender]++;
        // fire NewZombie event once new zombie has been added to array:
        emit NewZombie(id, _name, _dna);
    }

    // write hlpr fn which gets random DNA num from str:
    function _generateRandomDna(string memory _str)
        private
        view
        returns (uint256)
    {
        // generate pseudo-random number (hexadecimal):
        uint256 rand = uint256(keccak256(abi.encodePacked(_str)));
        // takes hash of packed _str and casts as uint
        return rand % dnaModulus; // so DNA is only 16 digits long
    }

    // create public fn that takes zombie name as input,
    // and uses this to create a zombie with random DNA:
    function createRandomZombie(string memory _name) public {
        // prevent user from creating unlimited zombies. only allow
        // user to create their first
        //zombie. Throws error otherwise.
        require(ownerZombieCount[msg.sender] == 0);
        // run gen random dna fn:
        uint256 randDna = _generateRandomDna(_name);
        // make the zombie:
        _createZombie(_name, randDna);
    }
}
