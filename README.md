# Flow Fungible Token Project Repository

Welcome to the Flow Fungible Token Project's official repository. This initiative is dedicated to the creation and implementation of a comprehensive Fungible Token smart contract on the Flow blockchain. Within this repository, you'll find a suite of transactions and scripts designed to facilitate a broad spectrum of token management and operational processes.

## Core Contract Implementation

- **Contract Name:** FlowToken
- **Key Features:**
  - Implements an owner-centric approach to token minting.
  - Utilizes a Vault resource for the secure handling of token balances.
  - Provides a wide array of transactions and scripts for streamlined token management.

### Code Highlights:

- Demonstrates the use of the Vault resource's deposit function to ensure secure token transactions and mitigate the risk of double-spending.

### Fundamental Transactions and Scripts

#### Transactions:
- **MINT:** Enables the issuance of tokens to specific recipients.
- **SETUP:** Facilitates the initial configuration of a user's vault within their account storage.
- **TRANSFER:** Allows for the secure transfer of tokens across different accounts.

#### Scripts:
- **READ BALANCE:** Retrieves the balance of tokens within a user's vault.
- **SETUP VALIDATION:** Verifies that a vault has been correctly established.
- **TOTAL SUPPLY CHECK:** Reports the total circulating supply of tokens.

### Enhancements to Transactions and Scripts

- Refinement of the **SETUP** transaction to correct improperly configured vaults.
- Enhancement of the **READ BALANCE** script to accommodate vaults with unconventional configurations.

### Key Features

- Employs resource identifiers to confirm the type of tokens.
- Uses resource capabilities to authenticate the integrity of vaults.

## Contract and Transaction Enhancements

### Admin Capabilities

- Provides Administrators with the authority to withdraw tokens from user vaults and deposit a corresponding amount of $FLOW tokens.

### New Transaction

- **Admin Withdraw and Deposit:** An exclusive transaction for Administrators to oversee token management.

### Advanced Scripting

#### Scripts
- **BALANCE SUMMARY:** Presents a consolidated view of a user's balances for $FLOW and custom tokens.
- **VAULT OVERVIEW:** Delivers a detailed examination of all recognized Fungible Token vaults in a user's account.

## Swap Contract Integration

### Swap Contract

- Facilitates the exchange of $FLOW tokens for custom tokens, with the exchange rate varying based on the time elapsed since the last swap.

### Swap Mechanics

- Utilizes a distinctive identity resource alongside the user's $FLOW vault reference to authenticate user identity and guarantee secure exchanges.

## Project Conclusion

This repository delineates a meticulous deployment of a Fungible Token contract on the Flow blockchain, offering clear and straightforward navigation through its extensive functionalities, including token minting, vault setup, token transferring, and swapping.
