open Life_in_ocaml.Life

let c = (Cell (0, 0))
let w = [
  (Cell (0, 0));
  (Cell (1, 0));
  (Cell (2, 0));
  (Cell (2, 1));
  (Cell (1, 2))
]

let () = assert ((neighbors c) = [
  (Cell (-1, -1));
  (Cell (0, -1));
  (Cell (1, -1));
  (Cell (-1, 0));
  (Cell (1, 0));
  (Cell (-1, 1));
  (Cell (0, 1));
  (Cell (1, 1))
])

let () = assert (cellInWorld w (Cell (1, 2)))
let () = assert (not (cellInWorld w (Cell (2, 2))))

let () = assert ((countNeighbors w (Cell (1, 1))) = 5)
let () = assert ((countNeighbors w (Cell (0, 0))) = 1)
let () = assert ((countNeighbors w (Cell (5, 5))) = 0)

let () = assert ((List.length (worldAndNeighbors w)) = 22)

let () = assert ((nextBoard w) = [
  (Cell (0, 1));
  (Cell (1, -1));
  (Cell (1, 0));
  (Cell (2, 0));
  (Cell (2, 1))
])


let () = print_endline "All tests passed!"
