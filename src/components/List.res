open Ancestor.Default

@react.component
let make = () => {
  <Base tag=#ul p=[xs(0)]>
    <Base tag=#li listStyleType=[#xs(#none)] fontWeight=[#xs(#bold)] mb=[#xs(1)]>
      {`18º 27º Rio de Janeiro`->React.string}
    </Base>
    <Base tag=#li listStyleType=[#xs(#none)] fontWeight=[#xs(#bold)] mb=[#xs(1)]>
      {`14º 22º São Paulo`->React.string}
    </Base>
    <Base tag=#li listStyleType=[#xs(#none)] fontWeight=[#xs(#bold)] mb=[#xs(1)]>
      {`21º 32º Belo Horizonte`->React.string}
    </Base>
    <Base tag=#li listStyleType=[#xs(#none)] fontWeight=[#xs(#bold)] mb=[#xs(1)]>
      {`24º 37º Brasília`->React.string}
    </Base>
  </Base>
}