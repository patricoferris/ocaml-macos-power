open Ctypes
module T = Types_generated

module Functions (F : Ctypes.FOREIGN) = struct
  open F

  module Dictionary = struct
    let get_count = foreign "CFDictionaryGetCount" (T.Dictionary.t @-> returning Cf.Index.typ)
  end

  let get_time_remaining_estimate = foreign "IOPSGetTimeRemainingEstimate" (void @-> returning Cf.TimeInterval.typ)

  let copy_power_sources_info = foreign "IOPSCopyPowerSourcesInfo" (void @-> returning T.TypeRef.t)

  let copy_sources_list = foreign "IOPSCopyPowerSourcesList" (T.TypeRef.t @-> returning Cf.Array.List.typ)

  let get_power_source_description = foreign "IOPSGetPowerSourceDescription" (T.TypeRef.t @-> T.TypeRef.t @-> returning T.Dictionary.t)
end