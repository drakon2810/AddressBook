# AddressBook Smart Contract

This Solidity smart contract, named `AddressBook`, serves as a decentralized address book on the Ethereum blockchain. Users can add, remove, and retrieve addresses along with associated information.

## Features:

1. **Add Address:** Users can add addresses along with descriptive information to the address book.

2. **Remove Address:** Users can remove addresses from their address book.

3. **Retrieve Addresses:** Users can retrieve a list of addresses stored in their address book.

4. **Alias:** Users can assign aliases to addresses for easy identification.

## Usage:

1. **Adding Address:**
   - Function: `addAddress(address adrs, string memory info)`
   - Parameters:
     - `adrs`: The Ethereum address to be added.
     - `info`: Additional information associated with the address.
   - Event: `AddressAdded(address indexed owner, address addedAddress, string info)`
     - Triggered when an address is successfully added to the address book.

2. **Removing Address:**
   - Function: `removeAddress(address adrs)`
   - Parameters:
     - `adrs`: The Ethereum address to be removed.
   - Event: `AddressRemoved(address indexed owner, address removedAddress)`
     - Triggered when an address is successfully removed from the address book.

3. **Retrieving Addresses:**
   - Function: `getAddress(address adrs) public view returns (address[] memory)`
   - Parameters:
     - `adrs`: The owner's Ethereum address to retrieve the address book.
   - Returns:
     - An array of addresses associated with the owner.

4. **Alias Lookup:**
   - Function: `getAlias(address madrs1, address adrs2) public view returns (string memory)`
   - Parameters:
     - `madrs1`: The owner's Ethereum address.
     - `adrs2`: The address for which the alias is to be retrieved.
   - Returns:
     - The alias associated with the given address.

## License:
This project is licensed under the MIT License.

## Note:
Uncomment `import "hardhat/console.sol";` and `console.log()` if you want to use logging for debugging purposes.
