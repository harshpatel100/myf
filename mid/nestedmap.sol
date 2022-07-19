//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

contract Nestedmapping {

    /*

    ----------------------------------------
     nested mapping datastructure for storing hours
     based on month & days
    -----------------------------------------

    
     month1 => day1 => hour 1
                      => hour 4
                      => hour 6
             
               => day2 => hour 2
                      => hour 3
                      => hour 4
                      => hour 7

        month2  => day1 => hour 1
                      => hour 4
                      => hour 6
             
                => day2 => hour 2
                      => hour 3
                      => hour 4
                      => hour 7  
    
    */
     mapping(uint => mapping(uint => uint)) public getHours;


    //set value
    function set(uint month,uint day, uint hour) public {
        getHours[month][day] = hour ;
    }

    function get(uint month ,uint day) public view returns(uint) {
        return getHours[month][day];
    }

    function deleteElement(uint month,uint day) public{
        delete getHours[month][day];
    }

}