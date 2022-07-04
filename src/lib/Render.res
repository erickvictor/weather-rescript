let s = React.string
let map = (item, fn) =>
  item->Js.Array2.mapi((item, index) => fn(item, index->Js.Int.toString))->React.array
