import goto

proc main =
  var i = 1
  label L1:
    echo i
    inc i
  if i < 100:
    jmp L1

main()
