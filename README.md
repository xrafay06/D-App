# Student Message Board dApp

## Project Overview
This project is a decentralized application (dApp) built for the MG3012 Blockchain Technology for Business assignment. It allows users to connect their MetaMask wallet and post a permanent, tamper-proof study note or message to the Ethereum blockchain. 

## Problem Statement
Students need a decentralized way to share public notices without a central administrator having the ability to alter their text. 

## Proposed Solution
A Solidity smart contract on the Sepolia Testnet that maps user wallet addresses to a message string and a timestamp. The frontend interacts directly with this contract, bypassing traditional centralized databases.

## Main Features
- Connect MetaMask wallet safely.
- Verify the user is connected to the Sepolia Testnet.
- **Write:** Post exactly one message to the blockchain.
- **Read:** Fetch and display any user's message using their wallet address.

## Technologies Used
- **Smart Contract:** Solidity (v0.8.20)
- **Frontend:** HTML, CSS, JavaScript
- **Blockchain Integration:** Ethers.js
- **Wallet/Network:** MetaMask, Ethereum Sepolia Testnet
- **Deployment:** Remix IDE

## Smart Contract Details
**Contract Address:** `0xC639e2dE5d9812Ba49196745C4BE1a0EC8d11425`

### Functions:
1. `postMessage(string _msg)`: (Write) Stores the user's message and timestamp. Uses `require` to prevent double-posting. Emits a `MessagePosted` event.
2. `readMessage(address _user)`: (Read) Returns the message text and timestamp for the given wallet address.
3. `deleteMessage(address _user)`: (Write) Uses an `onlyOwner` modifier to allow the admin to delete inappropriate messages.

## HTML Frontend Explanation
The frontend is a single `index.html` file styled by `style.css`. It uses `ethers.js` to create a Web3 provider. 
- **Provider:** Connects Ethers.js to MetaMask (`new ethers.providers.Web3Provider(window.ethereum)`).
- **Signer:** Represents the user's wallet to authorize write transactions (`provider.getSigner()`).
- **Contract Instance:** Combines the address, ABI, and signer to interact with the blockchain.

## Setup and Testing Instructions
1. Install the MetaMask extension and switch to the **Sepolia Testnet**.
2. Ensure you have Sepolia ETH (from a faucet).
3. Open `index.html` using a local web server (e.g., Live Server in VS Code, or Python's `python -m http.server`).
4. Click **Connect MetaMask** and approve the connection.
5. Type a message in the Write section and click Submit. Approve the transaction in MetaMask.
6. Copy your wallet address, paste it into the Read section, and click Read Message to verify.

## Limitations
- A user can only post one message. If they wish to post again, the contract owner must delete their existing message first.
- Requires testnet ETH to cover gas fees for posting.

## Conclusion
This mini dApp successfully demonstrates the core mechanics of Web3 development taught in Weeks 7 and 8, proving that smart contracts can be seamlessly connected to traditional web interfaces.
