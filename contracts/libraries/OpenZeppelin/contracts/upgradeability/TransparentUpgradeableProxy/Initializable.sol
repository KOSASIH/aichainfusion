pragma solidity ^0.8.0;

abstract contract Initializable {
    bool public initialized;

    modifier whenNotInitialized() {
        require(!initialized, "Contract is already initialized");
        _;
        initialized = true;
    }
}
