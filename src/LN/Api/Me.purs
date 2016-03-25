module LN.Api.Me where

import LN.T.Prelude
import LN.Api.Prelude
import Network.HTTP.Affjax as AJ
import LN.T.User.Response

getMe :: forall eff. Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe UserResponse)
getMe = do
    liftAff $ log "getMe"
    { response: response } <- AJ.get "api/me"
    let r = fromResponse response
    case r of
         (Left err) -> do
           liftAff $ log $ ("error: " ++ show err)
           return Nothing
         (Right js) -> do
           liftAff $ log "success"
           return $ Just js
