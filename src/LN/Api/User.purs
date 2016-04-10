module LN.Api.User where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Count
import LN.T.Count.Response
import LN.T.User
import LN.T.User.Sanitized.Response



getUsers' :: ApiEff (Maybe UserSanitizedResponses)
getUsers' = getUsers [] []



getUsers :: Array Param -> Array By -> ApiEff (Maybe UserSanitizedResponses)
getUsers params by = getAt (map paramToTuple params) by [usersTag]



-- getUsersByOrgId ...
-- getUsersByThreadId
-- ...


getUser :: String -> ApiEff (Maybe UserSanitizedResponse)
getUser user = getAt [] [] [usersTag, user]


--
-- count
--

countUsers :: Array By -> ApiEff (Maybe CountResponses)
countUsers by = getAt [] by [countsUsersTag]
