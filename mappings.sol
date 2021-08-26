pragma solidity 0.8.0;

// A contract contains two very important mappings which are used to track some very *private* info...
// The first mapping allows you to know how many times an address has called a function,
// the second one allows you to know the function hash that the address called last...
// Write three different functions that don't *really do anything but returns a bool value*
// and update the mappings accordingly

contract Mappyn{     
    mapping(address => uint) private addressToInt;
    mapping(address => bytes32) private addressToHashes;
    function first() public returns(bool){
        addressToInt[msg.sender]++;
        addressToHashes[msg.sender] = keccak256(abi.encodePacked("first()"));
        return true;
    }
     function second() public returns(bool){
         addressToInt[msg.sender]++;
         addressToHashes[msg.sender] = keccak256(abi.encodePacked("second()"));
        return true;
    }
    
   
 function tthird() public returns(bool){
         addressToHashes[msg.sender] = keccak256(abi.encodePacked("tthird()"));
         addressToInt[msg.sender]++;
        return true;
    }
}
 