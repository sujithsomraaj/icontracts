
# Intelligent Contracts

![Pepe Rules The World](https://i.imgur.com/I3hGl2w.png)

## Introduction

**Intelligent smart contracts** use a set of cached and pre-determined knowledge to offset computational costs, resulting in subsequent lower gas costs for users.

In a world with finite hardware resources, writing machine-level code can optimize gas costs to some extent. However, to further reduce costs, modern computational approaches must be pursued.

To put this into perspective, imagine a world without virtualization. That is how smart contract's and its state operates today. Virtualizing the state can achieve more efficient operations on-chain.

## Virtualization Of State

In the real world, many smart contracts share similar operations. Leveraging such state by newer contracts or remembering their own results can help contracts operate gas efficiently, as there is no need to perform the same computation repeatedly.

For eg, imagine adding 1 and 2 for 500 times inside a smart contract. It'll cost roughly around 138583 GAS, but using a cache will result for the next user to just consume 8060 GAS. Seriously, the costs are now reduced by more than 96% for the second user.

If such operation happens infinite times, the cost will almost be zero for the last user.

## Experimentation

The experiment involves the basic math operation of addition. So the [Predictor.sol](/src/Predictor.sol) contract is used to add 2 variables 500 times and store them into its storage if there is a cache miss.

If there is cache, it'll return the sum from the cache.

### Proof Of Gas Efficiency

Initially, the first operation takes nearly 138584 GAS to add and store the value to cache variable.

But the second operation took just 8060 GAS to compute the transaction, which is nearly 96% less costly than a real operation, provided I took no code optimization into account.

![Graph Of Gas Efficiency](https://i.imgur.com/zAo9A2q.png)

### Proof Of Intelligence

This contract is intelligent enough to know that, a + b = b + a (a simple high school mathematical theorem), hence to calculate b + a, it never computed the result, instead just thrown the result from cache, which almost cost 8060 GAS even for the first user.

![Graph Of Intelligence](https://i.imgur.com/iG6qoW4.png)

## Roadmap

In initial stages, the PoC contract added here is used to prove that addition of number over multiple times is beneficial, but soon more real-world smart contract use cases will be added and helper libraries will be created.

One real world example, I could imagine at this point is to offset cross-chain messaging costs, by just sending a hash rather than a message, since the same message is already delivered previously.

This could reduce cross-chain messaging costs by more than 80 - 90% for complex apps.

## Local Development

```
git clone https://github.com/sujithsomraaj/icontracts.git
```

### Install Dependencies

```
forge install
```

### Test

```
forge test
```

### Gas Snapshots

```
forge snapshot
```

![Gas Snapshot Example](https://i.imgur.com/0jGC9Jo.png)

## Contribution guidelines

Welcoming all GigaBrain chads to take the process further, as my understanding of solidity is limited, hence if we can optimize the code even more, we can achieve a great amount of stability.

### How to contribute

If you want to contribute code to the project, please follow the below guidelines:

1. Fork the project repository and clone it to your development machine.
1. Create a new branch and add your changes.
1. Add unit tests for them.
1. Create a pull request with detailed explanations.
