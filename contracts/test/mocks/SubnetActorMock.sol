// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.23;

import {SubnetActorManagerFacet} from "../../contracts/subnet/SubnetActorManagerFacet.sol";
import {LibStaking} from "../../contracts/lib/LibStaking.sol";
import {SubnetActorRewardFacet} from "../../contracts/subnet/SubnetActorRewardFacet.sol";

contract SubnetActorMock is SubnetActorManagerFacet, SubnetActorRewardFacet {
    function confirmChange(uint64 _configurationNumber) external {
        LibStaking.confirmChange(_configurationNumber);
    }

    function confirmNextChange() external {
        (uint64 nextConfigNum, ) = LibStaking.getConfigurationNumbers();
        LibStaking.confirmChange(nextConfigNum - 1);
    }
}
