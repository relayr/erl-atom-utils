# atom_utils

[![Build Status](https://travis-ci.org/relayr/erl-atom-utils.svg?branch=master)](https://travis-ci.org/relayr/erl-atom-utils) [![Coverage Status](https://coveralls.io/repos/github/relayr/erl-atom-utils/badge.svg?branch=master)](https://coveralls.io/github/relayr/erl-atom-utils?branch=master)

Functions operating on Erlang atoms.

## Examples

#### from_string/1
Convert string to an atom. This is safe operation that tries to use `list_to_existing_atom/1` first and if it fails it uses `list_to_atom/1`.
```
1> atom_utils:from_string("hello world").
'hello world'
```

#### append_id/2
Append numeric identifier to an atom.
```
1> atom_utils:append_id(worker, 3).
worker_3
```

#### append_suffix/2
Create new atom by appending string suffix to an existing atom.
```
1> ClientName = "acme-f307a812".
"acme-f307a812"
2> atom_utils:append_suffix(worker, [$_ | ClientName]).
'worker_acme-f307a812'
```