// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Array {
    // State variables
    uint[] public arr = [2,67,84,55,4,89,12];
    address public owner;

    // Constructor
    constructor() {
        owner = msg.sender;
    }

    // Functions
    function addNumber(uint256 _number) public {
         require(
            msg.sender == owner,
            "Only the contract owner can call this function."
        );
        arr.push(_number);
    }

    function removeNumber() public {
        uint _index = getRandomNumber();
        require(_index < arr.length -1, "Index out of bounds");
        console.log("Index is", _index);
        console.log("Index number is", arr[_index]);
        console.log("Last number is", arr[arr.length-1]);
        console.log("Array length is (before remove)", arr.length-1);
        // this swaps the last number with the number at the determined index
        arr[_index] = arr[arr.length - 1];
        console.log("New last number is", arr[arr.length-1]);   
        arr.pop();
        console.log("Array length is (after remove)", arr.length-1);
    }

    
    // Getters

    function getRandomNumber() public view returns (uint) {
        uint len = arr.length;
        // uint b = block.number;
        uint hashNumber =  uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, msg.sender)));
         return hashNumber % len;
    }

    function getArray() public view returns (uint[] memory _arr) {
        _arr = arr;
    }

     function getArrLen() public view returns (uint){
        return arr.length - 1;
    }
}