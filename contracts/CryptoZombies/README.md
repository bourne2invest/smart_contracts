# CyptoZombies

cryptozombies.io

We are going to build a "Zombie Factory" which will enable us to deploy (create) an army of zombies (NFTs).
- This factory will maintain a database of all our zombies
- This factory which have a function or mechanism for creating new zombies
- Each zombie will have a random and unique appearance

Later we will add more functionality, such as giving zombies ability to attach humans or other zombies (NFTs interacting with other NFTs). First, we must add functionality of creating new zombies.

## Zombie DNA

Zombie DNA will be a 16-digit integer, for e.g:
`8356281049284737`

Just like in real DNA, different parts of this number will match to different traits. The 1st 2 digits will map to head type, 2nd 2 digits to zombie eyes, and so on.

### Note: we will keep things simple and the zombies can only have 7 different types of each trait, even though 2 digits allow 100 possible outcomes (0-99).

## Example

The first 2 digits of our example DNA above are `83`. So in our case, to see the head-type it would be `83 % 7 + 1 = 7`. So this Zombie would have the 7th head type.