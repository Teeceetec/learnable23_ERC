// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ERC} from "../../src/ERC.sol";
import {DeployERC} from "../../script/DeployERC.s.sol";
import {HelperConfig} from "../../script/HelperConfig.s.sol";
import {Test, console} from "forge-std/Test.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

contract ERCTest is StdCheats, Test {
  ERC public erc;
  HelperConfig public  helperconfig;
 
 uint256 public constant SEND_VALUE = 100e18;
 
 uint256 public constant STARTING_USER_BALANCE = 1000 ether;
 
  address public USER = address(1);
  address public USER1 = address(2);

  function setUp () external {
    DeployERC deployer = new DeployERC();
    (erc, helperconfig) = deployer.run();
    vm.deal(USER, STARTING_USER_BALANCE);
  }

  function testName() public {
    assertEq(erc.getName(), "TEGAS");
    console.log(erc.getName());
  }

  function testSymbol() public {
    assertEq(erc.getSymbol(), "TG");
    console.log(erc.getSymbol());
  }

  function testDecimals() public {
    assertEq(erc.getDecimal(), 18);
    console.log(erc.getDecimal());
  }

  function testTotalSupply() public {
     assertEq(erc.getTotalsupply(), 1000e18);
     console.log(erc.getTotalsupply());
  }

  function testTransfer() public {
     
      vm.startPrank(USER);
      erc.transfer(USER1, SEND_VALUE );
      vm.stopPrank();

     uint256 amountSent = erc.balanceOf(USER1);
     assertEq(amountSent, SEND_VALUE);
  }
}