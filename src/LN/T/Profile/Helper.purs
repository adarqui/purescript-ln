module LN.T.Profile.Helper where



import LN.T.Internal.Types



profileResponseToRequest :: ProfileResponse -> ProfileRequest
profileResponseToRequest (ProfileResponse resp) =
  ProfileRequest {
    gender: resp.gender,
    birthdate: resp.birthdate,
    website: resp.website,
    location: resp.location,
    signature: resp.signature
  }
