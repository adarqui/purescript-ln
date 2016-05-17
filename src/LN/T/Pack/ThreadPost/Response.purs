module LN.T.Pack.ThreadPost.Response where
--  defaultThreadPostPackResponse
-- ) where



import Data.Maybe           (Maybe(..))
import LN.T.Internal.Types  (ThreadPostResponse, UserSanitizedResponse
                            , ThreadPostPackResponse, mkThreadPostPackResponse)
import LN.T.ThreadPost.Stat (defaultThreadPostStatResponse)



-- defaultThreadPostPackResponse :: ThreadPostResponse -> UserSanitizedResponse -> ThreadPostPackResponse
-- defaultThreadPostPackResponse thread_post user =
--  mkThreadPostPackResponse thread_post user defaultThreadPostStatResponse Nothing Nothing
