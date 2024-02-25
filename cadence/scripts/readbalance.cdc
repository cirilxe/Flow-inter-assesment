import FungibleToken from 0x05
import tok from 0x05

pub fun main(account: Address) {

    let publicVault: &tok.Vault{FungibleToken.Balance, FungibleToken.Receiver, tok.CollectionPublic}? =
        getAccount(account).getCapability(/public/Vault)
            .borrow<&tok.Vault{FungibleToken.Balance, FungibleToken.Receiver, tok.CollectionPublic}>()

    if (publicVault == nil) {

        let newVault <- tok.createEmptyVault()
        getAuthAccount(account).save(<-newVault, to: /storage/VaultStorage)
        getAuthAccount(account).link<&tok.Vault{FungibleToken.Balance, FungibleToken.Receiver, tok.CollectionPublic}>(
            /public/Vault,
            target: /storage/VaultStorage
        )
        log("Empty vault created")
        

        let retrievedVault: &tok.Vault{FungibleToken.Balance}? =
            getAccount(account).getCapability(/public/Vault)
                .borrow<&tok.Vault{FungibleToken.Balance}>()
        log(retrievedVault?.balance)
    } else {
        log("Vault already exists and is properly linked")
        
        let checkVault: &tok.Vault{FungibleToken.Balance, FungibleToken.Receiver, tok.CollectionPublic} =
            getAccount(account).getCapability(/public/Vault)
                .borrow<&tok.Vault{FungibleToken.Balance, FungibleToken.Receiver, tok.CollectionPublic}>()
                ?? panic("Vault capability not found")
        

        if tok.vaults.contains(checkVault.uuid) {
            log(publicVault?.balance)
            log("This is a AlpToken vault")
        } else {
            log("This is not a AlpToken vault")
        }
    }
}