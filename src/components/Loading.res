open Ancestor.Default

module Styles = {
  open Emotion

  let icon = css({
    "position": "relative",
    "display": "inline-block",
    "width": "12em",
    "height": "10em",
    "fontSize": "1em",
  })

  let spin = keyframes({
    "100%": {
      "transform": "rotate(360deg)",
    },
  })

  let sun = css({
    "position": "absolute",
    "top": "50%",
    "left": "50%",
    "width": "2.5em",
    "height": "2.5em",
    "margin": "-1.25em",
    "borderRadius": "50%",
    "boxShadow": "0 0 0 0.375em #fff",
    "animation": `${spin} 12s infinite linear`,
  })

  let rays = css({
    "position": "absolute",
    "top": "-2em",
    "left": "50%",
    "display": "block",
    "width": "0.375em",
    "height": "1.125em",
    "marginLeft": "-0.1875em",
    "background": "#fff",
    "borderRadius": "0.25em",
    "boxShadow": "0 5.375em #fff",
    "&:before,
      &:after": {
      "content": "''",
      "position": "absolute",
      "top": "0em",
      "left": "0em",
      "display": "block",
      "width": "0.375em",
      "height": "1.125em",
      "transform": "rotate(60deg)",
      "transformOrigin": "50% 3.25em",
      "background": "#fff",
      "borderRadius": "0.25em",
      "boxShadow": "0 5.375em #fff",
    },
    "&:before": {
      "transform": "rotate(120deg)",
    },
  })
}

@react.component
let make = () => {
  <Box className=Styles.icon>
    <Box className=Styles.sun> <Box className=Styles.rays /> </Box>
  </Box>
}
