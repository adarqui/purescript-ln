module LN.Api.Organization where



import LN.T.Prelude
import LN.Api.Prelude
import Network.HTTP.Affjax as AJ
import LN.T.Organization.Response



getOrganizations :: forall eff. Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe OrganizationResponses)
getOrganizations = do
    liftAff $ log "getOrganizations"
    { response: response } <- AJ.get "api/orgs"
    let r = fromResponse response
    case r of
         (Left err) -> do
           liftAff $ log $ ("error: " ++ show err)
           return Nothing
         (Right js) -> do
           liftAff $ log "success"
           return $ Just js
