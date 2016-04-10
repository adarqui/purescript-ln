module LN.T.Profile where



import LN.T.Prelude.Argonaut
import Data.Argonaut.Core



type ProfileId = Int



profileTag :: String
profileTag = "profile"



profilesTag :: String
profilesTag = "profiles"



data ProfileGender
  = GenderMale
  | GenderFemale
  | GenderUnknown

defaultProfileGender :: ProfileGender
defaultProfileGender = GenderUnknown

instance encodeProfileGender :: EncodeJson ProfileGender where
  encodeJson GenderMale    = encodeJson "m"
  encodeJson GenderFemale  = encodeJson "f"
  encodeJson GenderUnknown = encodeJson "u"

instance decodeProfileGender :: DecodeJson ProfileGender where
  decodeJson json = do
    -- TODO FIXME
    pure GenderUnknown

instance respondableProfileGender :: Respondable ProfileGender where
  responseType =
    Tuple Nothing JSONResponse
  fromResponse json =
    -- TODO FIXME
    pure GenderUnknown

instance requestableProfileGender :: Requestable ProfileGender where
  toRequest s =
    let str = printJson (encodeJson s) :: String
     in toRequest str

instance isForeignProfileGender :: IsForeign ProfileGender where
  -- TODO FIXME
  read f = pure GenderUnknown
