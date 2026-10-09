type cell = Cell of int * int

let compareCells (a: cell) (b: cell) =
  match (a, b) with
  | (Cell (ax, ay), Cell (bx, by)) when ax = bx -> Int.compare ay by
  | (Cell (ax, ay), Cell (bx, by)) -> Int.compare ax bx

let neighbors (c: cell) =
  match (c) with
  | Cell (x, y) -> [
  	(Cell (x - 1, y - 1));
  	(Cell (x + 0, y - 1));
  	(Cell (x + 1, y - 1));
  	(Cell (x - 1, y + 0));
  	(Cell (x + 1, y + 0));
  	(Cell (x - 1, y + 1));
  	(Cell (x + 0, y + 1));
  	(Cell (x + 1, y + 1))
  ]

let cellInWorld (w: cell list) (c: cell) = List.mem c w

let countNeighbors (w: cell list) (c: cell) =
  (neighbors c)
  |> List.filter (cellInWorld w)
  |> List.length

let worldAndNeighbors (w: cell list) =
  (List.map neighbors w)
  |> List.flatten
  |> List.sort_uniq compareCells

(* B3/S23 *)
let nextBoard (w: cell list) =
  (worldAndNeighbors w)
  |> List.filter (fun x -> (countNeighbors w x) = 3)
  |> List.append (List.filter (fun x -> (countNeighbors w x) = 2) w)
  |> List.sort_uniq compareCells
