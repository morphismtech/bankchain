Architecture

Protocol will consists of two parts
* Fiduciary token protocol runs on EVM (Ethereum)
* Redemption & Bank operation protocol runs on a Cosmos sidechain

Banks
* Own Bitcoin (and other layer-1 cryptos) vault(s) on sidechain
* Associated ERC-20 stablecoin(s) on the EVM "backed" by the vault(s)
* For each stablecoin, ERC-4626 yield bearing tokens
* Each of these tokens will have a tokenURI containing a JSON object which encodes the term structure of the yield bearing token, as a "contract"
* These tokens are "fiduciary" tokens, they involve trust because the EVM will not enforce the term structure of the contract
* Fiduciary tokens can act as bank accounts
* Polymer banknotes
  * counterfeit countermeasures
  * visible public addresses
  * tamper-evident secret key
  * 0 yield fiduciary token

Redemption
* Anyone may deposit fiduciary tokens on sidechain
* Daily clearance
  * Based on the term structures
  * All redeemable deposited tokens are valued
  * Only the differences in what depositors owe/own are redeemed out of the vaults
  * Then the redeemed fiduciary tokens are burned on the EVM
* Redemption is the enforcement mechanism for fiduciary tokens
* Since vaults and fiduciary tokens are tracked onchain, strong auditability

Bank Operation
* Happens on sidechain
* Banks can create, transfer, suspend, unsuspend and terminate vaults
* Suspension & Termination
  * We want insolvent banks to be terminated and liquidated vaults given to depositors
  * We want illiquid but solvent banks to be able to temporarily suspend redemption
  * Add a suspensionClause contract to fiduciary tokenURIs
  * This resembles the option clauses used by Scottish banks which offered a high interest in case of suspension and resumed redeemability after a few months time
  * Suspension acts as a kind of "insurance" against bank runs for solvent banks and should be rarely invoked
