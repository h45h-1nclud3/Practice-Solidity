// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24; // stating our version

contract SimpleStorage {

    // Basic Data Type: bool, uint, int, address, bytes

    // bool hasFavoriteNumber = false;
    uint256 myFavoriteNumber;
    // int256 favoriteNumberNegative = -88;
    // string favoriteNumberInText = "88";
    // address myAddress = 0x88E767f40147FaA85f1F052E6f0542Ef3662F9e9;
    // bytes32 favoriteBytes32 = "Cats";

    // uint256[] listOfFavoritNumbers;
    
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    // Person public friend = Person(30, "Amr");
    // Person public friend = Person({favoriteNumber: 30, name: "Amr"});

    mapping(string => uint256) public nameToFavoriteNumber;

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256){
        return myFavoriteNumber;
    }
}
