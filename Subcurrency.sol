pragma solidity >0.4.0 <= 0.8.0;

contract Subcurrency {
    
     address public owner;
     mapping(address => uint) amounts;
     uint totalCoins;
     
     constructor() public {
         owner = msg.sender;
     }
     
     function mint (uint amount) public returns (bool) {
         amounts[owner] = amount;
         totalCoins = totalCoins + amount;
     }
     
     function balanceOf(address adr) public view returns (uint) {
         uint balance = amounts[adr];
         return balance;
     }
     
     
     function send(address to, uint amount) public returns (bool) {
         require(amounts[owner] >= amount);
         amounts[owner] = amounts[owner] - amount;
         amounts[to] = amounts[to] + amount;
         return true;
     }
     
     
     function supplyTotal() public view returns (uint) {
         return totalCoins;
     }
    
}