contract Impt{
    
    function criticalFun1(address k,address l,address m)internal view returns(bytes32 hashAll){
        bytes32 hashKL=keccak256(abi.encodePacked(k,l));
      hashAll = keccak256(abi.encodePacked(hashKL,m));
    }
     
     function criticalFun2(uint hay, bytes32 value)public view returns(bytes32 finalHash){
        bytes32 hashNum=keccak256(abi.encodePacked(value));
        uint _hashNum=uint(keccak256(abi.encodePacked(hay)));
     bytes32 firstFunction=criticalFun1(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB,0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c);
     finalHash=keccak256(abi.encodePacked(firstFunction,hashNum,_hashNum));
      }   
}
