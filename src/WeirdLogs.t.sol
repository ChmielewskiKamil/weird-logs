// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./WeirdLogs.sol";

contract WeirdLogsTest is DSTest {
    // This is the default Echidna contractAddr
    // see: https://github.com/crytic/echidna/wiki/Config
    address weirdLogs = address(0x00a329c0648769A73afAc7F9381E08FB43dBEA72);

    bytes32 originalHash = keccak256(abi.encodePacked(weirdLogs));

    event OriginalHash(bytes32 originalHash);
    event HashCastedToBytes16(bytes16 originalHash);
    event HashCastedToBytes8(bytes8 originalHash);
    event HashCastedToBytes4(bytes4 originalHash);
    event HashCastedToBytes3(bytes3 originalHash);
    event HashCastedToBytes2(bytes2 originalHash);
    event HashCastedToBytes1(bytes1 orignalHash);

    function test_always_false() public {
        emit OriginalHash(originalHash);
        emit HashCastedToBytes16(bytes16(originalHash));
        emit HashCastedToBytes8(bytes8(originalHash));
        emit HashCastedToBytes4(bytes4(originalHash));
        emit HashCastedToBytes3(bytes3(originalHash));
        emit HashCastedToBytes2(bytes2(originalHash));
        emit HashCastedToBytes1(bytes1(originalHash));
        assert(false);
    }
}
