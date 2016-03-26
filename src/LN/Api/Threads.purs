module LN.Api.Thread where



import LN.T.Prelude
import LN.Api.Prelude
import Network.HTTP.Affjax as AJ
import LN.T.Thread.Response



getThreads :: forall eff. Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe ThreadResponses)
getThreads = do
    liftAff $ log "getThreads"
    { response: response } <- AJ.get "api/threads"
    let r = fromResponse response
    case r of
         (Left err) -> do
           liftAff $ log $ ("error: " ++ show err)
           return Nothing
         (Right js) -> do
           liftAff $ log "success"
           return $ Just js
