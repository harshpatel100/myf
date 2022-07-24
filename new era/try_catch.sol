// SPDX-License-Identifier: UNLICENCED
pragma solidity ^0.8.13;

    contract Foo {

        address public owner;
        constructor(address _owner){
            require(_owner != address(0), "invalid address");
            assert(_owner != 0x0000000000000000000000000000000000000001);
            owner = _owner;

        }
         
         function myfunc(uint x)public pure returns(string memory){
            require(x!=0);
            return "myfunction is called";
        }

    }

    contract test {

        event Log(string message);
        event LogBytes(bytes data);

        Foo public foo;
        constructor(){
            foo = new Foo(msg.sender);
        }

    

    function tryCatchExternalCall(uint _i) public {

        // tryCatchExternalCall(0) => Log("external call failed")
        // tryCatchExternalCall(1) => Log("my func was called")
    

        try foo.myfunc(_i) returns (string memory result){
            emit Log(result);
        }
        catch {
            emit Log("external call failed");
        }
    }
 

    // Example of try / catch with contract creation
    // tryCatchNewContract(0x0000000000000000000000000000000000000000) => Log("invalid address")
    // tryCatchNewContract(0x0000000000000000000000000000000000000001) => LogBytes("")
    // tryCatchNewContract(0x0000000000000000000000000000000000000002) => Log("Foo created")
  

    function tryCatchNewContract(address _owner)public {
        try new Foo(_owner) returns (Foo foo2){
            //you can use var foo2 here
            emit Log("foo created");
        }
        catch Error(string memory reason){
            //catch failing revert() and require()
            emit Log(reason);
        }
        catch(bytes memory reason){
            //catch failing assert()
            emit LogBytes(reason);
        }

    }


    }