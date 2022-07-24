// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/*
    2 ways we call other contract & change contract's state variable

    1) A.foo(x,y,z) is best
    2) low level call iis not recommended

*/

contract Callee {


    uint public x;
    uint public value;

    function setX(uint _x) public returns(uint){
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns(uint,uint){
        x= _x;
        value = msg.value;
        return (x , value);
    }


}


contract caller {
    function setX2(Callee _callee,uint _x)public{
    uint x = _callee.setX(_x);
    }

    function setXfromAdress(address _addr , uint _x)public{
        Callee _callee = Callee(_addr);
        _callee.setX(_x);
    }
    function setXAndSendEther2(Callee _callee,uint _x)public payable{
     (uint x,uint value) =  _callee.setXandSendEther{value:msg.value}(_x);

    }
}

