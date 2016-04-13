module LN.T.User.Sanitized.Response where



import LN.T.Prelude.Argonaut
import LN.T.User
import LN.T.DateMaybe


newtype UserSanitizedResponse = UserSanitizedResponse {
  id   :: UserId,
  nick :: String,
  displayNick :: String,
  emailMD5 :: String,
  active :: Boolean,
  createdAt :: DateMaybe
}

_UserSanitizedResponse :: LensP UserSanitizedResponse {
    id   :: UserId,
    nick :: String,
    displayNick :: String,
    emailMD5 :: String,
    active :: Boolean,
    createdAt :: DateMaybe
  }
_UserSanitizedResponse f (UserSanitizedResponse o) = UserSanitizedResponse <$> f o



defaultUserSanitizedResponse :: UserSanitizedResponse
defaultUserSanitizedResponse = mkUserSanitizedResponse 0 "nick" "display_nick" "md5" false defaultDateMaybe



mkUserSanitizedResponse :: Int -> String -> String -> String -> Boolean -> DateMaybe -> UserSanitizedResponse
mkUserSanitizedResponse id nick displayNick emailMD5 active createdAt =
  UserSanitizedResponse { id, nick, displayNick, emailMD5, active, createdAt }



instance encodeUserSanitizedResponse :: EncodeJson UserSanitizedResponse where
  encodeJson (UserSanitizedResponse u) =
       "id"    := u.id
    ~> "nick"  := u.nick
    ~> "display_nick" := u.displayNick
    ~> "email_md5" := u.emailMD5
    ~> "active" := u.active
    ~> "created_at" := toISOStringMaybe u.createdAt
    ~> jsonEmptyObject



instance decodeUserSanitizedResponse :: DecodeJson UserSanitizedResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "id"
    nick <- obj .? "nick"
    displayNick <- obj .? "display_nick"
    emailMD5 <- obj .? "email_md5"
    active <- obj .? "active"
    createdAt <- obj .? "created_at"
    pure $ UserSanitizedResponse {id, nick, displayNick, emailMD5, active, createdAt}



instance respondableUserSanitizedResponse :: Respondable UserSanitizedResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkUserSanitizedResponse
      <$> readProp "id" json
      <*> readProp "nick" json
      <*> readProp "display_nick" json
      <*> readProp "email_md5" json
      <*> readProp "active" json
      <*> readProp "created_at" json



instance requestableUserSanitizedResponse :: Requestable UserSanitizedResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignUserSanitizedResponse :: IsForeign UserSanitizedResponse where
  read f = mkUserSanitizedResponse
    <$> readProp "id" f
    <*> readProp "nick" f
    <*> readProp "display_nick" f
    <*> readProp "email_md5" f
    <*> readProp "active" f
    <*> readProp "created_at" f









newtype UserSanitizedResponses = UserSanitizedResponses {
  users :: Array UserSanitizedResponse
}

_UserSanitizedResponses :: LensP UserSanitizedResponses {
    users :: Array UserSanitizedResponse
  }
_UserSanitizedResponses f (UserSanitizedResponses o) = UserSanitizedResponses <$> f o



defaultUserSanitizedResponses :: UserSanitizedResponses
defaultUserSanitizedResponses = mkUserSanitizedResponses



mkUserSanitizedResponses :: UserSanitizedResponses
mkUserSanitizedResponses = UserSanitizedResponses { users: [] }



instance encodeUserSanitizedResponses :: EncodeJson UserSanitizedResponses where
  encodeJson (UserSanitizedResponses u) =
       "users_sanitized"    := u.users
    ~> jsonEmptyObject



instance decodeUserSanitizedResponses :: DecodeJson UserSanitizedResponses where
  decodeJson json = do
    obj <- decodeJson json
    users <- obj .? "users_sanitized"
    pure $ UserSanitizedResponses { users: users }



instance respondableUserSanitizedResponses :: Respondable UserSanitizedResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    users <- readProp "users_sanitized" json
    pure $ UserSanitizedResponses { users: users }



instance requestableUserSanitizedResponses :: Requestable UserSanitizedResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignUserSanitizedResponses :: IsForeign UserSanitizedResponses where
  read f = do
    users <- readProp "users_sanitized" f
    pure $ UserSanitizedResponses { users: users }
