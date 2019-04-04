pragma solidity ^0.5.0;

contract CoinFlipGame {
    constructor() public payable {
    }
    
    function bet() public payable {
        require(msg.value <= maxBet(), "bet size too big");
        
        if (generateRandomBit()) {
            msg.sender.transfer(msg.value * 2);
        }
    }
    
    function maxBet() public view returns(uint256) {
        return address(this).balance / 10;
    }
    
    function generateRandomBit() private view returns(bool) {
        if(random() % 2 == 0){
            return false;
        }else{
            return true;
        }
    }
    
    function random() private view returns (uint8) {
          return uint8(uint256(keccak256(abi.encodePacked(block.timestamp)))%251);
   }
}

