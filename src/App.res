open Ancestor.Default

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
  <Container>
    <Box display=[#xs(#flex)] justifyContent=[#xs(#center)] flexDirection=[#xs(#column)]>
      <Typography
        tag=#h1 color=[#xs(#hex("#fafafa"))] textAlign=[#xs(#center)] fontSize=[#xs(3.3->#rem)]>
        {`Previsão do tempo`->React.string}
      </Typography>
      <Input placeholder="Insira aqui o nome da cidade" />
      <Base
        tag=#hr
        mt=[#xs(4)]
        mb=[#xs(2)]
        border=[#xs((1->#px, #solid, #hex("#FFE9C7")))]
        width=[#xs(100.->#pct)]
      />
      <Box px=[xs(5)]>
        <Typography
          tag=#h4
          my=[xs(1)]
          color=[#xs(#hex("#fafafa"))]
          fontSize=[#xs(1.8->#rem)]
          fontWeight=[#xs(#bold)]>
          {`Capitais`->React.string}
        </Typography>
        <List />
      </Box>
    </Box>
  </Container>
}
