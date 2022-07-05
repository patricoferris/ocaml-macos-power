module T = Power_c.C.Type
module F = Power_c.C.Functions

let get_time_remaining_estimate () =
  match F.get_time_remaining_estimate () with
  | f when int_of_float f = T.unknown_time_remaining -> `Unknown
  | f when int_of_float f = T.unlimited_time_remaining -> `Unlimited
  | f -> `Float f

module Dictionary = struct
  type t = T.Dictionary.t Ctypes_static.structure Ctypes_static.ptr

  let get_count = F.Dictionary.get_count
end

let get_sources () =
  let srcs = F.copy_power_sources_info () in
  let lst = F.copy_sources_list srcs in
  let f v = F.get_power_source_description srcs v in
  List.map f lst
