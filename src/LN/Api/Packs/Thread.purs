module LN.Api.Packs.Thread where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Pack.Thread



getThreadsPacks :: Array Param -> Array By -> ApiEff (Maybe ThreadPackResponses)
getThreadsPacks params by = getAt (map paramToTuple params) by [threadsPacksTag]



getThreadsPacksByBoardId :: Array Param -> String -> ApiEff (Maybe ThreadPackResponses)
getThreadsPacksByBoardId params board = getThreadsPacks params [ByBoardId board]



getThreadPack :: String -> ApiEff (Maybe ThreadPackResponse)
getThreadPack thread_id = getAt [] [] [threadsPacksTag, thread_id]



getThreadPackByBoardId :: String -> String -> ApiEff (Maybe ThreadPackResponse)
getThreadPackByBoardId board thread = getAt [] [ByBoardId board] [threadsPacksTag, thread]
