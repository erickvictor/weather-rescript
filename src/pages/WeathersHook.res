let { queryOptions, useQuery, useQueries } = module(ReactQuery)

let cidades = [
  `Rio de Janeiro`,
  `São Paulo`,
  `Belo Horizonte`,
  `Brasília`,
  `Belém`,
  `Salvador`,
  `Curitiba`,
  `Fortaleza`,
  `Manaus`,
  `João Pessoa`
]


let apiUrl = "https://api.openweathermap.org/data/2.5"
let apiCodec = JsonCodec.codec

let handleFetch = (~city) => {
  open Promise
  Fetch.fetch(
    `${apiUrl}/weather?q=${city}&appid=5b1421952c2d687b216bb5325f5e9cb4&units=metric&lang=pt_br`,
    {"method": "GET"},
  )->then(response => Fetch.json(response)
  )->thenResolve(json => Jzon.decodeWith(json, apiCodec))

}

type requestResult = 
  | Data(JsonCodec.t)
  | Loading
  | Error

let useWeather = () => {
  let result = useQuery(
    queryOptions(
      ~queryKey="weather",
      ~queryFn={_ => handleFetch(~city="manaus")},
      ~refetchOnWindowFocus=ReactQuery.refetchOnWindowFocus(#bool(false)),
      (),
    ),
  )

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

  Js.log2("results",results)

  switch result {
    | { isLoading: true } => Loading
    | { isError: true } 
    | { data: Some(Error(_)) } => Error
    | { data: Some(Ok(weather)), isLoading: false, isError: false  } => Data(weather)
    | _ => Error
  }
}
