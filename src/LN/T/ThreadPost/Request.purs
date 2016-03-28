module LN.T.ThreadPost.Request where



import LN.T.Prelude.Argonaut
import LN.T.ThreadPost
import LN.T.DateMaybe



newtype ThreadPostRequest = ThreadPostRequest {
  title :: Maybe String,
  body :: String
}

_ThreadPostRequest :: LensP ThreadPostRequest {
  title :: Maybe String,
  body :: String
}

_ThreadPostRequest f (ThreadPostRequest o) = ThreadPostRequest <$> f o



defaultThreadPostRequest :: ThreadPostRequest
defaultThreadPostRequest = mkThreadPostRequest Nothing "body"



mkThreadPostRequest :: Maybe String -> String -> ThreadPostRequest
mkThreadPostRequest title body =
  ThreadPostRequest { title, body }



instance encodeThreadPostRequest :: EncodeJson ThreadPostRequest where
  encodeJson (ThreadPostRequest u) =
       "title"    := u.title
    ~> "body" := u.body
    ~> jsonEmptyObject



instance decodeThreadPostRequest :: DecodeJson ThreadPostRequest where
  decodeJson json = do
    obj <- decodeJson json
    title <- obj .? "title"
    body <- obj .? "body"
    pure $ ThreadPostRequest {title, body}



instance respondableThreadPostRequest :: Respondable ThreadPostRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkThreadPostRequest
      <$> (runNullOrUndefined <$> readProp "title" json)
      <*> readProp "body" json



instance requestableThreadPostRequest :: Requestable ThreadPostRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignThreadPostRequest :: IsForeign ThreadPostRequest where
  read f = mkThreadPostRequest
    <$> (runNullOrUndefined <$> readProp "title" f)
    <*> readProp "body" f
