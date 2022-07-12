let {queryOptions, useQuery, useQueries} = module(ReactQuery)

let cidades = [
  `Rio de Janeiro`,
  `São Paulo`,
  `Belo Horizonte`,
  `Brasília`,
  `Belém`,
  `Salvador, BR`,
  `Curitiba`,
  `Fortaleza`,
  `Manaus`,
  `João Pessoa`,
]

let apiUrl = "https://api.openweathermap.org/data/2.5"
let apiCodec = JsonCodec.codec

let handleFetch = (~city) => {
  open Promise
  Fetch.fetch(
    `${apiUrl}/weather?q=${city}&appid=${%raw(`import.meta.env.VITE_APIKEY`)}&units=metric&lang=pt_br`,
    {"method": "GET"},
  )
  ->then(response => Fetch.json(response))
  ->thenResolve(json => Jzon.decodeWith(json, apiCodec))
}

type requestResult =
  | Data(JsonCodec.t)
  | Loading
  | Error

let useWeather = () => {
  let results = useQueries({
    Js.Array2.map(cidades, cidade => {
      queryOptions(
        ~queryKey=["weathers", cidade],
        ~queryFn={_ => handleFetch(~city=cidade)},
        ~refetchOnWindowFocus=ReactQuery.refetchOnWindowFocus(#bool(false)),
        (),
      )
    })
  })

  results
}
