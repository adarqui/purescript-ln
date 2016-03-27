module LN.Api.Me where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Me
import LN.T.User.Response



getMe :: ApiEff (Maybe UserResponse)
getMe = getAt [] [] [meTag]
