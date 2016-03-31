module LN.Api.ThreadPost where



import LN.T.Prelude
import LN.Api.Prelude
import LN.Api.Internal
import LN.T.Count
import LN.T.Count.Response
import LN.T.ThreadPost
import LN.T.ThreadPost.Request
import LN.T.ThreadPost.Response



getThreadPosts :: Array Param -> Array By -> ApiEff (Maybe ThreadPostResponses)
getThreadPosts params by = getAt (map paramToTuple params) by [threadPostsTag]



getThreadPostsByOrgId :: Array Param -> String -> ApiEff (Maybe ThreadPostResponses)
getThreadPostsByOrgId params org = getThreadPosts params [ByOrgId org]



getThreadPostsByOrgName :: Array Param -> String -> ApiEff (Maybe ThreadPostResponses)
getThreadPostsByOrgName params org = getThreadPosts params [ByOrgName org]



getThreadPostsByThreadId :: Array Param -> String -> ApiEff (Maybe ThreadPostResponses)
getThreadPostsByThreadId params thread = getThreadPosts params [ByThreadId thread]



getThreadPostsByThreadName :: Array Param -> String -> ApiEff (Maybe ThreadPostResponses)
getThreadPostsByThreadName params thread = getThreadPosts params [ByThreadName thread]



getThreadPost :: String -> ApiEff (Maybe ThreadPostResponse)
getThreadPost thread_post = getAt [] [] [threadPostsTag, thread_post]



getThreadPostByThreadId :: String -> String -> ApiEff (Maybe ThreadPostResponse)
getThreadPostByThreadId thread thread_post = getAt [] [ByThreadId thread] [threadPostsTag, thread_post]



getThreadPostByThreadName :: String -> String -> ApiEff (Maybe ThreadPostResponse)
getThreadPostByThreadName thread thread_post = getAt [] [ByThreadName thread] [threadPostsTag, thread_post]



--
-- Post
--



postThreadByThreadId :: String -> ThreadPostRequest -> ApiEff (Maybe ThreadPostResponse)
postThreadByThreadId thread thread_request = postAt [] [ByThreadId thread] [threadPostsTag] thread_request



postThreadByParentId :: String -> ThreadPostRequest -> ApiEff (Maybe ThreadPostResponse)
postThreadByParentId parent thread_request = postAt [] [ByParentId parent] [threadPostsTag] thread_request



--
-- count
--

countThreadPosts :: Array By -> ApiEff (Maybe CountResponses)
countThreadPosts by = getAt [] by [countsThreadPostsTag]



countThreadPostsByThreadId :: String -> ApiEff (Maybe CountResponses)
countThreadPostsByThreadId thread_id = countThreadPosts [ByThreadId thread_id]
