macro label*(labelName, body: untyped): untyped =
    expectKind(labelName, nnkIdent)
    let name = "NIMROD_LABEL_NAME_" & repr(labelName)
    result = quote do:
        {.emit: `name` & ":".}
        `body`

macro goto*(labelName: untyped): untyped =
    expectKind(labelName, nnkIdent)
    let name = "NIMROD_LABEL_NAME_" & repr(labelName)
    result = quote do:
        {.emit: "goto " & `name` & ";".}

template label*(labelName: untyped): untyped =
    label labelName:
        discard

template jmp*(labelName: untyped): untyped =
    goto labelName
