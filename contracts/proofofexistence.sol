pragma solidity ^0.5.0;
// Proof of Existence contract, 
// IE law school - Blockchain & Smart Contracts course
// Sergio Velasco
contract ProofOfExistence {
  mapping (bytes32 => bool) private proofs;
  
  // store a proof of existence in the contract state
  function storeProof(bytes32 proof) private {
    proofs[proof] = true;
  }
  
  // calculate and store the proof(hash) for a document
   function notarize(string memory document) public {
    bytes32 proof = proofFor(document);
    storeProof(proof);
  }
  
  // helper function to get a document's sha256 (hash type)
  function proofFor(string memory document) internal pure returns (bytes32) {
    return sha256(bytes(document));
  }
  
  // check if a document has been notarized
  function checkDocument(string memory document) public view returns (bool) {
    bytes32 proof = proofFor(document);
    return hasProof(proof);
  }
  
  // returns true if proof is stored
  function hasProof(bytes32 proof) internal view returns(bool) {
    return proofs[proof];
  }
  
  function stringToBytes32(string memory source) internal pure returns (bytes32 result) {
    bytes memory tempEmptyStringTest = bytes(source);
    if (tempEmptyStringTest.length == 0) {
        return 0x0;
    }

    assembly {
        result := mload(add(source, 32))
    }
  }
}
