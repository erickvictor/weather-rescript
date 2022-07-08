type t = {
  wind: WindTypes.t,
  main: MainTypes.t,
  name: string,
  id: int,
}

let codec = Jzon.object4(
  ({wind, main, name, id}) => (wind, main, name, id),
  ((wind, main, name, id)) => {wind: wind, main: main, name: name, id: id}->Ok,
  Jzon.field("wind", WindTypes.codec),
  Jzon.field("main", MainTypes.codec),
  Jzon.field("name", Jzon.string),
  Jzon.field("id", Jzon.int),
)
