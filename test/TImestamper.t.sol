// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {BaseTest, Timestamper} from "./Base.t.sol";

contract TimestamperTest is BaseTest {
    function testAdd(bytes32 value) public {
        vm.expectEmit(true, false, false, false);
        emit Timestamper.Timestamped(value);
        timestamper.add(value);
        assertTrue(timestamper.contains(value));
    }
}
