
// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <=0.9.0;

contract Lottery{
    address public manager;
    address payable[] public participants;
    uint randNonce=100000000;
    constructor(){
        manager=msg.sender;
    }

    receive() external payable{
        require(msg.value>=2 ether);
        participants.push(payable(msg.sender));
    }

    function GetBalance() public view returns(uint){
        require(msg.sender==manager);
        return address(this).balance;
    }

    function generate() public view returns(uint){
        // randNonce++;
        return uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,randNonce)));
    }

    function winnerSelect() public returns(address){
        require(msg.sender==manager);
        require(participants.length>=3);
        uint random=generate();
        uint index=random%(participants.length);
        address payable win;
        win=participants[index];
        win.transfer(address(this).balance);
        participants= new address payable[](0);
        return win;
    }
}