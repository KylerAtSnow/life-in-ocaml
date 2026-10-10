open Life_in_ocaml.Life

let w = CellSet.(
  empty
  |> add (0, 0)
  |> add (1, 0)
  |> add (2, 0)
  |> add (2, 1)
  |> add (1, 2)
)

let expected_neighbors = CellSet.(
  empty
  |> add (-1, -1)
  |> add (0, -1)
  |> add (1, -1)
  |> add (-1, 0)
  |> add (1, 0)
  |> add (-1, 1)
  |> add (0, 1)
  |> add (1, 1)
)
let () = assert (CellSet.equal (neighbors (0, 0)) expected_neighbors)

let () = assert (cellInWorld w (1, 2))
let () = assert (not (cellInWorld w (2, 2)))

let () = assert ((countNeighbors w (1, 1)) = 5)
let () = assert ((countNeighbors w (0, 0)) = 1)
let () = assert ((countNeighbors w (5, 5)) = 0)

let () = assert ((CellSet.cardinal (worldAndNeighbors w)) = 22)

let expected_next_board = CellSet.(
  empty
  |> add (0, 1)
  |> add (1, -1)
  |> add (1, 0)
  |> add (2, 0)
  |> add (2, 1)
)
let () = assert (CellSet.equal (nextBoard w) expected_next_board)


let () = print_endline "All tests passed!"
