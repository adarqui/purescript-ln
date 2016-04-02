module LN.Api.Internal where



import LN.T.Prelude
import LN.Api.Prelude
import Network.HTTP.Affjax as AJ
import Data.Array (cons)



type ApiEff a = forall eff. Aff (ajax :: AJAX, console :: CONSOLE | eff) a



data By
  = ByOrgId String
  | ByOrgName String
  | ByUserId String
  | ByUserName String
  | ByForumId String
  | ByForumName String
  | ByBoardId String
  | ByBoardName String
  | ByThreadId String
  | ByThreadName String
  | ByThreadPostId String
  | ByThreadPostName String
  | ByResourceId String
  | ByResourceName String
  | ByLeuronId String
  | ByParentId String
  | ByParentName String

instance byShow :: Show By where
  show (ByOrgId s)          = "org_id=" <> s
  show (ByOrgName s)        = "org_name=" <> s
  show (ByUserId s)         = "user_id=" <> s
  show (ByUserName s)       = "user_name=" <> s
  show (ByForumId s)        = "forum_id=" <> s
  show (ByForumName s)      = "forum_name=" <> s
  show (ByBoardId s)        = "board_id=" <> s
  show (ByBoardName s)      = "board_name=" <> s
  show (ByThreadId s)       = "thread_id=" <> s
  show (ByThreadName s)     = "thread_name=" <> s
  show (ByThreadPostId s)   = "thread_post_id=" <> s
  show (ByThreadPostName s) = "thread_post_name=" <> s
  show (ByResourceId s)     = "resource_id=" <> s
  show (ByResourceName s)   = "resource_name=" <> s
  show (ByLeuronId s)       = "leuron_id=" <> s
  show (ByParentId s)       = "parent_id=" <> s
  show (ByParentName s)     = "parent_name=" <> s



data Param
  = ParLimit Int
  | ParOffset Int
  | ParOrderAsc
  | ParOrderDsc
  | ParOrderRand
  | ParOrderBy OrderBy

instance paramShow :: Show Param where
  show (ParLimit n)  = "limit=" <> show n
  show (ParOffset n) = "offset=" <> show n
  show ParOrderAsc    = "order=asc"
  show ParOrderDsc    = "order=dsc"
  show ParOrderRand   = "order=rand"

paramToTuple :: Param -> Tuple String String
paramToTuple (ParLimit n)  = Tuple "limit" (show n)
paramToTuple (ParOffset n) = Tuple "offset" (show n)
paramToTuple ParOrderAsc    = Tuple "order" "asc"
paramToTuple ParOrderDsc    = Tuple "order" "dsc"
paramToTuple ParOrderRand   = Tuple "order" "rand"



data OrderBy
  = OrderBy_UserId
  | OrderBy_CreatedAt
  | OrderBy_CreatedBy
  | OrderBy_ModifiedAt
  | OrderBy_ModifiedBy
  | OrderBy_OrganizationId
  | OrderBy_TeamId
  | OrderBy_ForumId
  | OrderBy_BoardId
  | OrderBy_ThreadId
  | OrderBy_Id
  | OrderBy_None

instance orderByShow :: Show OrderBy where
  show OrderBy_UserId = "user_id"
  show OrderBy_CreatedAt = "created_at"
  show OrderBy_CreatedBy = "created_by"
  show OrderBy_ModifiedAt = "modified_at"
  show OrderBy_ModifiedBy = "modified_by"
  show OrderBy_OrganizationId = "org_id"
  show OrderBy_TeamId     = "team_id"
  show OrderBy_ForumId    = "forum_id"
  show OrderBy_BoardId    = "board_id"
  show OrderBy_ThreadId   = "thread_id"
  show OrderBy_Id         = "id"
  show OrderBy_None       = "none"



apiPrefix :: String
apiPrefix = "api"



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



-- | getAt [Tuple "user_name" "adarqui"] (route ["users"])
--
postAt :: forall eff a b. (Respondable a, Requestable b)
        => Array (Tuple String String)
        -> Array By
        -> Array String
        -> b
        -> Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe a)
postAt params by paths body = do
    liftAff $ log "getAt"
    { response: response } <- AJ.post (routeQueryBy paths params by) body
    let r = fromResponse response
    case r of
         (Left err) -> do
           liftAff $ log $ ("error: " ++ show err)
           return Nothing
         (Right js) -> do
           liftAff $ log "success"
           return $ Just js
