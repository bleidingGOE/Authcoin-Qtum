pragma solidity ^0.4.17;


/**
* @dev Entity Identity Record (EIR) contains information that links an entity to a certain
* identity and the corresponding public key or certificate. EIR is created during the key
* generation process and posted to the blockchain. 'content' field is used to store public
* key or certificate and it must be unique.
*/
contract EntityIdentityRecord {

    bytes32 private id;

    uint private blockNumber;

    bytes private content;

    bytes32 private contentType;

    bool private revoked;

    bytes32[] private identifiers;

    bytes32 private hash;

    bytes private signature;

    // creator of the contract.
    address private creator;

    function EntityIdentityRecord(
        bytes32[] _identifiers,
        bytes _content,
        bytes32 _contentType,
        bytes32 _hash,
        bytes _signature,
        address _creator) {
        id = keccak256(_content);
        blockNumber = block.number;
        content = _content;
        contentType = _contentType;
        revoked = false;
        identifiers = _identifiers;
        hash = _hash;
        signature = _signature;
        creator = _creator;
    }

    function getId() public view returns (bytes32) {
        return id;
    }

    function getBlockNumber() public view returns (uint) {
        return blockNumber;
    }

    function getContent() public view returns (bytes) {
        return content;
    }

    function getContentType() public view returns (bytes32) {
        return contentType;
    }

    function isRevoked() public view returns (bool) {
        return revoked;
    }

    function getIdentifiersCount() public view returns (uint) {
        return identifiers.length;
    }

    function getIdentifier(uint index) public view returns (bytes32) {
        return identifiers[index];
    }

    function getIdentifiers() public view returns (bytes32[]) {
        return identifiers;
    }

    function getCreator() public view returns (address) {
        return creator;
    }

    function getData() public view returns(
        bytes32,
        uint,
        bytes,
        bytes32,
        bool,
        bytes32[],
        bytes32,
        bytes) {
        return (
            id,
            blockNumber,
            content,
            contentType,
            revoked,
            identifiers,
            hash,
            signature
        );
    }

    // TODO getHash
    // TODO getSignature

    function revoke() public {// TODO unsafe operation
        revoked = true;
    }

}
