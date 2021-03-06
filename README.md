# Nim GoTo

This implements the `goto` statement of the Nim programming language.

The word `label` can be used to create a label, while `goto` or `jmp` can be used to jump to it.

### Example

``` nim
import goto

proc main =
  var i = 1
  label L1:
    echo i
    i += 1
  if i < 100:
    goto L1

main()
```

The word `jmp` can be used instead of `goto`. Their semantics are same.

``` nim
import goto

proc main =
  var i = 1
  label L1:
    echo i
    inc i
  if i < 100:
    jmp L1

main()
```

### How it works?

As we know, Nim code can be compiled to C. Although Nim itself doesn't have `goto`, we can affect the generated C code and create a label.

Note that this only works on C-like backends. In addition to that, labels also used by the Nim compiler. To prevent conflicts, underscores should never be a part of a label name.
