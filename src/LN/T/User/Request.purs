module LN.T.User.Request where



import LN.T.Prelude.Argonaut



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
