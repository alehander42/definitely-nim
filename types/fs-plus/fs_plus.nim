import jsffi, asyncjs, future

proc getHomeDirectory*: cstring {.importc.}
proc absolute*(relativePath: cstring): void {.importc.}
proc traverseTreeSync*(rootPath: cstring, onFile: (cstring) -> void, onDirectory: (cstring) -> void): void {.importc.}
proc traverseTree*(rootPath: cstring, onFile: (cstring) -> void, onDirectory: (cstring) -> void, onDone: () -> void): FutureJs[void] {.importc.}
