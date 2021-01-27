// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "./lib/BEP20Capped.sol";
import "./lib/BEP20Mintable.sol";

import "../../service/ServicePayer.sol";

/**
 * @title MintableBEP20
 * @dev Implementation of the MintableBEP20
 */
contract MintableBEP20 is BEP20Capped, BEP20Mintable, ServicePayer {

    constructor (
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 cap,
        uint256 initialBalance,
        address payable feeReceiver
    )
        BEP20(name, symbol)
        BEP20Capped(cap)
        ServicePayer(feeReceiver, "MintableBEP20")
        payable
    {
        _setupDecimals(decimals);
        _mint(_msgSender(), initialBalance);
    }

    /**
     * @dev Function to mint tokens.
     *
     * NOTE: restricting access to owner only. See {BEP20Mintable-mint}.
     *
     * @param account The address that will receive the minted tokens
     * @param amount The amount of tokens to mint
     */
    function _mint(address account, uint256 amount) internal override onlyOwner {
        super._mint(account, amount);
    }

    /**
     * @dev Function to stop minting new tokens.
     *
     * NOTE: restricting access to owner only. See {BEP20Mintable-finishMinting}.
     */
    function _finishMinting() internal override onlyOwner {
        super._finishMinting();
    }

    /**
     * @dev See {BEP20-_beforeTokenTransfer}. See {BEP20Capped-_beforeTokenTransfer}.
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal override(BEP20, BEP20Capped) {
        super._beforeTokenTransfer(from, to, amount);
    }
}
