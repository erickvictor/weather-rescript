Emotion.injectGlobal({
  "html": {
    "fontSize": "16px",
  },
  "html, body, #root": {
    "width": "100%",
    "margin": "0",
    "padding": "0",
    "position": "relative",
    "background": Theme.Constants.gradient,
    "backgroundSize": "400% 400%",
  },
  "*": {
    "boxSizing": "border-box",
    "fontFamily": Theme.Constants.fontFamily,
    "&::before, &::after": {
      "boxSizing": "inherit",
    },
  },
})

@react.component
let make = () => {
  <Container> <Weather /> </Container>
}
