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

mkUserRequest :: String -> UserRequest
mkUserRequest nick = UserRequest { nick }

defaultUserRequest :: UserRequest
defaultUserRequest = mkUserRequest "empty"

_UserRequest :: LensP UserRequest { nick :: String }
_UserRequest f (UserRequest o) = UserRequest <$> f o

_req_nick :: forall b a r. Lens { nick :: a | r } { nick :: b | r } a b
_req_nick f o = o { nick = _ } <$> f o.nick

instance encodeUserRequest :: EncodeJson UserRequest where
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
  id   :: UserId,
  nick :: String
}

derive instance genericUserResponse :: Generic UserResponse

instance showUserResponse :: Show UserResponse where
  show = gShow

defaultUserResponse :: UserResponse
defaultUserResponse = mkUserResponse 0 "empty"

mkUserResponse :: Int -> String -> UserResponse
mkUserResponse id nick = UserResponse { id, nick }

_UserResponse :: LensP UserResponse { id :: Int, nick :: String }
_UserResponse f (UserResponse o) = UserResponse <$> f o

_resp_id :: forall b a r. Lens { id :: a | r } { id :: b | r } a b
_resp_id f o = o { id = _ } <$> f o.id

_resp_nick :: forall b a r. Lens { nick :: a | r } { nick :: b | r } a b
_resp_nick f o = o { nick = _ } <$> f o.nick

instance encodeUserResponse :: EncodeJson UserResponse where
  encodeJson (UserResponse u) =
       "id"    := u.id
    ~> "nick"  := u.nick
    ~> jsonEmptyObject

instance decodeUserResponse :: DecodeJson UserResponse where
  decodeJson = gDecodeJson

instance respondableUserResponse :: Respondable UserResponse where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkUserResponse
           <$> readProp "id" json
           <*> readProp "nick" json

instance requestableUserResponse :: Requestable UserResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignUserResponse :: IsForeign UserResponse where
  read f = mkUserResponse
    <$> readProp "id" f
    <*> readProp "nick" f
