open Ancestor.Default

let {useWeather} = module(WeathersHook)

@react.component
let make = () => {
  let results = useWeather()

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
        fontSize=[#xs(2.3->#rem)]
        fontWeight=[#xs(#bold)]>
        {`Capitais`->React.string}
      </Typography>
      <List />
      {if results->Js.Array2.some(result => result.isLoading) {
        <p> {`Load`->React.string} </p>
      } else {
        Js.log2(`res`, results)
        results->Js.Array2.map(result =>
          switch result {
          | {data: Some(Ok(weather))} => <p key={weather.name}>
              {weather.main.temp_min->React.float} {`º `->React.string }
              {weather.main.temp_max->React.float}
              {`º `->React.string } {weather.name->React.string} 
            </p>
          | _ => <p> {`Error`->React.string} </p>
          }
        )->React.array
      }}
    </Box>
  </Box>
}
