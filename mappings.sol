pragma solidity 0.8.0;
contract Mappyn{
    
    
    mapping(address => uint)noOfTimes;
    mapping(address => bytes32)lastCalledAddy;
    
    bool _noOfTimes = true;
    bool _lastCalledAddy=true;
    
    function check(address X, uint Y)private returns(bool) {
        noOfTimes[X]=Y;
        _noOfTimes=false;
        return _noOfTimes;
    } 
    function knowFunHash(address _X, bytes32 value) private returns(bool) {
        lastCalledAddy[_X]=value;
        _lastCalledAddy=false;
        return _lastCalledAddy;
    }
    function updateMappings(address X, uint Y)private{
        noOfTimes[X]+=Y;

    }
    
}