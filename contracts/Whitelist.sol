// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Whitelist {
    uint8 public maxWhiteListedAddress;

    mapping (address => bool) public whiteListAddresses; //if address whitlisted, gets true. By default false for every other.

    uint8 public numAddressesWhiteListed;

    constructor (uint8 _maxWhiteListedAddress) {
        maxWhiteListedAddress = _maxWhiteListedAddress;
    }

    //function to add address of sender to whitelist
    function addAddressToWhiteList () public {
        require(!whiteListAddresses[msg.sender], "Sender is already whitelisted");

        require(numAddressesWhiteListed < maxWhiteListedAddress, "Limit reached, can't add more accounts");

        whiteListAddresses[msg.sender] = true;
        numAddressesWhiteListed += 1;
    }
}

// 0xa6362b21cC72950E7374D0A6997c412a824a0F04