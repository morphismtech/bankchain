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
* Own and operate Bitcoin (and other layer-1 cryptos) vault(s) on bankchain
* Associated ERC-20 stablecoin token(s) on the EVM "backed" by the vault(s)
* ERC-4626 yield bearing share tokens with stablecoin asset tokens on the EVM
* EVM tokens will have a tokenURI
  * containing a JSON object
  * with a "contract" field
  * and a "suspensionClause" field
  * encoding two different term structures of yield bearing contracts
* These tokens are "fiduciary" tokens, they involve trust because the EVM will not enforce the term structures of the contract
* Fiduciary tokens can act as bank accounts
* Banks consume bank services to manage and trade their tokens
* Banks are auditable
  * vaults and fiduciary tokens onchain
* Banks are accountable
  * redemption of fiduciary tokens

Redemption
* Anyone may deposit fiduciary tokens for redemption on bankchain
* Daily clearance
  * Based on the term structures
  * All redeemable deposited tokens are valued
  * Only the differences in what depositors total owed - owe are redeemed
  * Economizing on layer-1 transfers
  * Redemptions transfer out of the vaults to depositors
  * Then the redeemed fiduciary tokens are burned on the EVM

Vault Operation
* Banks can create, transferFrom, suspend, unsuspend and terminate their vaults
* Anyone can transfer their Bitcoin to any Bitcoin vault
* Suspension & Termination
  * Empty vaults can be no-fault terminated
  * Illiquid banks can
    * Suspend a vault
    * Bank can't transferFrom the vault
    * Suspending switches fiduciary duty to the suspensionClause contract
    * Unsuspending switches back, re-enables transferFrom
    * Modeled on the option clauses used by Scottish banks
      * high interest and briskly resumed redeemability
    * Acts as "insurance" against bank runs for solvent banks
  * Insolvent banks can
    * Terminate a vault that is suspended
    * Bank still can't transferFrom the vault
    * Depositors have six months to deposit fiduciary tokens on bankchain
    * Vault funds and bank stakes are transferred to depositors

Bank Software
* Server
  * Automates minting of stablecoins
  * And transferring them to be assets for fiduciary share tokens
  * According to fiduciary contract obligations
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
