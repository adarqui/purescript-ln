module LN.Api.Thread where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Thread
import LN.T.Thread.Response



getThreads :: ApiEff (Maybe ThreadResponses)
getThreads = getAt [] [] [threadsTag]



getThread :: String -> ApiEff (Maybe ThreadResponse)
getThread thread = getAt [] [] [threadsTag, thread]
