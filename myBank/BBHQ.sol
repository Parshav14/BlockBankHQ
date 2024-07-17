// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract myBank {
    struct Account {
        address owner;
        uint256 balance;
        uint256 accountCreationTime;
    }
    mapping(address => Account) public BlockBankHQ;

    event balanceAdded(address owner, uint256 amount, uint256 timestamp);
    event withdrawlAmount(address owner, uint256 amount, uint256 timestamp);

    modifier minimum () {
        require(msg.value >= 1 ether, "Please add the minimum funds for account creation");
        _;
    }

    function accountCreated()
        public payable minimum {
            BlockBankHQ[msg.sender].owner = msg.sender;
            BlockBankHQ[msg.sender].balance = msg.value;
            BlockBankHQ[msg.sender].accountCreationTime = block.timestamp;

            emit balanceAdded(msg.sender, msg.value, block.timestamp);
        }

    function depositAmount()
       public payable minimum {
        BlockBankHQ[msg.sender].balance += msg.value;

        emit balanceAdded(msg.sender, msg.value, block.timestamp);
       }

    function withdrawMoney()
    public payable {
        // require(msg.value >= 10 ether && msg.value <= 1000 ether, "Please enter the value in between it.");
        payable(msg.sender).transfer(BlockBankHQ[msg.sender].balance);
        BlockBankHQ[msg.sender].balance = 0;
        emit withdrawlAmount(msg.sender, BlockBankHQ[msg.sender].balance, block.timestamp);
    }

}