module LN.T.Pack.User where



import LN.T.Prelude.Argonaut
import LN.T.User
import LN.T.User.Sanitized.Response
import LN.T.User.Sanitized.Stat
import LN.T.Profile
import LN.T.Profile.Response
import LN.T.DateMaybe



userPackTag :: String
userPackTag = "user_pack"



usersPacksTag :: String
usersPacksTag = "users_packs"



newtype UserPackResponse = UserPackResponse {
  user :: UserSanitizedResponse,
  userStat :: UserSanitizedStatResponse,
  userProfile :: ProfileResponse
}



_UserPackResponse :: LensP UserPackResponse {
    user :: UserSanitizedResponse,
    userStat :: UserSanitizedStatResponse,
    userProfile :: ProfileResponse
  }
_UserPackResponse f (UserPackResponse o) = UserPackResponse <$> f o



defaultUserPackResponse :: UserPackResponse
defaultUserPackResponse =
  mkUserPackResponse defaultUserSanitizedResponse defaultUserSanitizedStatResponse defaultProfileResponse



mkUserPackResponse :: UserSanitizedResponse -> UserSanitizedStatResponse -> ProfileResponse -> UserPackResponse
mkUserPackResponse user userStat userProfile =
  UserPackResponse {user, userStat, userProfile}




instance encodeUserPackResponse :: EncodeJson UserPackResponse where
  encodeJson (UserPackResponse o) =
       "user"         := o.user
    ~> "user_stat"    := o.userStat
    ~> "user_profile" := o.userProfile
    ~> jsonEmptyObject



instance decodeUserPackResponse :: DecodeJson UserPackResponse where
  decodeJson json = do
    obj <- decodeJson json
    user <- obj .? "user"
    userStat <- obj .? "user_stat"
    userProfile <- obj .? "user_profile"
    pure $ UserPackResponse {user, userStat, userProfile}




instance respondableUserPackResponse :: Respondable UserPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse f =
    mkUserPackResponse
      <$> readProp "user" f
      <*> readProp "user_stat" f
      <*> readProp "user_profile" f



instance requestableUserPackResponse :: Requestable UserPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignUserPackResponse :: IsForeign UserPackResponse where
  read f = mkUserPackResponse
    <$> readProp "user" f
    <*> readProp "user_stat" f
    <*> readProp "user_profile" f




newtype UserPackResponses = UserPackResponses {
  usersPacks :: Array UserPackResponse
}

defaultUserPackResponses :: UserPackResponses
defaultUserPackResponses = mkUserPackResponses

mkUserPackResponses :: UserPackResponses
mkUserPackResponses = UserPackResponses { usersPacks: [] }

instance encodeUserPackResponses :: EncodeJson UserPackResponses where
  encodeJson (UserPackResponses o) =
       usersPacksTag  := o.usersPacks
    ~> jsonEmptyObject

instance decodeUserPackResponses :: DecodeJson UserPackResponses where
  decodeJson json = do
    obj <- decodeJson json
    usersPacks <- obj .? usersPacksTag
    pure $ UserPackResponses { usersPacks: usersPacks }

instance respondableUserPackResponses :: Respondable UserPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    usersPacks <- readProp usersPacksTag json
    pure $ UserPackResponses { usersPacks: usersPacks }

instance requestableUserPackResponses :: Requestable UserPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignUserPackResponses :: IsForeign UserPackResponses where
  read f = do
    usersPacks <- readProp usersPacksTag f
    pure $ UserPackResponses { usersPacks: usersPacks }
