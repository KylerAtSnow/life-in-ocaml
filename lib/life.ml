module Cell =
  struct
    type t = int * int
    let compare (x0,y0) (x1,y1) =
      match Stdlib.compare x0 x1 with
          0 -> Stdlib.compare y0 y1
        | c -> c
  end

module CellSet = Set.Make(Cell)

(* Generations *)
let generations = 100
(* World or Board *)
let w = CellSet.(
  empty
  |> add (0, 0)
  |> add (1, 0)
  |> add (2, 0)
  |> add (2, 1)
  |> add (1, 2)
)

let neighbors ((x, y): int * int) = CellSet.(
  empty
  |> add (x - 1, y - 1)
  |> add (x + 0, y - 1)
  |> add (x + 1, y - 1)
  |> add (x - 1, y + 0)
  |> add (x + 1, y + 0)
  |> add (x - 1, y + 1)
  |> add (x + 0, y + 1)
  |> add (x + 1, y + 1)
)

let cellInWorld w c = CellSet.mem c w

let countNeighbors w c =
  (neighbors c)
  |> CellSet.filter (cellInWorld w)
  |> CellSet.cardinal

let worldAndNeighbors w =
  CellSet.fold (fun cell acc ->
    CellSet.union (neighbors cell) acc
  ) w CellSet.empty

(* B3/S23 *)
let nextBoard w =
  (worldAndNeighbors w)
  |> CellSet.filter (fun x -> (countNeighbors w x) = 3)
  |> CellSet.union (CellSet.filter (fun x -> (countNeighbors w x) = 2) w)

let rec life w i = if i > 0 then life (nextBoard w) (i - 1) else (nextBoard w)

let stringOfCell (x, y) =
  Printf.sprintf "(%d, %d)" x y

let stringOfWorld w : string =
  w
  |> CellSet.elements
  |> List.map stringOfCell
  |> String.concat "; "
  |> Printf.sprintf "[%s]"

let () = print_endline (stringOfWorld w)

let () = print_endline (stringOfWorld (life w generations))
