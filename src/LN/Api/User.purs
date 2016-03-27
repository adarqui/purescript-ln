module LN.Api.User where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.User
import LN.T.User.Response.Sanitized



getUsers :: ApiEff (Maybe UserResponsesSanitized)
getUsers = getAt [] [] [usersTag]



getUser :: String -> ApiEff (Maybe UserResponseSanitized)
getUser user = getAt [] [] [usersTag, user]
