// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {IGmpReceiver} from "contracts/IGmpReceiver.sol";
//gateway implement address 0x000000007f56768dE3133034FA730a909003a165
//counter gateway address 0xB5D83c2436Ad54046d57Cd48c00D619D702F3814
contract Counter is IGmpReceiver {
    address private immutable _gateway;
    uint256 public number;

    constructor(address gateway) {
        _gateway = gateway;
    }

    function onGmpReceived(bytes32, uint128, bytes32, bytes calldata) external payable returns (bytes32) {
        require(msg.sender == _gateway, "unauthorized");
        number++;
        return bytes32(number);
    }
}
