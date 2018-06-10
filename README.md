# TODO.vim

Add `TODO`s to the local list.

## Usage

To find all `TODO`s, invoke the command:

```
:TODO
```

This will search recursively inside the current working directory and open the
local list if any matches are found.

TODO.vim also supports finding `TODO`s that have been assigned:

```
:let g:todo_name = 'dirn'
:TODO
```

This will return any `TODO`s that match the pattern `TODO(dirn)`.

Alternatively you can set a specific name for a buffer. This will override
`g:todo_name`.

```
:let b:todo_name = 'dirn'
```

Both of these values can be overridden by passing in a value when calling
`:TODO`.

```
:TODO dirn
```
