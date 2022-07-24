

    /* file structure-
    
    |  
           | foo.sol
           | import.sol
                    
                 */

//////////////////////////////////////////////

 //our foo file 
 //foo.sol

/*
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

     contract foo{
        string public name = 'patel';
      }
*/

////////////////////////

pragma solidity ^0.8.13;


//import from current directory
import "./Foo.sol";

contract importContract{

    Foo foo = new Foo();

    function getfooname() public view returns(string memory){
        return foo.name();
    }





}




