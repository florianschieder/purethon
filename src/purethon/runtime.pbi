#LIBPYTHON_PTR = 1337

CompilerIf #PB_Compiler_OS = #PB_OS_Windows
  #LIBPYTHON_LOCATION = "python313.dll"
CompilerElse
  CompilerError "other OS not yet supported ^-^"
CompilerEndIf


Global LibPythonLoaded = OpenLibrary(#LIBPYTHON_PTR, #LIBPYTHON_LOCATION)