module LN.Api.Thread where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Count
import LN.T.Count.Response
import LN.T.Thread
import LN.T.Thread.Request
import LN.T.Thread.Response



getThreads :: Array Param -> Array By -> ApiEff (Maybe ThreadResponses)
getThreads params by = getAt (map paramToTuple params) by [threadsTag]



getThreadsByBoardId :: Array Param -> String -> ApiEff (Maybe ThreadResponses)
getThreadsByBoardId params board = getThreads params [ByBoardId board]



getThreadsByBoardName :: Array Param -> String -> ApiEff (Maybe ThreadResponses)
getThreadsByBoardName params board = getThreads params [ByBoardName board]



getThread :: String -> ApiEff (Maybe ThreadResponse)
getThread thread = getAt [] [] [threadsTag, thread]



getThreadByBoardId :: String -> String -> ApiEff (Maybe ThreadResponse)
getThreadByBoardId board thread = getAt [] [ByBoardId board] [threadsTag, thread]



getThreadByBoardName :: String -> String -> ApiEff (Maybe ThreadResponse)
getThreadByBoardName board thread = getAt [] [ByBoardName board] [threadsTag, thread]



--
-- Post
--

postThreadByBoardId :: String -> ThreadRequest -> ApiEff (Maybe ThreadResponse)
postThreadByBoardId board thread_request = postAt [] [ByBoardId board] [threadsTag] thread_request



--
-- count
--

countThreads :: Array By -> ApiEff (Maybe CountResponses)
countThreads by = getAt [] by [countsThreadsTag]



countThreadsByBoardId :: String -> ApiEff (Maybe CountResponses)
countThreadsByBoardId board_id = countThreads [ByBoardId board_id]
