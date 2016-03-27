module LN.Api.Forum where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Forum
import LN.T.Forum.Response



getForums :: ApiEff (Maybe ForumResponses)
getForums = getAt [] [] [forumsTag]



getForum :: String -> ApiEff (Maybe ForumResponse)
getForum forum = getAt [] [] [forumsTag, forum]
