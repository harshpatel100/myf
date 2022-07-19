//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

//gas pay = gas spend * gas price

//gas spend : if you use + operator then your gas spend is 3 
// means traveling for 30 km takes 2Liter petrol

//gas price : price of gas
// means price of 1L petrol is 3 doller then

// petrol pay = 2 * 3 = 6 Doller

/////////////////////////////////

//gas limit = maximum gas spend for execution
//gas limit must needed because of infinite loop condition
// ( your whole balance reduce zero if gaslimit not set then )

//"block gas limit" : per block maximum gas 
//(current 30 millian gas is set)



contract infiniteLoop {

    // this code is infine execution
    // so my gas limit = 3000000 gas
    // s0 after 3000000 gas execution stop 

    uint i = 0;
    uint n;
    function infinite() public{
        while(i==0){
            n+=1;
        }
    }
    // my laptop hanged ...dont run 

}