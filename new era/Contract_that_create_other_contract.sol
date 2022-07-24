// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//with help of new keyword
//new keyword support create2 feature by salt

contract Car {
    address public owner;
    string public model;
    address public carAdd;

    constructor(address _owner,string memory _model) payable{
        // if wanna set price of car 
       // require(msg.value == 1 ether);
        owner =_owner;
        model =_model;
        carAdd = address(this);
    }

  
}


contract CarFactory{

    Car[] public cars;

    function create(address _owner,string memory _model) public{
       Car car = new Car(_owner,_model);
       cars.push(car);
    }


    // salt allow to predict the contract address before it is created
    function create2(address _owner,string memory _model,bytes32 _salt) public{
        Car car = (new Car){salt:_salt}(_owner,_model);
        //Example: _salt = 0x7465737400000000000000000000000000000000000000000000000000000000
        //0x6162636400000000000000000000000000000000000000000000000000000000
        //0x followed by 64 hexadecimal value
        cars.push(car);
    }

    function create2AndSendEther(address _owner,string memory _model,bytes32 _salt)payable public{
        Car car = (new Car){value:msg.value,salt:_salt}(_owner,_model);
        cars.push(car);
    }

    function getCar(uint index) public view returns(address owner,string memory model,address carAddr,uint balance){
        Car car = cars[index];
        return(car.owner(), car.model(),car.carAdd(),address(this).balance);
    }

     

}