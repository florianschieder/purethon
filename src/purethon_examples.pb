XIncludeFile "purethon/pymodule.pbi"
XIncludeFile "purethon/pyobject.pbi"
XIncludeFile "purethon/pymethod.pbi"

ProcedureC.i show_message_box(*self.PyObject, *args.PyObject)
  ; TODO parse title, text and button opts from 'args'.
  
  MessageRequester("Sample Title", "Sample Text", #PB_MessageRequester_YesNoCancel | #PB_MessageRequester_Info)
  
  ; TODO return something valid. python here complains with 'returned 0
  ; without settings exception'
  ; -- raising exception is not what we want to do here.
  ; we want to return some usable constant back to the user
  ; to see which button has been clicked
  ProcedureReturn 0
EndProcedure

DataSection
  ; TODO this !db stuff is for sure not C backend compatible (inline ASM)
  ; possibly reflect about some macro/compatibility shim or entirely another
  ; approah...
  __s_purethon_module_name:
    !db "purethon_examples",0
  
  __s_show_message_box:
    !db "show_message_box",0
  
  __s_show_message_box_docstring:
    !db "some useless show_message_box docstring",0
  
  __s_purethon_docstring:
    !db "some useless module docstring",0
  
  messagebox_methods:
    ; show_message_box()
    Data.i ?__s_show_message_box
    Data.i @show_message_box()
    Data.i #METH_VARARGS
    Data.i ?__s_show_message_box_docstring
    
    ; sentinel
    Data.i 0,0,0,0
    
EndDataSection

InferPythonModule(purethon_examples, ?__s_purethon_module_name, ?__s_purethon_docstring, ?messagebox_methods)