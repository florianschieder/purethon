XIncludeFile "./pymodule.pbi"
XIncludeFile "./runtime.pbi"

Structure PyModuleDef
  ob_refcnt.i
  ob_type.i
  m_init.i
  m_index.i
  m_copy.i
  m_name.i
  m_doc.i
  m_size.i
  m_methods.i
  m_slots.i
  m_traverse.i
  m_clear.i
  m_free.i
EndStructure

#Py_mod_create = 1
#Py_mod_exec   = 2

; PyModuleDef_Inits
Prototype Proto_PyModuleDef_Init(*module.PyModuleDef)
Global PyModuleDef_Init.Proto_PyModuleDef_Init = GetFunction(#LIBPYTHON_PTR, "PyModuleDef_Init")


Macro InferPythonModule(__P_module_name_ident, __P_module_name_str, __P_docstring, __P_methods)
  Global PyModuleHandle_#__P_module_name_ident
  
  ; NOTE the module execution callback is just a simple stub doing nothing.
  ; in case they need to do more actual logic, maybe let it be implemented
  ; externally and passed via further Macro parameter.
  ProcedureC.i exec_#__P_module_name_ident(module_ptr.i)
    ProcedureReturn 0
  EndProcedure
  
  DataSection
    slots:
      Data.i #Py_mod_exec, @exec_#__P_module_name_ident()
      Data.i 0, 0
  EndDataSection
  
  ProcedureCDLL PyInit_#__P_module_name_ident()
    If Not LibPythonLoaded Or PyModuleDef_Init = 0
      ProcedureReturn 0
    EndIf
    
    Static PyModuleHandle_#__P_module_name_ident.PyModuleDef
    
    PyModuleHandle_#__P_module_name_ident\m_name    = __P_module_name_strs
    PyModuleHandle_#__P_module_name_ident\m_doc     = __P_docstring
    PyModuleHandle_#__P_module_name_ident\m_size    = 0
    PyModuleHandle_#__P_module_name_ident\m_methods = __P_methods
    PyModuleHandle_#__P_module_name_ident\m_slots   = ?slots
    
    ProcedureReturn PyModuleDef_Init(@PyModuleHandle_#__P_module_name_ident)
  EndProcedure
EndMacro