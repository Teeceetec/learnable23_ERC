// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {ERC} from "../src/ERC.sol";


contract DeployERC is Script {
    string public constant name = "TEGAS";
   string public constant symbol = "TG";
   uint8 public constant decimals = 18;
   uint  public constant totalsupply = 1000;

    function run() external returns(ERC, HelperConfig) {
      HelperConfig helperconfig = new HelperConfig();
    
        vm.startBroadcast();
         ERC erc = new ERC(name,symbol,decimals,totalsupply);
         vm.stopBroadcast();
         return (erc, helperconfig);
    }
}
