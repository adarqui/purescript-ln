module LN.T.Profile.Helper where



import LN.T.Profile.Request
import LN.T.Profile.Response



profileResponseToRequest :: ProfileResponse -> ProfileRequest
profileResponseToRequest (ProfileResponse resp) =
  ProfileRequest {
    gender: resp.gender,
    birthdate: resp.birthdate,
    website: resp.website,
    location: resp.location,
    signature: resp.signature
  }
