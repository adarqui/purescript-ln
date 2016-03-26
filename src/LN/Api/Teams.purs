module LN.Api.Team where



import LN.T.Prelude
import LN.Api.Prelude
import Network.HTTP.Affjax as AJ
import LN.T.Team.Response



getTeams :: forall eff. Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe TeamResponses)
getTeams = do
    liftAff $ log "getTeams"
    { response: response } <- AJ.get "api/teams"
    let r = fromResponse response
    case r of
         (Left err) -> do
           liftAff $ log $ ("error: " ++ show err)
           return Nothing
         (Right js) -> do
           liftAff $ log "success"
           return $ Just js



getTeam :: forall eff. Int -> Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe TeamResponse)
getTeam team_id = do
    liftAff $ log "getTeam"
    { response: response } <- AJ.get ("api/teams/" <> show team_id)
    let r = fromResponse response
    case r of
         (Left err) -> do
           liftAff $ log $ ("error: " ++ show err)
           return Nothing
         (Right js) -> do
           liftAff $ log "success"
           return $ Just js
