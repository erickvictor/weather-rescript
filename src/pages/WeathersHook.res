let { queryOptions, useQuery } = module(ReactQuery)

let apiUrl = "https://api.openweathermap.org/data/2.5"
let apiCodec = JsonCodec.codec

let handleFetch = _ => {
  open Promise
  Fetch.fetch(
    `${apiUrl}/weather?q=manaus&appid=5b1421952c2d687b216bb5325f5e9cb4&units=metric&lang=pt_br`,
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
      ~queryFn=handleFetch,
      ~refetchOnWindowFocus=ReactQuery.refetchOnWindowFocus(#bool(false)),
      (),
    ),
  )

  switch result {
    | { isLoading: true } => Loading
    | { isError: true } 
    | { data: Some(Error(_)) } => Error
    | { data: Some(Ok(weather)), isLoading: false, isError: false  } => Data(weather)
    | _ => Error
  }
}
