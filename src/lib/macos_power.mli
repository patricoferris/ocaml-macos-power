module T = Power_c.C.Type
module F = Power_c.C.Functions

val get_time_remaining_estimate :
  unit -> [> `Float of float | `Unknown | `Unlimited ]
(** Approximate time remaining, [`Unlimited] is given when plugged into an external power source. *)

(* TODO: Upstream to ocaml-cf *)
module Dictionary : sig
  type t

  val get_count : t -> int
  (** The number of key-value pairs in the dictionary. *)
end

val get_sources : unit -> Dictionary.t list
(** All of the power sources for the device *)
