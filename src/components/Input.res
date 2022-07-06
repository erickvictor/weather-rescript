module Styles = {
  open Emotion

  let {toString: colorToString} = module(Theme.Colors)

  let input = css({
    "marginLeft": "auto",
    "marginRight": "auto",
    "color": Theme.Colors.black->colorToString,
    "fontSize": "1.6rem",
    "border": "none",
    "padding": "0.9rem 1.2rem",
    "outline": "none",
    "width": "80%",
    "transition": "300ms",
    "&:placeholder": {
      "color": Theme.Colors.gray->colorToString,
    },
    "&:focus": {
      "transition": "300ms",
      "boxShadow": `0px 0px 0px 3px ${Theme.Colors.primary->colorToString}`,
    },
  })
}

@react.component
let make = (~onChange=?, ~name=?, ~placeholder=?) => {
  <input ?onChange ?name ?placeholder className=Styles.input />
}
