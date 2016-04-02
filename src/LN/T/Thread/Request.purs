module LN.T.Thread.Request where



import LN.T.Prelude.Argonaut
import LN.T.Thread
import LN.T.DateMaybe



newtype ThreadRequest = ThreadRequest {
  name :: String,
  description :: Maybe String,
  sticky :: Boolean,
  locked :: Boolean,
  poll :: Maybe String
}

_ThreadRequest :: LensP ThreadRequest {
  name :: String,
  description :: Maybe String,
  sticky :: Boolean,
  locked :: Boolean,
  poll :: Maybe String
}

_ThreadRequest f (ThreadRequest o) = ThreadRequest <$> f o




defaultThreadRequest :: ThreadRequest
defaultThreadRequest = mkThreadRequest "name" Nothing false false Nothing



mkThreadRequest :: String -> Maybe String -> Boolean -> Boolean -> Maybe String -> ThreadRequest
mkThreadRequest name description sticky locked poll =
  ThreadRequest {name, description, sticky, locked, poll}




instance encodeThreadRequest :: EncodeJson ThreadRequest where
  encodeJson (ThreadRequest o) =
       "name"   := o.name
    ~> "desc"   := o.description
    ~> "sticky" := o.sticky
    ~> "locked" := o.locked
    ~> "poll"   := o.poll
    ~> jsonEmptyObject



instance decodeThreadRequest :: DecodeJson ThreadRequest where
  decodeJson json = do
    obj <- decodeJson json
    name <- obj .? "name"
    description <- obj .? "desc"
    sticky <- obj .? "sticky"
    locked <- obj .? "locked"
    poll <- obj .? "poll"
    pure $ ThreadRequest {name, description, sticky, locked, poll}




instance requestableThreadRequest :: Requestable ThreadRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignThreadRequest :: IsForeign ThreadRequest where
  read f = mkThreadRequest
    <$> readProp "name" f
    <*> (runNullOrUndefined <$> readProp "desc" f)
    <*> readProp "sticky" f
    <*> readProp "locked" f
    <*> (runNullOrUndefined <$> readProp "poll" f)
