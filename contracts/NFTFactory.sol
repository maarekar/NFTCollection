// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "hardhat/console.sol";

contract NFTFactory is ERC1155 {
    uint256 public tokenCounter; 
    string tokenURI;

    constructor(string memory _tokenURI) public ERC1155(_tokenURI) {
        tokenURI = _tokenURI;
        tokenCounter = 0;
    }

    function createNFT() public{
        uint256 newTokenID = tokenCounter;
        _mint(msg.sender, newTokenID, 1, "");
        tokenCounter = tokenCounter + 1;

        console.log(newTokenID);
    }

    function uri(uint _tokenID) override public view returns(string memory) {
        return string(abi.encodePacked(tokenURI,
             "/",
            Strings.toString(_tokenID),
            ".json"
        ));
    }


}