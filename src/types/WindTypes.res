type t = {speed: float, deg: int}

let codec = Jzon.object2(
  ({speed, deg}) => (speed, deg),
  ((speed, deg)) => {speed: speed, deg: deg}->Ok,
  Jzon.field("speed", Jzon.float),
  Jzon.field("deg", Jzon.int),
)
