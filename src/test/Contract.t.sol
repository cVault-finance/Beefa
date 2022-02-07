// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "./Vm/CheatCodes.sol";
import "./console.sol";

contract ContractTest is DSTest {
    Vm vm = Vm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);
    function setUp() public {
        console.log("aaaaaaah i'm setting up");
    }

    function testExample() public {
        assertTrue(true);
    }
}
