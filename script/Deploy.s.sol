// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {AccessManager} from "@openzeppelin/contracts/access/manager/AccessManager.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {Upgrades} from "@openzeppelin/foundry-upgrades/Upgrades.sol";
import {BaseScript} from "./utils/Base.s.sol";
import {Timestamper} from "~/Timestamper.sol";

/// @dev See the Solidity Scripting tutorial: https://book.getfoundry.sh/tutorials/solidity-scripting
contract Deploy is BaseScript {
    function run() public broadcast {
        Upgrades.deployTransparentProxy(
            "Timestamper.sol:Timestamper",
            address(broadcaster),
            abi.encode(Timestamper.setupTimestamper.selector)
        );
    }
}
