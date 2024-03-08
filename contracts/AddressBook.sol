// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract AddressBook {
    mapping(address => address[]) private _addresses;
    mapping(address => mapping(address => string)) private _aliases;

    event AddressAdded(address indexed owner, address addedAddress, string info);
    event AddressRemoved(address indexed owner, address removedAddress);


    function getAddress(address adrs) public view returns (address[] memory) {
        return _addresses[adrs];
    }

    function addAddress(address adrs, string memory info) public {
        _addresses[msg.sender].push(adrs);
        _aliases[msg.sender][adrs] = info;
        emit AddressAdded(msg.sender, adrs, info);

        
    }

    function removeAddress(address adrs) public {
        uint count = _addresses[msg.sender].length;

        for (uint i = 0; i < count; i++) {
            if (adrs == _addresses[msg.sender][i]) {
                if (1 < _addresses[msg.sender].length && i < count-1){
                    _addresses[msg.sender][i] = _addresses[msg.sender][count-1];
                }

                emit AddressRemoved(msg.sender, adrs);
                delete _addresses[msg.sender][count-1];
                _addresses[msg.sender].pop();
                delete _aliases[msg.sender][adrs];
                break;
            }
        }

    }

    function getAlias(address madrs1, address adrs2) public view returns (string memory) {
        return _aliases[madrs1][adrs2];
    }

}

