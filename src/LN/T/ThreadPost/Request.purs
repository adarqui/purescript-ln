module LN.T.ThreadPost.Request where



import LN.T.Prelude.Argonaut
import LN.T.ThreadPost
import LN.T.ThreadPost.PostData
import LN.T.DateMaybe



newtype ThreadPostRequest = ThreadPostRequest {
  title :: Maybe String,
  body :: PostData,
  tags :: Array String,
  privateTags :: Array String
}

_ThreadPostRequest :: LensP ThreadPostRequest {
  title :: Maybe String,
  body :: PostData,
  tags :: Array String,
  privateTags :: Array String
}

_ThreadPostRequest f (ThreadPostRequest o) = ThreadPostRequest <$> f o



defaultThreadPostRequest :: ThreadPostRequest
defaultThreadPostRequest = mkThreadPostRequest Nothing PostDataEmpty [] []



mkThreadPostRequest :: Maybe String -> PostData -> Array String -> Array String -> ThreadPostRequest
mkThreadPostRequest title body tags privateTags  =
  ThreadPostRequest { title, body, tags, privateTags }



instance encodeThreadPostRequest :: EncodeJson ThreadPostRequest where
  encodeJson (ThreadPostRequest o) =
       "title"        := o.title
    ~> "body"         := o.body
    ~> "tags"         := o.tags
    ~> "private_tags" := o.privateTags
    ~> jsonEmptyObject



instance decodeThreadPostRequest :: DecodeJson ThreadPostRequest where
  decodeJson json = do
    obj <- decodeJson json
    title <- obj .? "title"
    body <- obj .? "body"
    tags <- obj .? "tags"
    privateTags <- obj .? "private_tags"
    pure $ ThreadPostRequest {title, body, tags, privateTags}



instance respondableThreadPostRequest :: Respondable ThreadPostRequest where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    mkThreadPostRequest
      <$> (runNullOrUndefined <$> readProp "title" json)
      <*> readProp "body" json
      <*> readProp "tags" json
      <*> readProp "private_tags" json



instance requestableThreadPostRequest :: Requestable ThreadPostRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignThreadPostRequest :: IsForeign ThreadPostRequest where
  read f = mkThreadPostRequest
    <$> (runNullOrUndefined <$> readProp "title" f)
    <*> readProp "body" f
    <*> readProp "tags" f
    <*> readProp "private_tags" f
