## Timestamper Contract

The timestamper contract is a simple data structure that allows for a user to timestamp a piece of data using [@openzeppelin's EnumerableSet's library](https://docs.openzeppelin.com/contracts/5.x/api/utils#EnumerableSet). It is a simple wrapper around the library that allows for a user to timestamp a piece of data and then retrieve the timestamped data.

This can be used instead of a NOM-151 certificate from a trusted timestamping authority.

## Getting started

Install dependencies with

```bash
forge install
```

To run tests, you'll need to setup the /keys directory. Follow its [README](./keys/README.md) for more information.

Once keys are set, run tests with:

```bash
forge clean && forge test
```
