//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

/*
   use for
   
   => Restrict Access
   => validate inputs
   => Guide against Reentrancy hack
*/

contract FunctionModifier {

    address public owner ;
    uint public x = 10;
    bool public locked;

    constructor(){
        owner = msg.sender;
    }

    //simple modifier
    modifier onlyOwner{
        require(msg.sender == owner , 'only owner can access');
        _; // meaning rest of code of any function
         
    }

    //modifier with argument
    modifier validAddress(address addr) {
        require(addr != address(0),'not valid address');
        _;
    }

    //lets use in this function
    function changeowner(address _newOwner)public onlyOwner validAddress(_newOwner){
        owner = _newOwner;
    }

    // modifier can be called before and after function
    //modifier can be called before function
    //modifier can be called after function
    modifier noReentrancy(){
        require(!locked ,"no Reentrancy");
        //before
        locked = false;
        //function code
        _;
        //after
        locked = true;
    }

    function decrement(uint i) public noReentrancy {
        x = x-i;
        if(i>1){
            decrement(i-1);
        }
    }

}