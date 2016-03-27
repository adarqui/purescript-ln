module LN.Api.ThreadPost where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.ThreadPost
import LN.T.ThreadPost.Response



getThreadPosts :: ApiEff (Maybe ThreadPostResponses)
getThreadPosts = getAt [] [] [threadPostsTag]



getThreadPost :: String -> ApiEff (Maybe ThreadPostResponse)
getThreadPost thread_post = getAt [] [] [threadPostsTag, thread_post]
