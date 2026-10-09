open life_in_ocaml.life

let cell = struct
  let x = 0
  let y = 0
end

let () = assert (NeighborCells.neighbors = [
    struct
      let x = - 1
      let y = - 1
    end;
    struct
      let x = 0
      let y = - 1
    end;
    struct
      let x = 1
      let y = - 1
    end;
    struct
      let x = - 1
      let y = 0
    end;
    struct
      let x = 1
      let y = 0
    end;
    struct
      let x = - 1
      let y = 1
    end;
    struct
      let x = 0
      let y = 1
    end;
    struct
      let x = 1
      let y = 1
    end;
])
