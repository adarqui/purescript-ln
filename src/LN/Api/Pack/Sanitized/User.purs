module LN.Api.Pack.Sanitized.User where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Pack.Sanitized.User



getUsersSanitizedPacks :: Array Param -> Array By -> ApiEff (Maybe UserSanitizedPackResponses)
getUsersSanitizedPacks params by = getAt (map paramToTuple params) by [usersSanitizedPacksTag]



getUserSanitizedPack :: String -> ApiEff (Maybe UserSanitizedPackResponse)
getUserSanitizedPack user_id = getAt [] [] [usersSanitizedPacksTag, user_id]
