module LN.Api.Me where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T



getMe :: ApiEff (Maybe UserPackResponse)
getMe = getAt [] [] [meTag]
