pragma solidity >=0.6.7;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract is Ownable {

  //event SetPurpose(address sender, string purpose);

  string public purpose = "Building Unstoppable Appps!!x";

  constructor() {
   transferOwnership(0xfbC798F5eFB753f4fa81BE2e56cC68E23d6cD007);
  }

  function setPurpose(string memory newPurpose) public onlyOwner {
      purpose = newPurpose;
      console.log(msg.sender,"set purpose to",purpose);
      //emit SetPurpose(msg.sender, purpose);
  }
}
