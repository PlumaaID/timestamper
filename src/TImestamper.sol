// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

/// @title Timestamper - A contract to timestamp data. Used to replace a NOM-151 timestamping service.
contract Timestamper is Initializable {
    using EnumerableSet for EnumerableSet.Bytes32Set;

    // keccak256(abi.encode(uint256(keccak256("plumaa.storage.Timestamper")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 constant TIMESTAMPER_STORAGE =
        0x391c9d9ce53acc5654eaa0597db7992d95154cb300ed1a83c2c94608cc029600;

    struct TimestamperStorage {
        EnumerableSet.Bytes32Set mySet;
    }

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    /// @notice Initializes the contract.
    function setupTimestamper() public initializer {}

    /// @notice Timestamps a value.
    function add(bytes32 newValue) external returns (bool) {
        return _getTimestamperStorage().mySet.add(newValue);
    }

    /// @notice Returns true if the value is timestamped.
    function contains(bytes32 value) external view returns (bool) {
        return _getTimestamperStorage().mySet.contains(value);
    }

    /// @notice Get EIP-7201 storage
    function _getTimestamperStorage()
        private
        pure
        returns (TimestamperStorage storage $)
    {
        assembly {
            $.slot := TIMESTAMPER_STORAGE
        }
    }
}
