pragma solidity >=0.6.7;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract is Ownable {

  //event SetPurpose(address sender, string purpose);

  string public purpose = "Building Unstoppable Appps!!x";

  constructor() {
    //set the owner to a different address than the deploy wallet
   transferOwnership(0xfbC798F5eFB753f4fa81BE2e56cC68E23d6cD007);
  }

  function setPurpose(string memory newPurpose) public payable {
    //make sure user pays 0.001 ether in order to change purpose
    require(msg.value == 0.001 ether, "NOT ENOUGH");
      purpose = newPurpose;
      console.log(msg.sender,"set purpose to",purpose);
      //emit SetPurpose(msg.sender, purpose);
  }

  function withdraw() public onlyOwner {
      (bool success, bytes memory data) = msg.sender.call{value: address(this).balance}("");
      require( success, "FAILED");
    
  }
}
