open Ancestor.Default

module Styles = {
  open Emotion

  let ulWrapper = css({
    "column-count": "2",
  })
}

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
      <Base tag=#ul p=[xs(0)] className=Styles.ulWrapper>
        {if results->Js.Array2.some(result => result.isLoading) {
          <Loading />
        } else {
          results
          ->Js.Array2.map(result =>
            switch result {
            | {data: Some(Ok(weather))} =>
              <List
                key={weather.name}
                min=weather.main.temp_min
                max=weather.main.temp_max
                name=weather.name
              />
            | _ => <p> {`Error`->React.string} </p>
            }
          )
          ->React.array
        }}
      </Base>
    </Box>
  </Box>
}
