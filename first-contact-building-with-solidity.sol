//SPDX-License-Identifier: MIT
pragma solidity 0.8.7; // first line should show the version of the solidity. Or write like this >=0.8.7 <0.9.0 or ^0.8.7

// code would be compile to EVM, the Ethereum Virtual Machine
contract SimpleStorage { // contract is a keyword like class
    //unit 256, bool, byte32
    uint256 public favoriteNumber; // type - visibility - variable
    
    People public person = People({favoriteNumber:2, name:"daisy"});

    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People{ // strut helps to create a new type
        uint256 favoriteNumber; //it will have the index of 0
        string name;  // it will have the index of 1
    }

   // view, pure，means that the function not goning to change anything, just to read the state
   //those functions doesnt spend gas to run
   //but if you put it into the store function, it will still cost gas
    function retrive() public view returns (uint256){
        return favoriteNumber;
    }

    People[] public peopleList;

// calldata, memory means that it only going to exists temporarily , a calldata variable can not be modified, like the keyword 'const' in javaScript
// stotage means it exists even outside the function exactuted
    function addPeople(string memory _name, uint256 _favoriteNumber) public {
        People memory newPerson = People(_favoriteNumber,_name); //generated in this way, parameter order should be same as defined in struct. 
        //or you can generate this People({name:_name,favoriteNumber:_favoriteNumber})
        peopleList.push(newPerson);
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}