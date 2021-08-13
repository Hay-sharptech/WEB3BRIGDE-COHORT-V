pragma solidity 0.8.0;

contract array {

 uint[4] public houses;
    uint[3] public flats;
    uint[5] public rooms;
    uint[] public people=[1,2,3,4,5];
    uint public noOfFlats = houses.length * flats.length;
    uint public noOfRooms = flats.length * rooms.length;
uint public totalOccupants= people.length * noOfRooms;
    
}