module LN.Api.Thread where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Thread
import LN.T.Thread.Response



getThreads :: ApiEff (Maybe ThreadResponses)
getThreads = getAt [] [] [threadsTag]



getThreadsByBoardId :: String -> ApiEff (Maybe ThreadResponses)
getThreadsByBoardId board = getAt [] [ByBoardId board] [threadsTag]



getThreadsByBoardName :: String -> ApiEff (Maybe ThreadResponses)
getThreadsByBoardName board = getAt [] [ByBoardName board] [threadsTag]



getThread :: String -> ApiEff (Maybe ThreadResponse)
getThread thread = getAt [] [] [threadsTag, thread]



getThreadByBoardId :: String -> String -> ApiEff (Maybe ThreadResponse)
getThreadByBoardId board thread = getAt [] [ByBoardId board] [threadsTag, thread]



getThreadByBoardName :: String -> String -> ApiEff (Maybe ThreadResponse)
getThreadByBoardName board thread = getAt [] [ByBoardName board] [threadsTag, thread]
