
//SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.13;

contract AbiDecode {



    // ABI Encode : data => bytes 
    // ABI Decode : bytes => data

    struct Mystruct {
        string name;
        uint[2] nums;
    }

    function encode (uint x , address addr , uint[] calldata arr , Mystruct calldata mystruct )
    external pure returns(bytes memory) {

            return abi.encode(x,addr,arr, mystruct);
    }

    function decode ( bytes calldata data) external pure 
    returns(uint x ,address addr , uint[] memory arr, Mystruct memory mystruct)
     {
        (x , addr , arr , mystruct) = abi.decode(data , (uint , address , uint[] ,Mystruct));
    }

}


// donate me for running this website (address is given in website)

