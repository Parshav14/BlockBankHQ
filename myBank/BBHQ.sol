// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract myBank {
    struct Account {
        address owner;
        uint256 balance;
        uint256 accountCreationTime;
    }
    mapping(address => uint256) public BlockBankHQ;

}