// contracts/Asset.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Asset is IERC20, ERC20Burnable {

    // Define the supply of Asset: 1,000,000 
    uint256 constant initialSupply = 1000000 * (10**18);

    // Constructor will be called on contract creation
    constructor() ERC20("Asset", "ASS") {
        _mint(msg.sender, initialSupply);
    }
}
