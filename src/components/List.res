open Ancestor.Default
open Render

@react.component
let make = (~min, ~max, ~name) => {
  <Base tag=#li listStyleType=[#xs(#none)] fontWeight=[#xs(#bold)] mb=[#xs(1)]>
    {Js.Float.toFixed(min)->s} {`º `->s} {Js.Float.toFixed(max)->s} {`º `->s} {name->s}
  </Base>
}
