module LN.T.Count.Response where



import LN.T.Prelude.Argonaut
import LN.T.Count



newtype CountResponse = CountResponse {
  id :: CountId,
  n  :: Int
}

_CountResponse :: LensP CountResponse {
  id :: CountId,
  n :: Int
}
_CountResponse f (CountResponse o) = CountResponse <$> f o

defaultCountResponse :: CountResponse
defaultCountResponse = CountResponse { id: 0, n: 0 }

mkCountResponse :: CountId -> Int -> CountResponse
mkCountResponse id n = CountResponse {id, n}

instance encodeCountResponse :: EncodeJson CountResponse where
  encodeJson (CountResponse o) =
       "id" := o.id
    ~> "n"  := o.n
    ~> jsonEmptyObject

instance decodeCountResponse :: DecodeJson CountResponse where
  decodeJson j = do
    obj <- decodeJson j
    id <- obj .? "id"
    n  <- obj .? "n"
    pure $ CountResponse {id, n}

instance respondableCountResponse :: Respondable CountResponse where
  responseType = Tuple Nothing JSONResponse
  fromResponse o =
    mkCountResponse
    <$> readProp "id" o
    <*> readProp "n" o

instance requestableCountResponse :: Requestable CountResponse where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignCountResponse :: IsForeign CountResponse where
  read o =
    mkCountResponse
      <$> readProp "id" o
      <*> readProp "n" o




newtype CountResponses = CountResponses {
  counts :: Array CountResponse
}

defaultCountResponses :: CountResponses
defaultCountResponses = mkCountResponses

mkCountResponses :: CountResponses
mkCountResponses = CountResponses { counts: [] }

instance encodeCountResponses :: EncodeJson CountResponses where
  encodeJson (CountResponses u) =
       "counts"    := u.counts
    ~> jsonEmptyObject

instance decodeCountResponses :: DecodeJson CountResponses where
  decodeJson json = do
    obj <- decodeJson json
    counts <- obj .? "counts"
    pure $ CountResponses { counts: counts }

instance respondableCountResponses :: Respondable CountResponses where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json = do
    counts <- readProp "counts" json
    pure $ CountResponses { counts: counts }

instance requestableCountResponses :: Requestable CountResponses where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignCountResponses :: IsForeign CountResponses where
  read f = do
    counts <- readProp "counts" f
    pure $ CountResponses { counts: counts }
