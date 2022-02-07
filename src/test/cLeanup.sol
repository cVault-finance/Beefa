// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "./Vm/CheatCodes.sol";
import "./console.sol";
import "../IUniswapV2Pair.sol";

contract ContractTest is DSTest {
    address beefa = 0xB2d834dd31816993EF53507Eb1325430e67beefa;
    IUniswapV2Pair coreCbtcPair = IUniswapV2Pair(0x6fad7D44640c5cd0120DEeC0301e8cf850BecB68);
    Vm vm = Vm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);
    function setUp() public {
        console.log("aaaaaaah i'm cleaning up");
    }

    function testBurnLP() public {
        uint256 startBal = coreCbtcPair.balanceOf(beefa);
        vm.startPrank(beefa);
        coreCbtcPair.burn(beefa);
        uint256 endBal = coreCbtcPair.balanceOf(beefa);
        assert(startBal > endBal);
        assertTrue(true);
    }
}
