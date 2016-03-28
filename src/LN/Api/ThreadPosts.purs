module LN.Api.ThreadPost where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.ThreadPost
import LN.T.ThreadPost.Request
import LN.T.ThreadPost.Response



getThreadPosts :: ApiEff (Maybe ThreadPostResponses)
getThreadPosts = getAt [] [] [threadPostsTag]



getThreadPostsByOrgId :: String -> ApiEff (Maybe ThreadPostResponses)
getThreadPostsByOrgId org = getAt [] [ByOrgId org] [threadPostsTag]



getThreadPostsByOrgName :: String -> ApiEff (Maybe ThreadPostResponses)
getThreadPostsByOrgName org = getAt [] [ByOrgName org] [threadPostsTag]



getThreadPostsByThreadId :: String -> ApiEff (Maybe ThreadPostResponses)
getThreadPostsByThreadId thread = getAt [] [ByThreadId thread] [threadPostsTag]



getThreadPostsByThreadName :: String -> ApiEff (Maybe ThreadPostResponses)
getThreadPostsByThreadName thread = getAt [] [ByThreadName thread] [threadPostsTag]



getThreadPost :: String -> ApiEff (Maybe ThreadPostResponse)
getThreadPost thread_post = getAt [] [] [threadPostsTag, thread_post]



getThreadPostByThreadId :: String -> String -> ApiEff (Maybe ThreadPostResponse)
getThreadPostByThreadId thread thread_post = getAt [] [ByThreadId thread] [threadPostsTag, thread_post]



getThreadPostByThreadName :: String -> String -> ApiEff (Maybe ThreadPostResponse)
getThreadPostByThreadName thread thread_post = getAt [] [ByThreadName thread] [threadPostsTag, thread_post]



postThread :: String -> ThreadPostRequest -> ApiEff (Maybe ThreadPostResponse)
postThread thread thread_request = postAt [] [] [threadPostsTag, thread] thread_request
