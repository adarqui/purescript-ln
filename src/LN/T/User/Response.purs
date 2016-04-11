module LN.T.User.Response where



import LN.T.Prelude.Argonaut
import LN.T.User
import LN.T.DateMaybe


newtype UserResponse = UserResponse {
  id   :: UserId,
  nick :: String,
  displayNick :: String,
  name :: String,
  email :: String,
  emailMD5 :: String,
  plugin :: String,
  ident :: String,
  isActive :: Boolean,
  createdAt :: DateMaybe,
  modifiedAt :: DateMaybe,
  deactivatedAt :: DateMaybe
}

defaultUserResponse :: UserResponse
defaultUserResponse = mkUserResponse 0 "nick" "display_nick" "name" "email" "md5" "plugin" "ident" false defaultDateMaybe defaultDateMaybe defaultDateMaybe

mkUserResponse :: Int -> String -> String -> String -> String -> String -> String -> String -> Boolean -> DateMaybe -> DateMaybe -> DateMaybe -> UserResponse
mkUserResponse id nick displayNick name email emailMD5 plugin ident isActive createdAt modifiedAt deactivatedAt =
  UserResponse { id, nick, displayNick, name, email, emailMD5, plugin, ident, isActive, createdAt, modifiedAt, deactivatedAt }

instance encodeUserResponse :: EncodeJson UserResponse where
  encodeJson (UserResponse u) =
       "id"    := u.id
    ~> "nick"  := u.nick
    ~> "display_nick" := u.displayNick
    ~> "name" := u.name
    ~> "email" := u.email
    ~> "plugin" := u.plugin
    ~> "ident" := u.ident
    ~> "is_active" := u.isActive
    ~> "created_at" := toISOStringMaybe u.createdAt
    ~> "modified_at" := toISOStringMaybe u.modifiedAt
    ~> "deactivated_at" := toISOStringMaybe u.deactivatedAt
    ~> jsonEmptyObject

{-
instance decodeUserResponse :: DecodeJson UserResponse where
  decodeJson = gDecodeJson
-}
instance decodeUserResponse :: DecodeJson UserResponse where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "id"
    nick <- obj .? "nick"
    displayNick <- obj .? "display_nick"
    name <- obj .? "name"
    email <- obj .? "email"
    emailMD5 <- obj .? "email_md5"
    plugin <- obj .? "plugin"
    ident <- obj .? "ident"
    isActive <- obj .? "is_active"
    createdAt <- obj .? "created_at"
    modifiedAt <- obj .? "modified_at"
    deactivatedAt <- obj .? "deactivated_at"
    pure $ UserResponse {id, nick, displayNick, name, email, emailMD5, plugin, ident, isActive , createdAt, modifiedAt, deactivatedAt}

instance respondableUserResponse :: Respondable UserResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkUserResponse
      <$> readProp "id" json
      <*> readProp "nick" json
      <*> readProp "display_nick" json
      <*> readProp "name" json
      <*> readProp "email" json
      <*> readProp "email_md5" json
      <*> readProp "plugin" json
      <*> readProp "ident" json
      <*> readProp "is_active" json
      <*> readProp "created_at" json
      <*> readProp "modified_at" json
      <*> readProp "deactivated_at" json


instance requestableUserResponse :: Requestable UserResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignUserResponse :: IsForeign UserResponse where
  read f = mkUserResponse
    <$> readProp "id" f
    <*> readProp "nick" f
    <*> readProp "display_nick" f
    <*> readProp "name" f
    <*> readProp "email" f
    <*> readProp "email_md5" f
    <*> readProp "plugin" f
    <*> readProp "ident" f
    <*> readProp "is_active" f
    <*> readProp "created_at" f
    <*> readProp "modified_at" f
    <*> readProp "deactivated_at" f
