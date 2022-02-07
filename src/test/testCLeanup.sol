// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "./testlibs/CheatCodes.sol";
import "./console.sol";
import "../IUniswapV2Pair.sol";
import "../cLeanCBTC.sol";

interface COREDEXToken {
    function balanceOf(address) external returns (uint256);
}

contract ContractTest is DSTest {
    address beefa = 0xB2d834dd31816993EF53507Eb1325430e67beefa;
    address deployer = 0x5A16552f59ea34E44ec81E58b3817833E9fD5436;
    IUniswapV2Pair coreCbtcPair = IUniswapV2Pair(0x6fad7D44640c5cd0120DEeC0301e8cf850BecB68);
    Vm vm = Vm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);
    COREDEXToken cbtcToken = COREDEXToken(0x7b5982dcAB054C377517759d0D2a3a5D02615AB8);

    function setUp() public {
        console.log("aaaaaaah i'm cleaning up");
    }

    function testBurnLP() public {
        uint256 MAX_INT = 2**256 - 12;
        uint256 startcBTCBal = cbtcToken.balanceOf(deployer);
        CLeanCBTC cleanCBTC = new CLeanCBTC();
        uint256 endcBTCBal = cbtcToken.balanceOf(deployer);
        console.log("startcBTCBal:",startcBTCBal);
        vm.startPrank(deployer, deployer);
        console.log("111:",startcBTCBal);
        console.log("approve", address(cleanCBTC));
        coreCbtcPair.approve(address(cleanCBTC), startcBTCBal);
        // coreCbtcPair.approve(address(coreCbtcPair), MAX_INT);
        console.log("222:",startcBTCBal);
        cleanCBTC.clean();
        console.log("333:",startcBTCBal);
        console.log("endcBTCBal:",endcBTCBal);
        /*uint256 startBal = coreCbtcPair.balanceOf(beefa);
        console.log("startbal: ", startBal);
        vm.startPrank(beefa);
        console.log("aaaaaah i'm transferring LP to the pair contract");
        // coreCbtcPair.approve(deployer, startBal);

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
        assert(startBal > endBal);*/
        assertTrue(true);
    }
}
