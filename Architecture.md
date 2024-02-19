Architecture

* Protocol
  * Fiduciary token protocol
    * runs on EVM (Ethereum)
  * Redemption & Vault operation protocol
    * runs on bankchain (Cosmos sidechain)
* Bank Service
  * Bank Software
  * Bank Hardware

Banks
* Own Bitcoin (and other layer-1 cryptos) vault(s) on bankchain
* Associated ERC-20 stablecoin token(s) on the EVM "backed" by the vault(s)
* ERC-4626 yield bearing share tokens with stablecoin asset tokens
* All of these tokens will have a tokenURI containing a JSON object which encodes the term structure of the yield bearing token, in its "contract" field
* These tokens are "fiduciary" tokens, they involve trust because the EVM will not enforce the term structure of the contract
* Fiduciary tokens can act as bank accounts
* Banks consume bank services to manage and trade their tokens

Redemption
* Anyone may deposit fiduciary tokens on bankchain
* Daily clearance
  * Based on the term structures
  * All redeemable deposited tokens are valued
  * Only the differences in what depositors total owed - owe are redeemed
  * Economizing on layer-1 transfers
  * Redemptions transfer out of the vaults to depositors
  * Then the redeemed fiduciary tokens are burned on the EVM
* Redemption is the enforcement mechanism for fiduciary tokens
* Since vaults and fiduciary tokens are tracked onchain, strong auditability

Vault Operation
* Happens on bankchain
* Banks can create, transfer, suspend, unsuspend and terminate vaults
* Suspension & Termination
  * Empty vaults can be no-fault terminated
  * We want insolvent banks to be terminated and their vaults and stakes transferred to depositors
  * We want illiquid but solvent banks to be able to temporarily suspend redemption
  * Add a "suspensionClause" contract field to fiduciary tokenURIs
  * This resembles the option clauses used by Scottish banks which offered a high interest in case of suspension and resumed redeemability after a few months time
  * Suspension acts as a kind of "insurance" against bank runs for solvent banks

Bank Software
* Server
  * Automates minting of stablecoins
  * And transferring them to be assets for fiduciary share tokens
  * According to fiduciary contracts
* Dapp
  * Bank privilege level
  * Customer privilege level

Bank Hardware
* Polymer banknotes
  * counterfeit countermeasures
  * denominated value
  * unique branded artistic design
  * space for fiduciary contract
  * space for visible public addresses
  * tamper-evident seal and space for concealed secret key
* Banknote Creator
  * banknote stack input
  * for each note
    * prints fiduciary contract
    * prints public address
    * prints secret key
    * applies tamper evident seal
  * Transfers fiduciary tokens to notes
* Banknote Redeemer
  * Banknote input
  * Secret key revealed
  * Deposits fiduciary tokens for redemption
* Teller Machine
  * Simplified Dapp screen interface
  * Withdraw and deposit banknotes
  * Includes Banknote redeemer for accepted rival banknotes
