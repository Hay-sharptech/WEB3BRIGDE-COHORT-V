pragma solidity ^0.8.0;
import "./Setter.sol";
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

// Getter is Inheriting the contract Context. This is because when msg.sender calls a function we want it to be in the context of this contract. 
contract Getter is Context{ 
   Setter getter;
    constructor(address _deployer ) {
        getter = Setter(_deployer);
    }
    modifier approveToView(bytes4 Id) { // a check point
        require(getter.admin() == _msgSender(), "You're not admin");
        require(getter.nestedToBool(Id,_msgSender()) == true, "Opps! Not a customer");
        _;
    }
    function getUser(bytes4 Id) public view approveToView(Id) returns(address, string memory, bytes4) {
        return getter.CustomerId(Id);
    }
}
