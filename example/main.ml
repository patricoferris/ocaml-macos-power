module Mp = Macos_power

let () =
  let time_remaining =
    match Mp.get_time_remaining_estimate () with
    | `Unlimited -> "unlimited"
    | `Unknown -> "unknown"
    | `Float f -> string_of_float f
  in
  Printf.printf "Time remaining: %s\n" time_remaining;
  let sources = Mp.get_sources () in
  List.iteri
    (fun i d ->
      Printf.printf "Dictionary %i has size: %i\n" i (Mp.Dictionary.get_count d))
    sources
