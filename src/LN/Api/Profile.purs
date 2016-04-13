module LN.Api.Profile where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Count
import LN.T.Count.Response
import LN.T.Profile
import LN.T.Profile.Request
import LN.T.Profile.Response



getProfile :: String -> ApiEff (Maybe ProfileResponse)
getProfile profile = getAt [] [] [profilesTag, profile]



-- getProfileByProfileId :: String -> String -> ApiEff (Maybe ProfileResponse)
-- getProfileByProfileId profile profile_post = getAt [] [ByProfileId profile] [profilePostsTag, profile_post]



--
-- Update
--



updateProfile :: String -> ProfileRequest -> ApiEff (Maybe ProfileResponse)
updateProfile profile profile_update_request = updateAt [] [] [profilesTag, profile] profile_update_request
