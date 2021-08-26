

// A particular financial institution is looking to have their records stored onchain and
// looking to have an *external *identifier tied to each customers Details....the identifier
// should be the keccak256 hash of the customer's name and time of registration ,
// each customer can also approve another customer to view their details[meaning that only admins and approved
// customers have the right to view another customer's data]....For simplicity purposes, the Bank is looking to
// have a separate contract that has all setter functions and another contract that has all the
// *getter * functions(Interacting with each other of course)..Finally, they want
// an interface for all the contracts they have......NOTE: USE THE APPROPRIATE FUNCTION AND VARIABLE VISIBILITY SPECIFIERS
// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract Setter{
    // state variables
    address public admin;
    bytes4 public Id;
    bool public exists;
    struct Customer {
        address user;
        string name;
        bytes4 hash;
    }
//   mapping of the customers Id that is the hashed value of the name and time of creation to the struct

    mapping(bytes4 => Customer) public CustomerId;
    mapping(bytes4 => mapping(address => bool)) public nestedToBool; // to check for both the address and the Id of customer if true.
    
    constructor(){
        admin = msg.sender; // making the msg.sender the admin
    }
    // this "createCustomer" accepts the data of an intending customer, creates a new customer by accepting all the data into the struct.
    function createCustomer(string memory _name) public {
        Id = bytes4(keccak256(abi.encodePacked(_name, block.timestamp)));
        Customer storage newCustomer = CustomerId[Id];
        newCustomer.user = msg.sender;
        newCustomer.name = _name;
        newCustomer.hash = Id;
        
    }
    
    // this function allows only the permitted users i.e the admin and a customer to access the details of a customer.
    function accessToDetails(address _newCustomer, bytes4 _Id) public {
        require(_newCustomer == msg.sender, "Not a Customer");
        require (nestedToBool[_Id][_newCustomer] = true, "Not a Customer");
    }
}
    

interface ISetter {
     struct Customer{
        address user;
        string name;
        bytes4 hash;
    }
    function createCustomer(string memory _name) external;
    function accessToDetails(address _newCustomer, bytes4 _Id) external;
    
    
}