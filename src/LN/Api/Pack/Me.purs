module LN.Api.Pack.Me where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T



getMePack :: ApiEff (Maybe UserPackResponse)
getMePack = getAt [] [] [mePackTag]
