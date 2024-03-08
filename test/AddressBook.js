const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("AddressBook", function () {
  let AddressBook;
  let addressBook;
  let owner;
  let addr1;
  let addr2;
  let addr3;
  const info1 = 'Info1';
  const info2 = 'Info2';


  beforeEach(async function () {
    AddressBook = await ethers.getContractFactory("AddressBook");
    [owner, addr1, addr2, addr3] = await ethers.getSigners();
    addressBook = await AddressBook.deploy();
  });

  it("should return empty array and empty string for non-existent address", async function () {
    const addresses = await addressBook.getAddress(addr1.address);
    expect(addresses).to.have.lengthOf(42);
  
    const alias = await addressBook.getAlias(owner.address, addr1.address);
    expect(alias).to.equal("");
  });

  it("should add multiple addresses and aliases correctly", async function () {
    await addressBook.addAddress(addr1.address, info1);
    await addressBook.connect(addr3).addAddress(addr2.address, info2);
  
    const alias1 = await addressBook.getAlias(owner.address, addr1.address);
    expect(alias1).to.equal(info1);
  
    const alias2 = await addressBook.getAlias(addr3.address, addr2.address);
    expect(alias2).to.equal(info2);
  });

});