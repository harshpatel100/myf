//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

contract ifelse{

    uint public age;

    function isAdult(uint _age) public pure returns(bool) {

        if(_age>18){
            return true;
        }
        else{
            return false;
        }
    } 

}

contract ternary{

    uint public age;

    function isAdult(uint _age) public pure returns(bool) {

        return _age > 18 ? true : false;
    } 

}