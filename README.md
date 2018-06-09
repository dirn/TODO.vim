# TODO.vim

Add `TODO`s to the quickfix list.

## Usage

To find all `TODO`s, invoke the command:

```
:TODO
```

This will search recursively inside the current working directory and open the
quickfix list if any matches are found.

TODO.vim also supports finding `TODO`s that have been assigned:

```
:let g:todo_name = 'dirn'
:TODO
```

This will return any `TODO`s that match the pattern `TODO(dirn)`.
