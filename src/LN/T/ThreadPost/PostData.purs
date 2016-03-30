module LN.T.ThreadPost.PostData where



import LN.T.Prelude.Argonaut



data PostData
  = PostDataRaw      String
  | PostDataMarkdown String
  | PostDataBBCode   String
  | PostDataCode     String String
  | PostDataOther    String String
  | PostDataEmpty



defaultPostData :: PostData
defaultPostData = PostDataEmpty



instance encodePostData :: EncodeJson PostData where
  encodeJson (PostDataRaw v) =
       "type" := "post_data_raw"
    ~> "data" := v
    ~> jsonEmptyObject
  encodeJson (PostDataMarkdown v) =
       "type" := "post_data_markdown"
    ~> "data" := v
    ~> jsonEmptyObject
  encodeJson (PostDataBBCode v) =
       "type" := "post_data_bbcode"
    ~> "data" := v
    ~> jsonEmptyObject
  encodeJson (PostDataCode name v) =
       "type" := "post_data_code"
    ~> "name" := name
    ~> "data" := v
    ~> jsonEmptyObject
  encodeJson (PostDataOther name v) =
       "type" := "post_data_other"
    ~> "name" := name
    ~> "data" := v
    ~> jsonEmptyObject
  encodeJson _ =
       "type" := "post_data_empty"
    ~> jsonEmptyObject



instance decodePostData :: DecodeJson PostData where
  decodeJson json = do
    obj <- decodeJson json
    typ <- obj .? "type"
    case typ of
      "post_data_raw"      -> PostDataRaw <$> obj .? "data"
      "post_data_markdown" -> PostDataMarkdown <$> obj .? "data"
      "post_data_bbcode"   -> PostDataBBCode <$> obj .? "data"
      "post_data_code"     -> PostDataCode <$> obj .? "name" <*> obj .? "data"
      "post_data_other"    -> PostDataOther <$> obj .? "name" <*> obj .? "data"
      _                    -> pure PostDataEmpty



instance respondablePostData :: Respondable PostData where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse f = do
    typ <- readProp "type" f
    case typ of
      "post_data_raw"      -> PostDataRaw <$> readProp "data" f
      "post_data_markdown" -> PostDataMarkdown <$> readProp "data" f
      "post_data_bbcode"   -> PostDataBBCode <$> readProp "data" f
      "post_data_code"     -> PostDataCode <$> readProp "name" f <*> readProp "data" f
      "post_data_other"    -> PostDataOther <$> readProp "name" f <*> readProp "data" f
      _                    -> pure PostDataEmpty



instance requestablePostData :: Requestable PostData where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignPostData :: IsForeign PostData where
  read f = do
    typ <- readProp "type" f
    case typ of
      "post_data_raw"      -> PostDataRaw <$> readProp "data" f
      "post_data_markdown" -> PostDataMarkdown <$> readProp "data" f
      "post_data_bbcode"   -> PostDataBBCode <$> readProp "data" f
      "post_data_code"     -> PostDataCode <$> readProp "name" f <*> readProp "data" f
      "post_data_other"    -> PostDataOther <$> readProp "name" f <*> readProp "data" f
      _                    -> pure PostDataEmpty
