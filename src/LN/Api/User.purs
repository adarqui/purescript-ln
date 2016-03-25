module LN.Api.User where

import LN.T.Prelude
import LN.Api.Prelude
import Network.HTTP.Affjax as AJ
import LN.T.User.Response.Sanitized

getUsers :: forall eff. Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe UserResponsesSanitized)
getUsers = do
    liftAff $ log "getUsers"
    { response: response } <- AJ.get "api/users"
    let r = fromResponse response
    case r of
         (Left err) -> do
           liftAff $ log $ ("error: " ++ show err)
           return Nothing
         (Right js) -> do
           liftAff $ log "success"
           return $ Just js
