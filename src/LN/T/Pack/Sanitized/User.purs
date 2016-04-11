module LN.T.Pack.Sanitized.User where



import LN.T.Prelude.Argonaut
import LN.T.User
import LN.T.User.Sanitized.Response
import LN.T.User.Sanitized.Stat
import LN.T.Profile
import LN.T.Profile.Response
import LN.T.DateMaybe



userSanitizedPackTag :: String
userSanitizedPackTag = "user_pack"



usersSanitizedPacksTag :: String
usersSanitizedPacksTag = "users_packs"



newtype UserSanitizedPackResponse = UserSanitizedPackResponse {
  user :: UserSanitizedResponse,
  userStat :: UserSanitizedStatResponse,
  userProfile :: ProfileResponse
}



_UserSanitizedPackResponse :: LensP UserSanitizedPackResponse {
    user :: UserSanitizedResponse,
    userStat :: UserSanitizedStatResponse,
    userProfile :: ProfileResponse
  }
_UserSanitizedPackResponse f (UserSanitizedPackResponse o) = UserSanitizedPackResponse <$> f o



defaultUserSanitizedPackResponse :: UserSanitizedPackResponse
defaultUserSanitizedPackResponse =
  mkUserSanitizedPackResponse defaultUserSanitizedResponse defaultUserSanitizedStatResponse defaultProfileResponse



mkUserSanitizedPackResponse :: UserSanitizedResponse -> UserSanitizedStatResponse -> ProfileResponse -> UserSanitizedPackResponse
mkUserSanitizedPackResponse user userStat userProfile =
  UserSanitizedPackResponse {user, userStat, userProfile}




instance encodeUserSanitizedPackResponse :: EncodeJson UserSanitizedPackResponse where
  encodeJson (UserSanitizedPackResponse o) =
       "user"         := o.user
    ~> "user_stat"    := o.userStat
    ~> "user_profile" := o.userProfile
    ~> jsonEmptyObject



instance decodeUserSanitizedPackResponse :: DecodeJson UserSanitizedPackResponse where
  decodeJson json = do
    obj <- decodeJson json
    user <- obj .? "user"
    userStat <- obj .? "user_stat"
    userProfile <- obj .? "user_profile"
    pure $ UserSanitizedPackResponse {user, userStat, userProfile}




instance respondableUserSanitizedPackResponse :: Respondable UserSanitizedPackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse f =
    mkUserSanitizedPackResponse
      <$> readProp "user" f
      <*> readProp "user_stat" f
      <*> readProp "user_profile" f



instance requestableUserSanitizedPackResponse :: Requestable UserSanitizedPackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignUserSanitizedPackResponse :: IsForeign UserSanitizedPackResponse where
  read f = mkUserSanitizedPackResponse
    <$> readProp "user" f
    <*> readProp "user_stat" f
    <*> readProp "user_profile" f




newtype UserSanitizedPackResponses = UserSanitizedPackResponses {
  usersSanitizedPacks :: Array UserSanitizedPackResponse
}

defaultUserSanitizedPackResponses :: UserSanitizedPackResponses
defaultUserSanitizedPackResponses = mkUserSanitizedPackResponses

mkUserSanitizedPackResponses :: UserSanitizedPackResponses
mkUserSanitizedPackResponses = UserSanitizedPackResponses { usersSanitizedPacks: [] }

instance encodeUserSanitizedPackResponses :: EncodeJson UserSanitizedPackResponses where
  encodeJson (UserSanitizedPackResponses o) =
       usersSanitizedPacksTag  := o.usersSanitizedPacks
    ~> jsonEmptyObject

instance decodeUserSanitizedPackResponses :: DecodeJson UserSanitizedPackResponses where
  decodeJson json = do
    obj <- decodeJson json
    usersSanitizedPacks <- obj .? usersSanitizedPacksTag
    pure $ UserSanitizedPackResponses { usersSanitizedPacks: usersSanitizedPacks }

instance respondableUserSanitizedPackResponses :: Respondable UserSanitizedPackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    usersSanitizedPacks <- readProp usersSanitizedPacksTag json
    pure $ UserSanitizedPackResponses { usersSanitizedPacks: usersSanitizedPacks }

instance requestableUserSanitizedPackResponses :: Requestable UserSanitizedPackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignUserSanitizedPackResponses :: IsForeign UserSanitizedPackResponses where
  read f = do
    usersSanitizedPacks <- readProp usersSanitizedPacksTag f
    pure $ UserSanitizedPackResponses { usersSanitizedPacks: usersSanitizedPacks }
