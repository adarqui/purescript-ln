module LN.Api.Forum where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Forum
import LN.T.Forum.Response



getForums :: ApiEff (Maybe ForumResponses)
getForums = getAt [] [] [forumsTag]



getForumsByOrgName :: String -> ApiEff (Maybe ForumResponses)
getForumsByOrgName org = getAt [] [ByOrgName org] [forumsTag]



getForum :: String -> ApiEff (Maybe ForumResponse)
getForum forum = getAt [] [] [forumsTag, forum]



getForumForOrgName :: String -> String -> ApiEff (Maybe ForumResponse)
getForumForOrgName org forum = getAt [] [ByOrgName org] [forumsTag, forum]
