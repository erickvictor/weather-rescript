module Colors = {
  let primary = #hex("#E17500")
  let gray = #hex("#505050")
  let black = #hex("#222222")
  let white = #hex("#FFFFFF")

  let toString = color =>
    switch color {
    | #hex(color) => color
    }
}

module Constants = {
  let fontFamily = "'DM Sans', sans-serif;"
  let gradient = "linear-gradient(to bottom, #ff8000, #ff8e00, #ff9c00, #ffa900, #ffb600);"
  let gradients = "linear-gradient(
    180deg,
    hsl(43deg 100% 50%) 0%,
    hsl(41deg 100% 50%) 10%,
    hsl(40deg 100% 50%) 20%,
    hsl(39deg 100% 50%) 30%,
    hsl(38deg 100% 50%) 40%,
    hsl(37deg 100% 50%) 50%,
    hsl(36deg 100% 50%) 60%,
    hsl(34deg 100% 50%) 70%,
    hsl(33deg 100% 50%) 80%,
    hsl(32deg 100% 50%) 90%,
    hsl(31deg 100% 50%) 100%
  );"
}
