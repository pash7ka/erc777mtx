pragma solidity ^0.5.12;

import "@openzeppelin/contracts/token/ERC777/ERC777.sol";
import "./gsn/GSNRecipientERC712Signature.sol";

contract SampleToken is GSNRecipientERC712Signature, ERC777 {
    string constant NAME    = 'SampleToken';
    string constant SYMBOL  = 'SMPL';
    uint8 constant  DECIMALS= 18;   //Required by ERC777
    uint256 constant TOTAL_SUPPLY = 100_000_000 * (uint256(10)**DECIMALS);

    constructor(address[] memory defaultOperators) ERC777(NAME, SYMBOL, defaultOperators) public {
        _mint(_msgSender(), _msgSender(), TOTAL_SUPPLY, '', '');
    }
}

