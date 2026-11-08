// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Student Message Board
/// @notice A simple contract to post and read messages publicly
contract MessageBoard {
    
    // Struct to hold the message text and the time it was posted
    struct Message {
        string text;
        uint timestamp;
    }

    address public owner;

    // Mapping to store messages by user address
    mapping(address => Message) public userMessages;
    
    // Mapping to track if a user has already posted
    mapping(address => bool) public hasPosted;

    // Event emitted when a message is added
    event MessagePosted(address indexed user, string message, uint time);

    constructor() {
        owner = msg.sender; // Deployer becomes the owner
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can do this");
        _;
    }

    /// @notice Store a message (Write Function)
    function postMessage(string calldata _msg) public {
        require(!hasPosted[msg.sender], "You have already posted a message!");
        
        userMessages[msg.sender] = Message(_msg, block.timestamp);
        hasPosted[msg.sender] = true;

        emit MessagePosted(msg.sender, _msg, block.timestamp);
    }

    /// @notice Read a message from a specific user (Read Function)
    function readMessage(address _user) public view returns (string memory, uint) {
        Message memory msgData = userMessages[_user];
        return (msgData.text, msgData.timestamp);
    }

    /// @notice Owner can delete inappropriate messages (Write Function)
    function deleteMessage(address _user) public onlyOwner {
        delete userMessages[_user];
        hasPosted[_user] = false; // Allow them to post again
    }
}
