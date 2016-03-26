module LN.Api.ThreadPost where



import LN.T.Prelude
import LN.Api.Prelude
import Network.HTTP.Affjax as AJ
import LN.T.ThreadPost.Response



getThreadPosts :: forall eff. Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe ThreadPostResponses)
getThreadPosts = do
    liftAff $ log "getThreadPosts"
    { response: response } <- AJ.get "api/thread_posts"
    let r = fromResponse response
    case r of
         (Left err) -> do
           liftAff $ log $ ("error: " ++ show err)
           return Nothing
         (Right js) -> do
           liftAff $ log "success"
           return $ Just js



getThreadPost :: forall eff. Int -> Aff (ajax :: AJAX, console :: CONSOLE | eff) (Maybe ThreadPostResponse)
getThreadPost thread_post_id = do
    liftAff $ log "getThreadPost"
    { response: response } <- AJ.get ("api/thread_posts/" <> show thread_post_id)
    let r = fromResponse response
    case r of
         (Left err) -> do
           liftAff $ log $ ("error: " ++ show err)
           return Nothing
         (Right js) -> do
           liftAff $ log "success"
           return $ Just js
