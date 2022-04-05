// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// in solidity, users will have to pay every time they executing a fn on our DApp using gas (gwei), which is a transaction fee in Ether (ETH).

// how much gas is required to execute a fn depends on how complex the logic is.
// each operation has a gas cost based on how much computing resources will be required to performt that operation (e.g: writing to storage is much more expensive than adding two integers).
// the total gas cost of our fn is the sum of the gas costs of all its individual operations!

//thus, code optimization is very important, otherwise it could incur exorbitant fees across many users.


// Struct packing to save gas:

// Usually there's no benefit to specifying uint sub-types because Solidity reserves 256 bits of storage regardless of uint size.
// E.g: using uint8 vs uint (uint256) won't save any gas.
// However, there is an exception: inside structs.

// if you have multiple uints inside a struct, using a smaller-sized uint when possible will allow Solidity to pack these variables together to take up less sotrage:
struct NormalStruct {
    uint a;
    uint b;
    uint c;
}
 struct MiniMe {
     uint32 a;
     uint32 b;
     uint c;
 }

// `mini` will cost less gas than `normal` because of struct packing:
NormalStruct normal = NormalStruct(10, 20, 30);
MiniMe mini = MiniMe(10, 20, 30);

// also want to cluster identical dtypes together (next to each other in the struct) so Solidity will minimze the required storage space.
// `uint c; uint32 a; uint32 b;` will cost less gas than a struct with fields 
// `uint32 a; uint c; uint32 b;`

// moral: inside a struct use the smallest integer sub-types possible,
// and group identical dtypes together
// for gas optimization.
