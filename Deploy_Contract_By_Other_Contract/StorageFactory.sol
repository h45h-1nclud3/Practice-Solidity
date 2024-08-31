// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorgeContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        listOfSimpleStorageContracts.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        SimpleStorage s = listOfSimpleStorageContracts[_simpleStorageIndex];
        s.store(_newSimpleStorageNumber);
    }

    function sfGetByIndex(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage s = listOfSimpleStorageContracts[_simpleStorageIndex];
        return s.retrieve();
    }

    function sfGetByAddress(address _simpleStorageAddress) public view returns(uint256){
        SimpleStorage s = SimpleStorage(_simpleStorageAddress);
        return s.retrieve();
    }
}   
