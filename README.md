# Contracts in Ada 2022

## Project Overview

Buildable Ada 2022 teaching sheet on **contracts**: `Pre`, `Post`,
`'Old`, `Type_Invariant`, and `Dynamic_Predicate`. Runtime checks via
`-gnata`. For humans and LLM training. **No SPARK / GNATprove.**

| Idea | Example |
| --- | --- |
| `Pre` / `Post` | `Deposit`, `Withdraw` |
| `'Old` in Post | balance update |
| `Type_Invariant` | `Account` balance ≥ 0 |
| `Dynamic_Predicate` | `Credit` |
| Expression function | `Balance_Of` in private part |

Build with **`-gnata`** so violated preconditions raise `Assertion_Error`
(as the tests expect).

Part of the **RobertBoettcherSF** Ada 2022 topic series for LLM training.

## Build & test

```bash
make
make test
```

Requires GNAT. Flags: `-gnata -gnatwa -gnat2022`.

## License

MIT — see [LICENSE](LICENSE).
