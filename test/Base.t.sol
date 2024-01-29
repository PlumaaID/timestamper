// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {console2} from "forge-std/console2.sol";
import {Upgrades} from "@openzeppelin/foundry-upgrades/Upgrades.sol";
import {Timestamper} from "~/Timestamper.sol";

contract BaseTest is Test {
    Timestamper internal timestamper;

    function setUp() public virtual {
        timestamper = Timestamper(
            Upgrades.deployTransparentProxy(
                "src/Timestamper.sol:Timestamper",
                address(this),
                abi.encode(Timestamper.setupTimestamper.selector)
            )
        );
    }
}
