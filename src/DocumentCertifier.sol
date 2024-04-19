// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DocumentCertifier {
    mapping(bytes32 => bool) private documentHashes;

    event DocumentCertified(bytes32 hash, address certifier);

    function certifyDocument(bytes32 _hash) public {
        require(!documentHashes[_hash], "Document already certified.");
        documentHashes[_hash] = true;
        emit DocumentCertified(_hash, msg.sender);
    }

    function isDocumentCertified(bytes32 _hash) public view returns (bool) {
        return documentHashes[_hash];
    }
}
