// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "./testlibs/CheatCodes.sol";
import "./testlibs/Etcher.sol";
import "./console.sol";
import "../IUniswapV2Pair.sol";

contract ContractTest is DSTest {
    address beefa = 0xB2d834dd31816993EF53507Eb1325430e67beefa;
    address deployer = 0x5A16552f59ea34E44ec81E58b3817833E9fD5436;
    IUniswapV2Pair coreCbtcPair = IUniswapV2Pair(0x6fad7D44640c5cd0120DEeC0301e8cf850BecB68);
    Vm vm = Vm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);
    Etcher etcher = new Etcher(vm);
    function setUp() public {
        console.log("aaaaaaah i'm cleaning up");
    }

    function testBurnLP() public {
        uint256 startBal = coreCbtcPair.balanceOf(beefa);
        vm.startPrank(beefa);
        console.log("aaaaaah i'm transferring LP to the pair contract");
        coreCbtcPair.approve(deployer, startBal);

        console.log("transfering to deployer...");
        coreCbtcPair.transfer(deployer, startBal);

        vm.startPrank(deployer, deployer);

        require(coreCbtcPair.balanceOf(deployer) == startBal, "wrong amount");
        coreCbtcPair.transfer(address(coreCbtcPair), startBal);

        console.log("aaaaaah i'm burning my LP tokens");

        require(coreCbtcPair.balanceOf(address(coreCbtcPair)) == startBal, "wrong amount to burn");
        coreCbtcPair.burn(beefa);
        console.log("aaaaaah i burned my LP tokens");
        uint256 endBal = coreCbtcPair.balanceOf(beefa);
        assert(startBal > endBal);
        assertTrue(true);
    }
}
