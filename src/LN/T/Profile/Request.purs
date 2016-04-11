module LN.T.Profile.Request where



import LN.T.Prelude.Argonaut
import LN.T.Profile
import LN.T.Date as D



newtype ProfileRequest = ProfileRequest {
  gender :: ProfileGender,
  birthdate :: D.Date,
  website :: Maybe String,
  location :: Maybe String,
  signature :: Maybe String
}

_ProfileRequest :: LensP ProfileRequest {
  gender :: ProfileGender,
  birthdate :: D.Date,
  website :: Maybe String,
  location :: Maybe String,
  signature :: Maybe String
}

_ProfileRequest f (ProfileRequest o) = ProfileRequest <$> f o




defaultProfileRequest :: ProfileRequest
defaultProfileRequest = mkProfileRequest GenderUnknown D.defaultDate Nothing Nothing Nothing



mkProfileRequest :: ProfileGender -> D.Date -> Maybe String -> Maybe String -> Maybe String -> ProfileRequest
mkProfileRequest gender birthdate website location signature =
  ProfileRequest {gender, birthdate, website, location, signature}




instance encodeProfileRequest :: EncodeJson ProfileRequest where
  encodeJson (ProfileRequest o) =
       "gender"      := o.gender
    ~> "birthdate"   := o.birthdate
    ~> "website"     := o.website
    ~> "location"    := o.location
    ~> "signature"   := o.signature
    ~> jsonEmptyObject



instance decodeProfileRequest :: DecodeJson ProfileRequest where
  decodeJson json = do
    obj <- decodeJson json
    gender <- obj .? "gender"
    birthdate <- obj .? "birthdate"
    website <- obj .? "website"
    location <- obj .? "location"
    signature <- obj .? "signature"
    pure $ ProfileRequest {gender, birthdate, website, location, signature}




instance requestableProfileRequest :: Requestable ProfileRequest where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str



instance isForeignProfileRequest :: IsForeign ProfileRequest where
  read f = mkProfileRequest
    <$> readProp "gender" f
    <*> readProp "birthdate" f
    <*> (runNullOrUndefined <$> readProp "website" f)
    <*> (runNullOrUndefined <$> readProp "location" f)
    <*> (runNullOrUndefined <$> readProp "signature" f)
