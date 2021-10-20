pragma solidity >=0.6.7;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract is Ownable {

  //event SetPurpose(address sender, string purpose);

  mapping(address => uint256) public balance;
  address public myOwner = 0x0c9A1E4a543618706D31F33b643aba10E0D9048e;

  string public purpose = "Building Unstoppable Appps!!x";

  constructor() {
    //set the owner to a different address than the deploy wallet
   transferOwnership(0x0c9A1E4a543618706D31F33b643aba10E0D9048e);

   balance[myOwner] = 1000;
  }


  function transfer(address to, uint256 amount) public {
    require( balance[msg.sender] >= amount, "NOT ENOUGH");
    balance[msg.sender] -= amount;
    balance[to] += amount;
  }
  function setPurpose(string memory newPurpose) public payable {
    //make sure user pays 0.001 ether in order to change purpose
    require(msg.value == 0.001 ether, "NOT ENOUGH");
      purpose = newPurpose;
      console.log(msg.sender,"set purpose to",purpose);
      //emit SetPurpose(msg.sender, purpose);
  }

  function withdraw() public onlyOwner {
      (bool success, ) = msg.sender.call{value: address(this).balance}("");
      require( success, "FAILED");
    
  }
}
