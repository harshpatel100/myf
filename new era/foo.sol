// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

struct point {
    uint x;
    uint y;
}
error unauthoriseduser(address caller);

function add(uint x,uint y) pure returns(uint){
    return x+y;
}

contract Foo{
    string public name = 'patel';
}