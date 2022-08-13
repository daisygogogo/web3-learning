//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import './SimpleStorage.sol';

// 'is' here is the keyword for inherit. ExtractStorage inherit SimpleStorage, so it has all the function of SimpleStorage.
// it can also rewrite some function of SimpleStorage.
contract ExtractStorage is SimpleStorage{

    // virtual override
    // if a function is able to be overriden, it should have the keyword 'virtual'. Add it to function store in SimpleStorage
    // if a function is overriding a parent function, it should have the keyword 'override'
    function store(uint256 _simpleStorageIndex) public override{
        _simpleStorageIndex = _simpleStorageIndex + 1;
    }
}