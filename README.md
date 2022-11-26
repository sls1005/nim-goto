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

### How it works

As we know, Nim code can be compiled to C. Although Nim itself doesn't have `goto`, we can still put a label in the generated C code.

### Note

+ As this emits C code, it can only be used with the C-like backends.

+ The Nim compiler also use labels in the C code. So please never use a label with one or more underscores (`_`) in the name, or the result is unpredictable.

+ This is unstable.
