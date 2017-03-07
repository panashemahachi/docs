---
permalink: /
layout: page
title: Dai Credit System Simplified, v0.8
---

Quick information
===

Maker is a Decentralized Autonomous Organization (DAO) that backs the value of the dai stablecoin on the Ethereum blockchain. A DAO is an organization that is entirely blockchain-based, using smart contracts to enforce its rules and business logic.

**Dai** is a stablecoin used for trade and transfers on Ethereum. A stablecoin is a cryptocurrency with price stability.

**MKR** is a speculative share that backs the value of the dai. Maker earns a continuous fee on all outstanding dai in return for governing the system and taking on the risk of bailouts. Maker's income is funnelled to MKR owners through Buy&Burn.

#### Quick links

* [Chat](https://chat.makerdao.com) - Primary platform of community interaction
* [Forum](https://forum.makerdao.com) - For debate and proposals
* [Subreddit](https://www.reddit.com/r/makerdao) - Best place to get latest news and links
* [GitHub](https://github.com/makerdao) - Repository of the public Maker code
* [TeamSpeak](https://ts.makerdao.com/) - For governance meeting conference calls
* [SoundCloud](https://soundcloud.com/makerdao) - Governance meeting recordings
* [Market](https://mkr.market) - MKR and DAI decentralized exchange


Introduction
---

### The basic mechanics

Dai is a token that is backed by Ethereum tokens as collateral. Any user can create Dai by borrowing against collateral that they lock in the system. The dai-denominated debt and collateral are contained in an object called a Collateralzed Debt Position. 

The solvency of the system is maintained by a set of *Solvency Parameters* (sometimes called "Security Parameters"), which are controlled by holders of the MKR token. The term "governers" is used to describe the set of actors using MKR tokens to influence key *Security Parameters*. The term "Maker" is used loosely to mean the role that the MKR subsystem has in the Dai Credit System.

The stability of the dai around the target price is maintained by modifying the incentives for borrowing and holding Dai via *Rate Feedback Mechanism*. This is a reactive mechanism which absorbs some of the volatility of dai and transfers the risk to the borrowers and governers. Governers can only influence the *Sensitivity Parameter* this mechanism - the target price and rate are ultimately determined by the market and cannot be changed directly.

Liqidation and Bailouts
---

To ensure there is always enough collateral in the system to cover the value of all outstanding dai (according to the target price),
a CDP can be force liquidated if it is deemed *risky*. This state is computed based on the CDP type's Security Parameters and real-time price information.

Liquidation means the system automatically takes over the collateral and sells it off in an auction contract specialized for automatic price discovery.

In order for the system to take over the collateral so it can be sold off, *emergency debt* is instantly used to create dai that is backed by the ability of Maker to dilute the MKR supply. A reverse auction is used to find the lowest amount of MKR that needs to be diluted in order to raise enough dai to pay off the emergency debt. This type of auction is called a *debt auction*.

Simultaneously, the collateral is sold off in a continuous splitting auction for dai where all dai proceeds up until the *liquidation penalty* are immediately counted as revenue (and thus automatically funneled to a "Buy and Burn" auction contract). Once enough dai has been bid to cover the liquidation penalty, the auction switches into a reverse auction to try to sell as little collateral as possible; any leftover collateral is returned to the borrower that originally created the CDP.

Liquidations aren't guaranteed to be profitable even if triggered when the collateral ratio of the CDP is positive. Slippage or a market crash could cause the liquidation auction to burn less MKR than what was diluted from the debt auction resulting in net loss for Maker and a net increase of the MKR supply. 

CDP States and Lifecycle
---

* `pride`: Overcollateralized ("safe")
* `anger`: Safe but at debt ceiling
* `worry`: Missing Price Information (grace period)
* `panic`: Undercollateralized ("risky"), can be marked for liquidation
* `grief`: CDP marked for liquidation ("starts" liquidation; collateral is frozen)
* `dread`: Liquidation in progress


Target Price, Target Rate, and the Sensitivity Parameter
--------------

When the credit system performs any risk calculation, it uses the dai **target price**. The target price is automatically adjusted according to the current **target rate** (often called the "deflation rate" when it is above 1).

The stability of the dai around the target price is maintained by modifying the incentives for borrowing and holding Dai via **target rate adjustment**.

Target rate adjustments ensure that the dai market price remains stabilized around the target price. When the market price of the dai is below the target price, the deflation rate of the dai increases causing borrowing to become more expensive.  This leads to a corresponding reduction in supply of dai. At the same time, the increased deflation rate causes the capital gains from holding dai to go up, and leads to a corresponding increase in dai demand. This combination of reduced supply and increased demand causes the dai to appreciate in value, pushing it up towards the target price.

The same mechanism works in reverse if the market price is higher than the target price: the deflation rate decreases, leading to an increased demand for borrowing dai and a decreased demand for holding it. This causes the dai to depreciate in value, pushing it down towards the target price.

This mechanism is a negative feedback loop: Deviation away from the target price in one direction increases the force in the opposite direction. The magnitude of the deflation rate adjustments depends on how long the market price remains on the same side of the target price. Longer deviations result in aggressive adjustments, while shorter deviations result in small adjustments.

The target price and its target rate are not directly influence by MKR governers, which can only set the feedback mechanism’s Sensitivity Parameter. This parameter dictates how quickly the target rate can change in response to dai target/market price deviation, which allows tuning the rate of feedback to the scale of the system.



Security Parameters
---------------------------------------

The Dai Credit System has multiple Security Parameters (also called Solvency Parameters). These parameters are controlled by the governance system, which is ultimately controlled by the MKR token.

**Debt ceiling (`hat`)**

Debt ceiling is the maximum amount of debt that can be created by a single type of CDP. Once enough debt has been created by CDPs of a given type, it becomes impossible to create more unless existing CDPs are closed.

The debt ceiling is used to ensure sufficient diversification of the collateral portfolio.

**Liquidation ratio (`mat`)**

Liquidation ratio is the collateralization ratio at which a CDP can be liquidated. A lower liquidation ratio means governers expect lower collateral volatility.

**Stability fee (`tax`)**

The stability fee is a fee paid by every CDP. It is defined as a yearly percentage that is calculated on top of the existing debt of the CDP. When the borrower covers their CDP, the dai used to cover the CDP debt is destroyed, but the dai used to pay the stability fee is sent to the Buy&Burn contract.

A higher stability fee represents a higher expected rate of failure for the entire CDP class (a "black swan" event like a token contract hack).

**Penalty ratio (`axe`)**

The penalty ratio is used to determined the maximum amount of dai raised from a liquidation auction that goes to Buy&Burn, with excess collateral getting returned to the borrower who originally created the CDP. This is achieved with a two-way auction.

The penalty ratio is used to cover the inefficiency of the liquidation mechanism.

**Limbo Duration (`lax`)**

A CDP is in **limbo** when price information for collateral is not available. The limbo **duration** determines how long before all CDPs of that type are considered *risky*.

Governance of Maker
-----------------------------------

MKR tokens allow users access to vote to perform a narrow set of "governance" actions:

1) `form`: Add new CDP type (distinct set of possible Security Parameters you can choose to open your CDP)
2) `mold`: Modify existing CDP types (this includes "sunsetting" a CDP type by setting its Debt Ceiling to 0, or forcing settlement by setting the Liquidation Ratio and Liquidation Penalty to 0).
3) `frob`: Modify the Sensitivity Parameter

In other words, governers do not and cannot directly control the “monetary policy” of dai as it is typically understood (e.g. they cannot easily take actions to target a fixed inflation rate like a central bank). Dai obtains an automated equilibrium depending characteristics of the collateral portfolio, which is also largely market driven.

Examples
---

>*__Example 1:__ Bob wants to borrow 100 dai. He locks an amount of ETH worth significantly more than 100 dai into a CDP and uses it to borrow 100 dai. The 100 dai is instantly sent directly to his Ethereum account. Assuming that the stability fee is 0.5% per year, over the coming year Bob will need 100.5 dai to cover the CDP if he decides to retrieve his ETH after one year.*

One of the primary use cases of CDPs is margin trading by borrowers.

>*__Example 2:__ Bob wishes to go margin long on the ETH/DAI pair, so he borrows 100 SDR worth of dai by posting 150 SDR worth of ETH to a CDP. He then buys another 100 SDR worth of ETH with his newly borrowed dai putting him at a net 1.66x ETH/SDR exposure. He’s free to do whatever he wants with the 100 SDR worth of ETH he obtained by selling the dai, while the original ETH collateral (150 SDR worth) remains locked until the debt plus the stability fee is covered.*

Although CDPs are not fungible with each other, the ownership of a CDP is transferable. This allows CDPs to be used in smart contracts that perform more complex methods of borrowing (for example, involving more than one actor).

>*__Example 3:__ Alice and Bob collaborate using an Ethereum OTC contract to issue 100 SDR worth of dai backed by ETH. Alice contributes 50 SDR worth of ETH, while Bob contributes 100 SDR worth. The OTC contract takes the funds and creates a CDP, thus borrowing 100 SDR worth of dai. The newly borrowed dai are automatically sent to Bob. From Bob's point of view, he is buying 100 SDR worth of dai by paying the equivalent value in ETH. The contract then transfers ownership of the CDP to Alice. She ends up with 100 SDR worth of debt (denominated in dai) and 150 SDR worth of collateral (denominated in ETH). Since she started with only 50 SDR worth of ETH, she is now 3x long ETH/SDR.*

>*__Example 4:__ If we assume that Ether has a liquidation ratio of 145%, a penalty ratio of 105%, and an Ether-CDP is outstanding at 150% collateral ratio, the Ether price crashes 10% against the target price. This causes the collateral ratio of the CDP to fall to ~135%. As it falls below its liquidation ratio, traders can trigger its liquidation and begin bidding with dai for buying MKR in the debt auction.  Traders can also begin bidding with dai for buying the ~135 dai worth of collateral in the collateral auction. Once there is at least 105 dai being bid on the Ether collateral, traders reverse bid to take the least amount of collateral for 105 dai and the remainder is returned to the original borrower.*


How external agents assist Maker
--------------------------------

### Keepers: Keeping the system economically efficient

Traders that systematically earn an income from Maker and the dai by exploiting simple profit opportunities are a class of agents called **keepers**. In a general sense, a keeper is an economic agent that contributes to decentralized systems in exchange for built-in rewards. In the context of Maker, keepers perform several important functions:

**Participating in continuous splitting auctions**

Each keeper is constantly scanning the blockchain for CDPs that have gone below their liquidation ratio and can have a liquidation auction triggered. Keepers bid on auctions with the goal of getting a price that is better than the market rate so that they can instantly sell the earned asset for profit.

**Market making the dai around the target price**

Each keeper will want to try to sell dai when the market price is higher than the target price. Similarly, keepers buy dai when the price is below the target in order to profit from the known long-term convergence towards the target price and make money from the spread.

A keeper can additionally act as an Oracle by providing a price feed, as described in the following section:

### Oracles: Providing external price feeds

Another crucial group of external actors that Maker requires to function are price feed oracles. Oracles are mechanisms that provide information from the outside world onto the blockchain for smart contracts to consume. Maker needs information about the market price of the dai and its deviation from the target price in order to adjust the deflation rate. It also needs information about the market price of the various assets used as collateral for the dai in order to know when liquidations can be triggered.

Misc: Design goals
---

This design is the result of almost 2 years of iterating on collateralized stablecoin designs. We take every opportunity we see to make reductions and simplifications based on things that are theoretically equivalent under a rational incentive analysis. For example, profit for MKR holders is represented as buy-and-burn rather than dividends. This later ended up yielding massive returns when it enabled us to massively simplify the CDP lifecycle and liquidation processes.

Another design goal was to ensure all operations were constant space and time. This introduced some challenges as the system simulates multiple sets of contiuously growing or shrinking balances and most state is actually function of multiple real-time variables.


