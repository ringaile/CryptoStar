pragma solidity ^0.5.0;

import "./StarNotary.sol";

/**
 * @title StarNotaryProxy
 * @notice This contract performs an StarNotary token transfer and stores a reference
  */

contract StarNotaryProxy {
    // Event to declare a transfer with a reference
    event TransferWithReference(
      address tokenAddress,
      address to,
      uint256 _tokenId,
      bytes indexed paymentReference
    );

    // Fallback function returns funds to the sender
    function()
      external
      payable
    {
      revert("not payable fallback");
    }

    /**
    * @notice Performs a StarNotary token transfer with a reference
    * @param _tokenAddress Address of the StarNotary token smart contract
    * @param _to Transfer recipient
    * @param _tokenId Id of the star
    * @param _paymentReference Reference of the payment related
    */
    function transferFromWithReference(
      address _tokenAddress,
      address _to,
      uint256 _tokenId,
      bytes calldata _paymentReference
    )
      external 
    {
      StarNotary starNotary = StarNotary(_tokenAddress);
      require(starNotary.transferStar(_to, _tokenId), "transferFrom() failed");
      emit TransferWithReference(
        _tokenAddress,
        _to,
        _tokenId,
        _paymentReference
      );
    }
}