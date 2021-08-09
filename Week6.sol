// SPDX-Lincense-Identifier: GPL-3.0
pragma solidity 0.8.0;
contract Week6{
   bytes32 Location;
   bytes32 LocationOne;

    function GetOne(string memory _name,uint _streetNumber) public {
        Location=keccak256(abi.encodePacked(_name,_streetNumber));

    }

    function GetTwo(string memory _theName, uint _number)public {
        LocationOne=keccak256(abi.encodePacked(_theName,_number));

    }
    function viewHarsh()public view returns(bytes32, bytes32) {
        return (Location,LocationOne);
        
    }
 }