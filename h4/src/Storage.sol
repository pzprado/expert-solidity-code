// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Store {
  struct payments {
    uint256 initialAmount;
    uint256 finalAmount;
    uint256 amount;
    bool valid;
    address sender;
    uint8 paymentType;
    address receiver;
    bool checked;
  }
  uint256 public number;
  mapping(address => uint256) balances;
  address admin;
  uint8 index;
  bool flag1;
  bool flag2;
  bool flag3;
  address admin2;
  payments[8] topPayments;

  constructor() {}

  function setNumber(uint256 newNumber) public {
    number = newNumber;
  }

  function increment() public {
    number++;
  }
}
