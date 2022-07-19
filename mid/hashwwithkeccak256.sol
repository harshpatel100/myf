//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

contract HashFunction {

    function Hash( string memory _text , uint _num , address  _addr)
    public pure returns(bytes32) {

        return keccak256(abi.encodePacked(_text , _num , _addr));

        // my output for bytes32 : 0x14a39067f7cce462e8aeab5e007d995b972b59048838328bb72c4f5c93adb6b3

        // abi.encodePack(aa,bb) and abi.encodePack(aab,b) both are same
        // i know i write wrong spelling ! hahahaha



    }

     function HashGet( string memory _text)
      public pure returns(bytes32) {

        return keccak256(abi.encodePacked(_text));

        // my output for bytes32 : 0x14a39067f7cce462e8aeab5e007d995b972b59048838328bb72c4f5c93adb6b3

        // abi.encodePack(aa,bb) and abi.encodePack(aab,b) both are same
        // i know i write wrong spelling ! hahahaha



    }
    
    

    
    

}



contract GuessMagicWord {

    bytes32 private answer = 0xa477d97b122e6356d32a064f9ee824230d42d04c7d66d8e7d125a091a42b0b25 ;

    function guess(string memory _word) public view returns(bool){
        return keccak256(abi.encodePacked(_word)) == answer ; 
    }
}