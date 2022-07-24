// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract errors {

    
    // require(condition , "message")
    // condition must be satisfied for next executions

    function isAdult1(uint _age) public pure{
        require(_age>18 , "this is not adult, execution not does");
        
    }

    // revert("message pass")

    function isAdult2(uint age) public pure{
        if(age <18){
            revert("this is not adult, execution not does");
        }
    
    }

    //assert use for checking tests

    function isNumberZero(uint _value) public pure {
        assert(_value ==0);
        
     

    }

    // custum error

    error valuemustbetween100and200(uint value);

    function cerror(uint value) public pure {
        if(value<100 || value>200){
            revert valuemustbetween100and200(value);
             
        }
       
    
    }

    // onother example of custom error
    
   // custom error
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }

}