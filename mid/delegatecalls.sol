//SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.13;


    // delegatecall is law level function similar to call

    // contract A executes delegatecall to contract B , B's code is executed
    //with contract A's storage , msg.sender and msg.value



    ///////////////////////////////////////////////
    //       USE FOR CHANGE CONTRACT LOGIC       // 
    //////////////////////////////////////////////


    // A => B (call delegate with this B'address 0x3c725134d74D5c45B4E4ABd2e5e2a109b5541288 ...) 
    // then  A's state variable num = num - 2

    // A => B (call delegate with this B'address 0x2E9d30761DB97706C536A112B9466433032b28e3 ...) 
    // then  A's state variable num = num + 2

    // A's state variable change according to different logic



    //let's 
    
    contract B{
        uint public num;
        address public sender;
        uint public value;

        function set(uint _num) public payable {
            num = _num + 2;
            sender = msg.sender;
            value = msg.value;
        }
    }


    /*
        contract B{
        uint public num;
        address public sender;
        uint public value;

        function set(uint _num) public payable {
            num = _num - 2;
            sender = msg.sender;
            value = msg.value;
        }
    }
    */

    contract A {
        uint public num;
        address public sender;
        uint public value;

        function set(address _contract , uint _num) public payable{
            // A's storage is set, B is not modified
            // delegatecall is too powerfull , must learn topic

           /*  1st way
           
            (bool success , bytes memory data) = _contract.delegatecall(
                abi.encodeWithSignature("set(uint256)",_num)
            );
            
            */
            
            (bool success , bytes memory data) = _contract.delegatecall(
                abi.encodeWithSelector(B.set.selector,_num)
            );
            require(success);
        }
    }



// please fund me little for running this website (address given in website)