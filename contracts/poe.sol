pragma solidity ^0.5.0;
// Proof of Existence contract, 
// IE law school - Blockchain & Smart Contracts course
// Sergio Velasco
contract PoE {
  mapping (bytes32 => bool) private proofs;
    
  // calculate and store the proof(hash) for a document
   function notarizeDocumentHash(bytes32 hash) public {
    proofs[hash] = true;
  }
  
  
  // check if a document has been notarized
  function checkDocumentHash(bytes32 hash) public view returns (bool) {
    return proofs[hash];
  }

}
