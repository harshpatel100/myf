// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract primitiveVar {

    // address of ethereum accounts
    address public deployer = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    //msg is global object 
    //msg.sender returns sender's address
    address public sender = msg.sender ;


    // public for anyone can use 
    //private , internal ,public 

    bool public button ;
    // by default false

    bool public done = true;

    ////////////////////////////

    /*
     uint is datatype for unsigned(not negative) value
    uint8 : range 0 to 2**8 -1 
    uint16 : range 0 to 2**16 -1
    uint 256 : range 0 to 2**256 -1


    int is datatype for both values
    int256 : range -2**256 to 2**256 -1
    int128 : range -2**128 to 2**128 -1
    */

    uint public val;
    // by default zero

    uint8 public u8 = 2;
    uint256 public u = 955;
    uint public u2 = 90;

    int public u3 = -5;
    int public u4 = 95;

    //min - max value of integers

    int public minval = type(int).min;
    int public maxval = type(int).max;

    /*
    byte = array of byte

    two types
    1. fixed value array
    2. dynamic array length

    dynamic array is describe with byte[]

    */

    bytes1 public a = 0xb5;  // [10110101]
    bytes2 public b = 0x5656;  //  [0101011001010110]

    

}