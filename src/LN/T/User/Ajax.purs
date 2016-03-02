module LN.T.User.Ajax (
  ajaxFetchUserSession
) where

import Prelude
import Data.Either
import Data.JSON
import Data.Maybe
import LN.T.User

import Control.Monad.Aff

import Network.HTTP.Affjax
import Network.HTTP.Method
import Network.HTTP.MimeType
import Network.HTTP.MimeType.Common
import Network.HTTP.RequestHeader

ajaxFetchUserSession :: forall eff. Aff (ajax :: AJAX | eff) (Either String User)
ajaxFetchUserSession = do
  res <- affjax $ defaultRequest { method = GET, url = "/session/", headers = [ContentType applicationJSON] }
  let le = eitherDecode res.response :: Either String User
  return le
