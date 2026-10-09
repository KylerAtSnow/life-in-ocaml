type cell =
  | Cell of int * int

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

(* let countNeighbors (c: cell) *)
