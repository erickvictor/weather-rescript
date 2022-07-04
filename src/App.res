open Ancestor.Default

@react.component
let make = () => {
  <Box p=[#xs(4)] bgColor=[#xs(#hex("#000")), #md(#hex("#cacaca"))]>
    <Typography tag=#h1 color=[#xs(#hex("#fafafa")), #md(#hex("#000"))]>
      {`Hello from ReScript and Vite 😄`->React.string}
    </Typography>
  </Box>
}
