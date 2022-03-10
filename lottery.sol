// SPDX-License-Identifier: GPL--3.0
pragma solidity >= 0.8.0;
contract lottery
{
  address public manager;
  address payable[] public participants;
  constructor()
   {
     manager=msg.sender;//global variable

   }
  receive() external payable{
    require(msg.value==1 ether);
    participants.push(payable(msg.sender));
  
  }
function getB() public view returns(uint){
  require(msg.sender== manager);
  return address(this).balance;
}

function rend() public view returns(uint){
return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participants.length)));
}
function selectwin() public{
  require(msg.sender==manager);
  require(participants.length>=3);
  uint r=rend();
  address payable winer;
  uint index = r % participants.length;
 winer=participants[index];
 winer.transfer(getBalance());
}
}