// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract variables{

    //three types
    //local: inside function, not store in blockchain
    // state : store in blockchain
    //global : taking information of blockchain example:msg.sender,msg.value,block.timestamp

    uint public num = 95; // state variable

    function values() public pure returns(uint){
        // local variable
        uint value = 96;
        return value;
    }

    uint public timestamp = block.timestamp;
    address public sender = msg.sender;

}