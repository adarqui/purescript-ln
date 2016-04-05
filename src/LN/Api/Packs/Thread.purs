module LN.Api.Packs.Thread where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Packs.Thread



getThreadsPacks :: ApiEff (Maybe ThreadPackResponses)
getThreadsPacks = getAt [] [] [threadsPacksTag]



getThreadsPacksByBoardId :: String -> ApiEff (Maybe ThreadPackResponses)
getThreadsPacksByBoardId board = getAt [] [ByBoardId board] [threadsPacksTag]



getThreadPack :: String -> ApiEff (Maybe ThreadPackResponse)
getThreadPack thread_id = getAt [] [] [threadsPacksTag, thread_id]



getThreadPackByBoardId :: String -> String -> ApiEff (Maybe ThreadPackResponse)
getThreadPackByBoardId board thread = getAt [] [ByBoardId board] [threadsPacksTag, thread]
