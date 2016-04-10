module LN.Api.Internal where



import LN.T.Prelude
import LN.Api.Prelude
import LN.T.Api
import LN.T.Param
import Network.HTTP.Affjax as AJ
import Data.Array (cons)



type ApiEff a = forall eff. Aff (ajax :: AJAX, console :: CONSOLE | eff) a



route :: Array String -> String
route paths = joinWith "/" (apiPrefix `cons` paths)



flattenParams :: Array (Tuple String String) -> Array String
flattenParams [] = []
flattenParams params = map (\(Tuple k v) -> k <> "=" <> v) params



mkQueryString :: Array String -> String
mkQueryString [] = ""
mkQueryString params = "?" <> joinWith "&" params



routeQueryBy :: Array String -> Array (Tuple String String) -> Array By -> String
routeQueryBy paths params by = route paths <> mkQueryString (by' <> flattenParams params)
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
    liftAff $ log ("getAt: " <> routeQueryBy paths params by)
    { response: response } <- AJ.get (routeQueryBy paths params by)
    let r = fromResponse response
    case r of
         (Left err) -> do
           liftAff $ log $ ("error: " ++ show err)
           return Nothing
         (Right js) -> do
           liftAff $ log "success"
           return $ Just js



-- | getAt [Tuple "user_name" "adarqui"] (route ["users"])
--
postAt :: forall eff a b. (Respondable a, Requestable b)
        => Array (Tuple String String)
        -> Array By
        -> Array String
        -> b
        -> Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe a)
postAt params by paths body = do
    liftAff $ log ("postAt: " <> routeQueryBy paths params by)
    { response: response } <- AJ.post (routeQueryBy paths params by) body
    let r = fromResponse response
    case r of
         (Left err) -> do
           liftAff $ log $ ("error: " ++ show err)
           return Nothing
         (Right js) -> do
           liftAff $ log "success"
           return $ Just js
