module LN.T.Pack.Me where



import LN.T.Prelude.Argonaut
import LN.T.User
import LN.T.User.Response
import LN.T.User.Sanitized.Stat
import LN.T.Profile
import LN.T.Profile.Response
import LN.T.DateMaybe



mePackTag :: String
mePackTag = "me_pack"



mesPacksTag :: String
mesPacksTag = "mes_packs"



newtype MePackResponse = MePackResponse {
  user :: UserResponse,
  userStat :: UserSanitizedStatResponse,
  userProfile :: ProfileResponse
}



_MePackResponse :: LensP MePackResponse {
    user :: UserResponse,
    userStat :: UserSanitizedStatResponse,
    userProfile :: ProfileResponse
  }
_MePackResponse f (MePackResponse o) = MePackResponse <$> f o



defaultMePackResponse :: MePackResponse
defaultMePackResponse =
  mkMePackResponse defaultUserResponse defaultUserSanitizedStatResponse defaultProfileResponse



mkMePackResponse :: UserResponse -> UserSanitizedStatResponse -> ProfileResponse -> MePackResponse
mkMePackResponse user userStat userProfile =
  MePackResponse {user, userStat, userProfile}




instance encodeMePackResponse :: EncodeJson MePackResponse where
  encodeJson (MePackResponse o) =
       "user"         := o.user
    ~> "user_stat"    := o.userStat
    ~> "user_profile" := o.userProfile
    ~> jsonEmptyObject



instance decodeMePackResponse :: DecodeJson MePackResponse where
  decodeJson json = do
    obj <- decodeJson json
    user <- obj .? "user"
    userStat <- obj .? "user_stat"
    userProfile <- obj .? "user_profile"
    pure $ MePackResponse {user, userStat, userProfile}




instance respondableMePackResponse :: Respondable MePackResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse f =
    mkMePackResponse
      <$> readProp "user" f
      <*> readProp "user_stat" f
      <*> readProp "user_profile" f



instance requestableMePackResponse :: Requestable MePackResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignMePackResponse :: IsForeign MePackResponse where
  read f = mkMePackResponse
    <$> readProp "user" f
    <*> readProp "user_stat" f
    <*> readProp "user_profile" f




newtype MePackResponses = MePackResponses {
  mesPacks :: Array MePackResponse
}

defaultMePackResponses :: MePackResponses
defaultMePackResponses = mkMePackResponses

mkMePackResponses :: MePackResponses
mkMePackResponses = MePackResponses { mesPacks: [] }

instance encodeMePackResponses :: EncodeJson MePackResponses where
  encodeJson (MePackResponses o) =
       mesPacksTag  := o.mesPacks
    ~> jsonEmptyObject

instance decodeMePackResponses :: DecodeJson MePackResponses where
  decodeJson json = do
    obj <- decodeJson json
    mesPacks <- obj .? mesPacksTag
    pure $ MePackResponses { mesPacks: mesPacks }

instance respondableMePackResponses :: Respondable MePackResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    mesPacks <- readProp mesPacksTag json
    pure $ MePackResponses { mesPacks: mesPacks }

instance requestableMePackResponses :: Requestable MePackResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignMePackResponses :: IsForeign MePackResponses where
  read f = do
    mesPacks <- readProp mesPacksTag f
    pure $ MePackResponses { mesPacks: mesPacks }
