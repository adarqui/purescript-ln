module LN.T.User.Sanitized.Stat where



import LN.T.Prelude.Argonaut
import LN.T.User



newtype UserSanitizedStatResponse = UserSanitizedStatResponse {
  userId   :: UserId,
  threads :: Int,
  threadPosts :: Int,
  respect :: Int,
  resources :: Int,
  leurons :: Int,
  workouts :: Int
}

_UserSanitizedStatResponse :: LensP UserSanitizedStatResponse {
    userId   :: UserId,
    threads :: Int,
    threadPosts :: Int,
    respect :: Int,
    resources :: Int,
    leurons :: Int,
    workouts :: Int
  }
_UserSanitizedStatResponse f (UserSanitizedStatResponse o) = UserSanitizedStatResponse <$> f o



defaultUserSanitizedStatResponse :: UserSanitizedStatResponse
defaultUserSanitizedStatResponse = mkUserSanitizedStatResponse 0 0 0 0 0 0 0



mkUserSanitizedStatResponse :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> UserSanitizedStatResponse
mkUserSanitizedStatResponse userId threads threadPosts respect resources leurons workouts =
  UserSanitizedStatResponse { userId, threads, threadPosts, respect, resources, leurons, workouts }



instance encodeUserSanitizedStatResponse :: EncodeJson UserSanitizedStatResponse where
  encodeJson (UserSanitizedStatResponse o) =
       "user_id"      := o.userId
    ~> "threads"      := o.threads
    ~> "thread_posts" := o.threadPosts
    ~> "respect"      := o.respect
    ~> "resources"    := o.resources
    ~> "leurons"      := o.leurons
    ~> "workouts"     := o.workouts
    ~> jsonEmptyObject



instance decodeUserSanitizedStatResponse :: DecodeJson UserSanitizedStatResponse where
  decodeJson json = do
    obj <- decodeJson json
    userId <- obj .? "user_id"
    threads <- obj .? "threads"
    threadPosts <- obj .? "thread_posts"
    respect <- obj .? "respect"
    resources <- obj .? "resources"
    leurons <- obj .? "leurons"
    workouts <- obj .? "workouts"
    pure $ UserSanitizedStatResponse {userId, threads, threadPosts, respect, resources, leurons, workouts}



instance respondableUserSanitizedStatResponse :: Respondable UserSanitizedStatResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkUserSanitizedStatResponse
      <$> readProp "user_id" json
      <*> readProp "threads" json
      <*> readProp "thread_posts" json
      <*> readProp "respect" json
      <*> readProp "resources" json
      <*> readProp "leurons" json
      <*> readProp "workouts" json



instance requestableUserSanitizedStatResponse :: Requestable UserSanitizedStatResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignUserSanitizedStatResponse :: IsForeign UserSanitizedStatResponse where
  read f = mkUserSanitizedStatResponse
    <$> readProp "user_id" f
    <*> readProp "threads" f
    <*> readProp "thread_posts" f
    <*> readProp "respect" f
    <*> readProp "resources" f
    <*> readProp "leurons" f
    <*> readProp "workouts" f









newtype UserSanitizedStatResponses = UserSanitizedStatResponses {
  usersStats :: Array UserSanitizedStatResponse
}

_UserSanitizedStatResponses :: LensP UserSanitizedStatResponses {
    usersStats :: Array UserSanitizedStatResponse
  }
_UserSanitizedStatResponses f (UserSanitizedStatResponses o) = UserSanitizedStatResponses <$> f o



defaultUserSanitizedStatResponses :: UserSanitizedStatResponses
defaultUserSanitizedStatResponses = mkUserSanitizedStatResponses



mkUserSanitizedStatResponses :: UserSanitizedStatResponses
mkUserSanitizedStatResponses = UserSanitizedStatResponses { usersStats: [] }



instance encodeUserSanitizedStatResponses :: EncodeJson UserSanitizedStatResponses where
  encodeJson (UserSanitizedStatResponses u) =
       "users_stats"    := u.usersStats
    ~> jsonEmptyObject



instance decodeUserSanitizedStatResponses :: DecodeJson UserSanitizedStatResponses where
  decodeJson json = do
    obj <- decodeJson json
    usersStats <- obj .? "users_stats"
    pure $ UserSanitizedStatResponses { usersStats: usersStats }



instance respondableUserSanitizedStatResponses :: Respondable UserSanitizedStatResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    usersStats <- readProp "users_stats" json
    pure $ UserSanitizedStatResponses { usersStats: usersStats }



instance requestableUserSanitizedStatResponses :: Requestable UserSanitizedStatResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignUserSanitizedStatResponses :: IsForeign UserSanitizedStatResponses where
  read f = do
    usersStats <- readProp "users_stats" f
    pure $ UserSanitizedStatResponses { usersStats: usersStats }
