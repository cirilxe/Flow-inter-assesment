import FungibleToken from 0x05
import FlowToken from 0x05
import tok from 0x05

pub contract SwapToken {

    pub var lastSwapTimestamp: UFix64

    pub var userLastSwapTimestamps: {Address: UFix64}


    pub fun swapTokens(signer: AuthAccount, swapAmount: UFix64) {


        let tokVault = signer.borrow<&tok.Vault>(from: /storage/VaultStorage)
            ?? panic("Could not borrow tok Token Vault from signer")

        let flowVault = signer.borrow<&FlowToken.Vault>(from: /storage/FlowVault)
            ?? panic("Could not borrow FlowToken Vault from signer")  


        let minterRef = signer.getCapability<&tok.Minter>(/public/Minter).borrow()
            ?? panic("Could not borrow reference to UhanmiToken Minter")


        let autherVault = signer.getCapability<&FlowToken.Vault{FungibleToken.Balance, FungibleToken.Receiver, FungibleToken.Provider}>(/public/FlowVault).borrow()
            ?? panic("Could not borrow reference to FlowToken Vault")  


        let withdrawnAmount <- flowVault.withdraw(amount: swapAmount)
        autherVault.deposit(from: <-withdrawnAmount)
        

        let userAddress = signer.address
        self.lastSwapTimestamp = self.userLastSwapTimestamps[userAddress] ?? 1.0
        let currentTime = getCurrentBlock().timestamp


        let timeSinceLastSwap = currentTime - self.lastSwapTimestamp
        let mintedAmount = 2.0 * UFix64(timeSinceLastSwap)


        let newtokVault <- minterRef.mintToken(amount: mintedAmount)
        tokVault.deposit(from: <-newtokVault)

        self.userLastSwapTimestamps[userAddress] = timeSinceLastSwap
    }


    init() {

        self.lastSwapTimestamp = 1.0
        self.userLastSwapTimestamps = {0x05: 1.0}
    }
}