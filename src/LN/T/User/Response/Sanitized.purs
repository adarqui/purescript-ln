module LN.T.User.Response.Sanitized where



import LN.T.Prelude.Argonaut
import LN.T.User
import LN.T.DateMaybe


newtype UserResponseSanitized = UserResponseSanitized {
  id   :: UserId,
  nick :: String,
  displayNick :: String,
  emailMD5 :: String,
  isActive :: Boolean,
  createdAt :: DateMaybe
}

defaultUserResponseSanitized :: UserResponseSanitized
defaultUserResponseSanitized = mkUserResponseSanitized 0 "nick" "display_nick" "md5" false defaultDate

mkUserResponseSanitized :: Int -> String -> String -> String -> Boolean -> DateMaybe -> UserResponseSanitized
mkUserResponseSanitized id nick displayNick emailMD5 isActive createdAt =
  UserResponseSanitized { id, nick, displayNick, emailMD5, isActive, createdAt }

instance encodeUserResponseSanitized :: EncodeJson UserResponseSanitized where
  encodeJson (UserResponseSanitized u) =
       "id"    := u.id
    ~> "nick"  := u.nick
    ~> "display_nick" := u.displayNick
    ~> "email_md5" := u.emailMD5
    ~> "is_active" := u.isActive
    ~> "created_at" := toISOString u.createdAt
    ~> jsonEmptyObject

instance decodeUserResponseSanitized :: DecodeJson UserResponseSanitized where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "id"
    nick <- obj .? "nick"
    displayNick <- obj .? "display_nick"
    emailMD5 <- obj .? "email_md5"
    isActive <- obj .? "is_active"
    createdAt <- obj .? "created_at"
    pure $ UserResponseSanitized {id, nick, displayNick, emailMD5, isActive, createdAt}

instance respondableUserResponseSanitized :: Respondable UserResponseSanitized where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkUserResponseSanitized
      <$> readProp "id" json
      <*> readProp "nick" json
      <*> readProp "display_nick" json
      <*> readProp "email_md5" json
      <*> readProp "is_active" json
      <*> readProp "created_at" json


instance requestableUserResponseSanitized :: Requestable UserResponseSanitized where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignUserResponseSanitized :: IsForeign UserResponseSanitized where
  read f = mkUserResponseSanitized
    <$> readProp "id" f
    <*> readProp "nick" f
    <*> readProp "display_nick" f
    <*> readProp "email_md5" f
    <*> readProp "is_active" f
    <*> readProp "created_at" f









newtype UserResponsesSanitized = UserResponsesSanitized {
  users :: Array UserResponseSanitized
}

defaultUserResponsesSanitized :: UserResponsesSanitized
defaultUserResponsesSanitized = mkUserResponsesSanitized

mkUserResponsesSanitized :: UserResponsesSanitized
mkUserResponsesSanitized = UserResponsesSanitized { users: [] }

instance encodeUserResponsesSanitized :: EncodeJson UserResponsesSanitized where
  encodeJson (UserResponsesSanitized u) =
       "users_sanitized"    := u.users
    ~> jsonEmptyObject

instance decodeUserResponsesSanitized :: DecodeJson UserResponsesSanitized where
  decodeJson json = do
    obj <- decodeJson json
    users <- obj .? "users_sanitized"
    pure $ UserResponsesSanitized { users: users }

instance respondableUserResponsesSanitized :: Respondable UserResponsesSanitized where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    users <- readProp "users_sanitized" json
    pure $ UserResponsesSanitized { users: users }

instance requestableUserResponsesSanitized :: Requestable UserResponsesSanitized where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignUserResponsesSanitized :: IsForeign UserResponsesSanitized where
  read f = do
    users <- readProp "users_sanitized" f
    pure $ UserResponsesSanitized { users: users }
