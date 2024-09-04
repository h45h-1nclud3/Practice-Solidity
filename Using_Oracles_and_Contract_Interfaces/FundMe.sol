// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {PriceConverter} from "./PriceConverter.sol";

// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD
contract FundMe {
    
    using PriceConverter for uint256;

    address public owner;
    uint256 public minimumUSD = 5e18;
    address[] funders;
    mapping(address funder => uint256 amountFunded) public fundersToFunds;

    constructor() {
        owner = msg.sender;
    }

  
    function fund() public payable {
        // Allow users to send money
        // Have a minimum money sent
            // 1. How to send ETH to this contract
        uint256 fundAmount = msg.value.getConversionRate();   
        require(fundAmount >= minimumUSD, "You Poor!");
        funders.push(msg.sender);
        fundersToFunds[msg.sender] += fundAmount;
    }

    function withdraw() public OnlyOwner{
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            fundersToFunds[funder] = 0;
        }

        funders = new address[](0);


        // Transfering ETH

        // 1. transfer
        // payable(msg.sender).transfer(address(this).balance);

        // 2. send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send function failed!");

        // 3. call
        (bool callSuccess, /* bytes memory dataReturned*/) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call function failed!");
    }


    modifier OnlyOwner {
        require(msg.sender == owner, "Must be ownere!!!");
        _;   
    }
    

}
