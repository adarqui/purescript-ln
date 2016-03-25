module LN.Api.Forum where



import LN.T.Prelude
import LN.Api.Prelude
import Network.HTTP.Affjax as AJ
import LN.T.Forum.Response



getForums :: forall eff. Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe ForumResponses)
getForums = do
    liftAff $ log "getForums"
    { response: response } <- AJ.get "api/forums"
    let r = fromResponse response
    case r of
         (Left err) -> do
           liftAff $ log $ ("error: " ++ show err)
           return Nothing
         (Right js) -> do
           liftAff $ log "success"
           return $ Just js
