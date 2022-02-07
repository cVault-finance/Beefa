// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

interface COREDEXPair {
    function burn(address) external;
    function transfer(address, uint256) external;
    function balanceOf(address) external returns (uint256);
}

contract CLeanCBTC {
    address deployer = 0x5A16552f59ea34E44ec81E58b3817833E9fD5436;
    COREDEXPair coreCbtcPair = COREDEXPair(0x6fad7D44640c5cd0120DEeC0301e8cf850BecB68);

    function clean() external {
        require(msg.sender == deployer);
        uint256 startBal = coreCbtcPair.balanceOf(deployer);
        coreCbtcPair.transfer(address(coreCbtcPair), startBal);
        coreCbtcPair.burn(deployer);
    }
}
