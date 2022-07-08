type t = {temp_min: float, temp_max: float}

let codec = Jzon.object2(
  ({temp_min, temp_max}) => (temp_min, temp_max),
  ((temp_min, temp_max)) => {temp_min: temp_min, temp_max: temp_max}->Ok,
  Jzon.field("temp_min", Jzon.float),
  Jzon.field("temp_max", Jzon.float),
)
