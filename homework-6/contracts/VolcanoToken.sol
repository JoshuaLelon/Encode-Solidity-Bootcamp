// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VolcanoToken is ERC721("VolcanoToken", "VCTK"), Ownable {
    struct Metadata {
        uint256 timestamp;
        uint256 tokenId;
        string tokenURI;
    }

    mapping(address => Metadata[]) ownership;

    uint256 tokenId;

    function mint() {
        Metadata memory newTokenData = Metadata(
            block.timestamp,
            tokenId,
            "any string"
        );
        ownership[msg.sender].push(newTokenData);
        tokenId++;
    }

    function burn(uint256 tokenId) {
        
    }
}
