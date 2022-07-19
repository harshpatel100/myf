//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

contract loop {
    // loops must be inside the function
    uint public i = 0 ;


    function forloop() public {
        for(i=0;i<=10;i++){
            if(i==3){
                //skip next interection with continue
                continue;
                
            }
            if(i==5){
                //exit from loop
               break;
            }
        }
    }



    function whileloop() public  {

          while(i<=10){
                 i+=1;
          }
    }

}
