; TODO these structs were once just scratched down and may not match the exact
; memory layout. reflect it entirely.
Structure PyVarObject
  ob_refcnt.i
  ob_type.i
  ob_size.i
  ob_item.i
EndStructure

Structure PyTypeObject
  ob_base.PyVarObject
  tp_name.i
  tp_basicsize.i
  tp_itemsize.i

  tp_dealloc.i
  tp_vectorcall_offset.i
  tp_getattr.i
  tp_setattr.i
  tp_as_async.i
  tp_repr.i

  tp_as_number.i
  tp_as_sequence.i
  tp_as_mapping.i
EndStructure

Structure PyObject
  ob_refcnt.i
  *ob_type.PyTypeObject
EndStructure


