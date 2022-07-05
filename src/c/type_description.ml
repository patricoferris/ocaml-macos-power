open Ctypes
module Types (F : TYPE) = struct
  open F

  let unknown_time_remaining = constant "kIOPSTimeRemainingUnknown" int
  let unlimited_time_remaining = constant "kIOPSTimeRemainingUnlimited" int

  module TypeRef = struct
    let t = typedef (ptr void) "CFTypeRef"
  end

  module Dictionary = struct
    type t
    let t : t Ctypes_static.structure Ctypes_static.ptr F.typ = 
      let dict = structure "__CFDictionary" in
      typedef (ptr dict) "CFDictionaryRef"
  end

end