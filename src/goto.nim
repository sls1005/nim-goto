import std/macros

macro label*(labelName, body: untyped): untyped =
  expectKind(labelName, nnkIdent)
  let name = repr(labelName)
  result = quote do:
    {.emit: `name` & ":".}
    block:
      `body`

macro goto*(labelName: untyped): untyped =
  expectKind(labelName, nnkIdent)
  let name = repr(labelName)
  result = quote do:
    {.emit: "goto " & `name` & ";".}

template jmp*(labelName: untyped): untyped =
  goto labelName
