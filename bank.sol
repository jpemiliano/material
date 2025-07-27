//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Bank {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        require(msg.value > 0, "Deposite mais que 0");
        address sender = msg.sender;
        balances[sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Saldo insuficiente");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
