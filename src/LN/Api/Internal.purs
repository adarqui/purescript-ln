module LN.Api.Internal where



import LN.T.Prelude
import LN.Api.Prelude
import Network.HTTP.Affjax as AJ
import Data.Array (cons)



type ApiEff a = forall eff. Aff (ajax :: AJAX, console :: CONSOLE | eff) a
type ApiEffP a = Aff (ajax :: AJAX, console :: CONSOLE) a



data By
  = ByOrgId String
  | ByOrgName String
  | ByUserId String
  | ByUserName String

instance byShow :: Show By where
  show (ByOrgId s) = "org_id=" <> s
  show (ByOrgName s) = "org_name=" <> s
  show (ByUserId s) = "user_id=" <> s
  show (ByUserName s) = "user_name=" <> s



apiPrefix :: String
apiPrefix = "api"



route :: Array String -> String
route paths = joinWith "/" (apiPrefix `cons` paths)



flattenParams :: Array (Tuple String String) -> Array String
flattenParams [] = []
flattenParams params = map (\(Tuple k v) -> k <> "=" <> v) params
-- query params = joinWith "&" ("?" `cons` (map (\(Tuple k v) -> k <> "=" <> v) params))



query :: Array String -> String
query [] = ""
query params = joinWith "&" ("?" `cons` params)



routeQueryBy :: Array String -> Array (Tuple String String) -> Array By -> String
routeQueryBy paths params by = route paths <> query (by' <> flattenParams params)
  where
  by' = map show by



-- | getAt [Tuple "user_name" "adarqui"] (route ["users"])
--
getAt :: forall eff a.
           Respondable a
        => Array (Tuple String String)
        -> Array By
        -> Array String
        -> Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe a)
getAt params by paths = do
    liftAff $ log "getAt"
    { response: response } <- AJ.get (routeQueryBy paths params by)
    let r = fromResponse response
    case r of
         (Left err) -> do
           liftAff $ log $ ("error: " ++ show err)
           return Nothing
         (Right js) -> do
           liftAff $ log "success"
           return $ Just js
