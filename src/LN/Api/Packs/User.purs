module LN.Api.Packs.User where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Pack.User



getUsersPacks :: Array Param -> Array By -> ApiEff (Maybe UserPackResponses)
getUsersPacks params by = getAt (map paramToTuple params) by [usersPacksTag]



getUsersPacksByBoardId :: Array Param -> String -> ApiEff (Maybe UserPackResponses)
getUsersPacksByBoardId params board = getUsersPacks params [ByBoardId board]



getUserPack :: String -> ApiEff (Maybe UserPackResponse)
getUserPack user_id = getAt [] [] [usersPacksTag, user_id]



getUserPackByBoardId :: String -> String -> ApiEff (Maybe UserPackResponse)
getUserPackByBoardId board user = getAt [] [ByBoardId board] [usersPacksTag, user]
