module type liveCell = sig
  val x : int
  val y : int
end

module NeighborCells (C : liveCell) = struct
  let neighbors = [
    struct
      let x = C.x - 1
      let y = C.y - 1
    end;
    struct
      let x = C.x
      let y = C.y - 1
    end;
    struct
      let x = C.x + 1
      let y = C.y - 1
    end;
    struct
      let x = C.x - 1
      let y = C.y
    end;
    struct
      let x = C.x + 1
      let y = C.y
    end;
    struct
      let x = C.x - 1
      let y = C.y + 1
    end;
    struct
      let x = C.x
      let y = C.y + 1
    end;
    struct
      let x = C.x + 1
      let y = C.y + 1
    end;
  ]
end
