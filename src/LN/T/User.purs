module LN.T.User where

import LN.T.Prelude.Argonaut

-- import LN.T.Id
-- import LN.T.Timestamp



type UserId = Int


userTag :: String
userTag = "user"



usersTag :: String
usersTag = "users"



userSanitizedTag :: String
userSanitizedTag = "user_sanitized"



usersSanitizedTag :: String
usersSanitizedTag = "users_sanitized"



newtype UserRequest = UserRequest {
  nick :: String
}

derive instance genericUserRequest :: Generic UserRequest

instance showUserRequest :: Show UserRequest where
  show = gShow

defaultUserRequest :: UserRequest
defaultUserRequest = mkUserRequest "empty"

mkUserRequest :: String -> UserRequest
mkUserRequest n = UserRequest { nick: n }

_UserRequest :: LensP UserRequest { nick :: String }
_UserRequest f (UserRequest o) = UserRequest <$> f o

_nick :: forall b a r. Lens { nick :: a | r } { nick :: b | r } a b
_nick f o = o { nick = _ } <$> f o.nick

instance encodeUser :: EncodeJson UserRequest where
  encodeJson (UserRequest u) =
       "nick"  := u.nick
    ~> jsonEmptyObject

instance decodeUserRequest :: DecodeJson UserRequest where
  decodeJson = gDecodeJson

instance respondableUserRequest :: Respondable UserRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkUserRequest
           <$> readProp "nick" json

instance requestableUserRequest :: Requestable UserRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignUserRequest :: IsForeign UserRequest where
  read f = mkUserRequest
    <$> readProp "nick" f





newtype UserResponse = UserResponse {
  userResponseId          :: UserId,
  userResponseNick        :: String,
  userResponseDisplayNick :: String
}

defaultUserResponse :: UserResponse
defaultUserResponse = UserResponse {
  userResponseId: 0,
  userResponseNick: "",
  userResponseDisplayNick: ""
}

