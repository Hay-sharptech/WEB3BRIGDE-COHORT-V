pragma solidity 0.8.0;
contract Mappyn{     
    mapping(address => uint) private addressToInt;
    mapping(address => bytes32) private addressToHashes;
    function 1stfirst() public returns(bool){
        addressToInt[msg.sender]++;
        addressToHashes[msg.sender] = keccak256(abi.encodeWithSignature("1stfirst()"));
        return true;
    }
     function second() public returns(bool){
         addressToInt[msg.sender]++;
         addressToHashes[msg.sender] = keccak256(abi.encodeWithSignature("second()"));
        return true;
    }
     function third() public returns(bool){
         addressToInt[msg.sender]++;
         addressToHashes[msg.sender] = keccak256(abi.encodeWithSignature("third()"));
        return true;
    }

   
 function 3rdthird() public returns(bool){
         addressToHashes[msg.sender] = keccak256(abi.encodeWithSignature("3rdthird()"));
         addresstofInt[msg.sender]++;
        return true;
    }
}
 