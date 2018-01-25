pragma solidity ^0.4.18;

import "./BaseCrowdsale.sol";
import "../zeppelin/token/MintableToken.sol";

contract BaseCrowdsaleForZeppelin is BaseCrowdsale {

  MintableToken token;

  function BaseCrowdsaleForZeppelin (
    uint256 _startTime,
    uint256 _endTime,
    uint256 _rate,
    uint256 _cap,
    uint256 _goal,
    address _vault,
    address _nextTokenOwner,
    address _token
    ) BaseCrowdsale (
      _startTime,
      _endTime,
      _rate,
      _cap,
      _goal,
      _vault,
      _nextTokenOwner
      ) {
        require(_token != address(0));
        token = MintableToken(_token);
      }


  function generateToken(address _beneficiary, uint256 _tokens) internal {
    token.mint(_beneficiary, _tokens);
  }

  function transferTokenOwnership(address _to) internal {
    token.transferOwnership(_to);
  }

}
