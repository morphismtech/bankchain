Architecture

* Protocol
  * Fiduciary token protocol
    * runs on EVM (Ethereum)
  * Redemption & vault operation protocol
    * runs on bankchain (Cosmos sidechain)
* Bank Service
  * Bank Software
  * Bank Hardware

Banks
* Abstractly, a "bank" is a market maker in the loanable funds market
* Loanable funds inherently involve trust/credit
* Banks will own and operate Bitcoin (and other layer-1 cryptos) vault(s) on bankchain
* Banks issue fiduciary tokens
  * Two different fiduciary token types
    * Vault backed [ERC-20](https://ethereum.org/en/developers/docs/standards/tokens/erc-20/) stablecoin tokens on the EVM
    * Stablecoin asset backed [ERC-4626](https://ethereum.org/en/developers/docs/standards/tokens/erc-4626/) yield bearing share tokens on the EVM
  * Fiduciary tokens have a tokenURI with onchain JSON object metadata
    * with a "contract" field
    * and a "suspensionClause" field
    * encoding two different term structures of yield bearing contracts
    * for stablecoins "contract" is {"type": "one", "currency": "BTC"}
      - contract that pays 1 BTC on demand
      - to holder of 1 unit of the stablecoin
  * The EVM will not enforce the term structures of the contract
  * Fiduciary tokens can act as bank accounts
* Banks consume bank services to manage and trade their tokens
* Banks are auditable
  * vaults and fiduciary tokens onchain
* Banks are reputable
  * through staked tokens on bankchain
  * and branding
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
    * Vault tokens and bank stake tokens are transferred to depositors

Bank Software
* Server
  * Automates minting of stablecoins
  * And transferring them to be assets for fiduciary share tokens
  * According to fiduciary contract obligations
* Dapp
  * Bank level
  * Customer level

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
* Bankcards, Bankchecks, et cetera
