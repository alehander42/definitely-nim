import jsffi, asyncjs, future

type
  Breakpoint* = ref object of js
    id*: int
    file*: cstring
    `func`*: cstring | seq[cstring]
    thread*: Thread

  Thread* = ref object of js
    id*: int
    status*: cstring
    group*: ThreadGroup
    frame*: Frame

  ThreadGroup* = ref object of js
    id*: int
    executable*: cstring
    pid*: int

  Frame* = ref object of js
    file*: cstring
    `func`*: cstring
    line*: int
    level*: int

  Variable* = ref object of js
    name*: cstring
    `type`*: cstring
    scope*: cstring
    value*: cstring

  GDB* = ref object of js

proc addBreak*(path: cstring, line: int, thread: Thread = nil): FutureJs[Breakpoint] {.importc.}
proc removeBreak*(breakpoint: Breakpoint): void {.importc.}
