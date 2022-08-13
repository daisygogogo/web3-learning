//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import './SimpleStorage.sol';

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorage() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    // address, address is very important for a contact. You can use like this: Simplestorage simpleStorage = new SimpleStorage(address);
    // ABI - Application Binary Interface
    // function store of SimpleSorage can be called in StorageFactory now;
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public{
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function getStore(uint256 _simpleStorageIndex) public view returns (uint256){
        return simpleStorageArray[_simpleStorageIndex].retrive();
    }
}