module LN.Api.User.Profile where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Count
import LN.T.Count.Response
import LN.T.Profile
import LN.T.Profile.Request
import LN.T.Profile.Response
import LN.T.User.Profile



getUserProfile :: String -> ApiEff (Maybe ProfileResponse)
getUserProfile profile = getAt [] [] [usersProfilesTag, profile]



--
-- Update
--



updateUserProfile :: String -> ProfileRequest -> ApiEff (Maybe ProfileResponse)
updateUserProfile profile profile_update_request = updateAt [] [] [usersProfilesTag, profile] profile_update_request
