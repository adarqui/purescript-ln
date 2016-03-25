module LN.T.User.Response.Sanitized where



import LN.T.Prelude.Argonaut
import LN.T.User
-- import LN.T.Date
import LN.T.DateMaybe


newtype UserResponseSanitized = UserResponseSanitized {
  id   :: UserId,
  nick :: String,
  displayNick :: String,
  isActive :: Boolean,
  createdAt :: DateMaybe
}

defaultUserResponseSanitized :: UserResponseSanitized
defaultUserResponseSanitized = mkUserResponseSanitized 0 "nick" "display_nick" false defaultDate

mkUserResponseSanitized :: Int -> String -> String -> Boolean -> DateMaybe -> UserResponseSanitized
mkUserResponseSanitized id nick displayNick isActive createdAt =
  UserResponseSanitized { id, nick, displayNick, isActive, createdAt }

{-
_UserResponseSanitized :: LensP UserResponseSanitized { id :: Int, nick :: String }
_UserResponseSanitized f (UserResponseSanitized o) = UserResponseSanitized <$> f o

_id :: forall b a r. Lens { id :: a | r } { id :: b | r } a b
_id f o = o { id = _ } <$> f o.id

_nick :: forall b a r. Lens { nick :: a | r } { nick :: b | r } a b
_nick f o = o { nick = _ } <$> f o.nick
-}

instance encodeUserResponseSanitized :: EncodeJson UserResponseSanitized where
  encodeJson (UserResponseSanitized u) =
       "id"    := u.id
    ~> "nick"  := u.nick
    ~> "display_nick" := u.displayNick
    ~> "is_active" := u.isActive
    ~> "created_at" := toISOString u.createdAt
    ~> jsonEmptyObject

instance decodeUserResponseSanitized :: DecodeJson UserResponseSanitized where
  decodeJson json = do
    obj <- decodeJson json
    id <- obj .? "id"
    nick <- obj .? "nick"
    displayNick <- obj .? "display_nick"
    isActive <- obj .? "is_active"
    createdAt <- obj .? "created_at"
    pure $ UserResponseSanitized {id, nick, displayNick, isActive, createdAt}

instance respondableUserResponseSanitized :: Respondable UserResponseSanitized where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkUserResponseSanitized
      <$> readProp "id" json
      <*> readProp "nick" json
      <*> readProp "display_nick" json
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
       "users"    := u.users
    ~> jsonEmptyObject

instance decodeUserResponsesSanitized :: DecodeJson UserResponsesSanitized where
  decodeJson json = do
    obj <- decodeJson json
    users <- obj .? "users"
    pure $ UserResponsesSanitized { users: users }

instance respondableUserResponsesSanitized :: Respondable UserResponsesSanitized where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    users <- readProp "users" json
    pure $ UserResponsesSanitized { users: users }

instance requestableUserResponsesSanitized :: Requestable UserResponsesSanitized where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignUserResponsesSanitized :: IsForeign UserResponsesSanitized where
  read f = do
    users <- readProp "users" f
    pure $ UserResponsesSanitized { users: users }
