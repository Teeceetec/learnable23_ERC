// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

contract ERC {
   string private name;
   string private symbol;
   uint8 private decimals;
   uint private totalsupply;

   mapping( address => uint256) public balanceOf;
   mapping ( address => mapping( address => uint256)) public allowance;

   event Transfer(address indexed from, address indexed to, uint256 value);
   event Approval(address indexed owner, address indexed spender, uint256 value);

   constructor (string memory _name, string memory _symbol, uint8 _decimals, uint256 _initialSupply) {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalsupply = _initialSupply * 10 ** uint256(_decimals);
    balanceOf[msg.sender] = totalsupply;
   }

   function transfer(address _to, uint256 _value) public returns(bool success) {
     require(balanceOf[msg.sender] >= _value, "Insufficient balance");
     balanceOf[msg.sender] -= _value;
     balanceOf[_to] += _value;
     emit Transfer(msg.sender, _to, _value);
     return true;
   }

   function approve (address _spender, uint256 _value) public returns(bool success) {
    allowance[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
   }

   function transerFrom(address _from, address _to , uint256 _value) public returns (bool success) {
     require(_value <= balanceOf[_from], "INSUFFICIENT_BALANCE");
     require(_value <= balanceOf[_to], "INSUFFICIENT_BALANCE");
      balanceOf[_from] -= _value;
      balanceOf[_to] += _value;
      allowance[_from][msg.sender] -= _value;
      emit Transfer(_from, _to, _value);
      return true;

   }

   //Getters functions
    function getName() external view returns(string memory) {
        return name;
    }

    function getSymbol() external view returns (string memory) {
        return symbol;
    }

    function getDecimal() external view returns(uint8) {
        return decimals;
    }

    function getTotalsupply () external view returns (uint256) {
        return totalsupply;
    }
}
