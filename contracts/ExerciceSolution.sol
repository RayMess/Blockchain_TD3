pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ExerciceSolution is ERC20
{

mapping(address => uint8) public allowListed;

constructor(string memory name, string memory symbol,uint256 initialSupply) public ERC20(name, symbol) 
{ _mint(msg.sender, initialSupply);}

    
  function getToken() external returns (bool)
{
  require(allowListed[msg.sender]!=0);
  uint256 balanceprof=balanceOf(msg.sender);
  _mint(msg.sender,3 ether);
  uint256 balanceapres=balanceOf(msg.sender);
  return (balanceprof<balanceapres);
}


  function buyToken() external payable returns (bool)
{
  require(allowListed[msg.sender]!=0);
  uint256 soldeprof=balanceOf(msg.sender);
  uint256 amount=msg.value+1 ether;
  _mint(msg.sender,amount*allowListed[msg.sender]);
  uint256 soldeapres=balanceOf(msg.sender);
  return (soldeprof<soldeapres);
}


  function isCustomerWhiteListed(address personne) external returns (bool)
{
  return allowListed[personne]!=0;
}

function ajoutWhiteList(address customerAddress,uint8 white) external 
{
  allowListed[customerAddress]=white;
}

  function customerTierLevel(address customerAddress) external returns (uint256)
{
  return allowListed[customerAddress];}

}