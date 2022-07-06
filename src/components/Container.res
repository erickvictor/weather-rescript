module Styles = {
  open Emotion

  let container = css({
    "maxWidth": "580px",
    "marginLeft": "auto",
    "marginRight": "auto",
  })
}

@react.component
let make = (~children: React.element) => {
  <div className=Styles.container>
    children
  </div>
}