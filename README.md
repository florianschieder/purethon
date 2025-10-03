# purethon

Purethon can be used for exposing Python bindings from PureBasic code.

## Compatibility / stability

At the moment, Purethon is a quite experimental project, providing a proof of concept that bringing
PureBasic to Python is technically possible. Yet it is only compatible with Python 3.13 on Windows.

## Approach

The Python C API exposes a stable ABI which can be used to just scratch down the relevant Python structs
as PureBasic `Struct`s or by using `DataSection` for proper array alignment. Since Python modules are just
regular shared object files / dynamic link libraries, `purethon` based libraries just compile as regular
shared libraries would do in `PureBasic` by e.g. using `ProcedureCDLL` directives to export the module init
function.

## Roadmap

Purethon has been tried to be written generically, but is not yet that "ready to run" and portable for any
specific use case. Feel free for any contributions and ideas.
