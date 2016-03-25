module LN.Api.Board where



import LN.T.Prelude
import LN.Api.Prelude
import Network.HTTP.Affjax as AJ
import LN.T.Board.Response



getBoards :: forall eff. Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe BoardResponses)
getBoards = do
    liftAff $ log "getBoards"
    { response: response } <- AJ.get "api/boards"
    let r = fromResponse response
    case r of
         (Left err) -> do
           liftAff $ log $ ("error: " ++ show err)
           return Nothing
         (Right js) -> do
           liftAff $ log "success"
           return $ Just js
