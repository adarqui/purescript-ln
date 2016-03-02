module LN.T.Resource.Ajax (
  ajaxFetchResource,
  ajaxSaveResource,
  ajaxUpdateResource,
  ajaxFetchResources
) where

import Prelude
import Data.Either
import Data.JSON
import Data.Maybe
import LN.T.Resource

import Control.Monad.Aff

import Network.HTTP.Affjax
import Network.HTTP.Method
import Network.HTTP.MimeType
import Network.HTTP.MimeType.Common
import Network.HTTP.RequestHeader

ajaxFetchResource :: forall eff. String -> Aff (ajax :: AJAX | eff) (Either String Resource)
ajaxFetchResource rid = do
  res <- affjax $ defaultRequest { method = GET, url = ("/resources/" ++ rid), headers = [ContentType applicationJSON] }
  let le = eitherDecode res.response :: Either String Resource
  return le

ajaxSaveResource :: forall eff. Resource -> Aff (ajax :: AJAX | eff) (Either String Resource)
ajaxSaveResource resource = do
  res <- affjax $ defaultRequest { method = POST, url = ("/resources/"), content = pure (encode resource), headers = [ContentType applicationJSON] }
  let le = eitherDecode res.response :: Either String Resource
  return le

ajaxUpdateResource :: forall eff. Resource -> Aff (ajax :: AJAX | eff) (Either String Resource)
ajaxUpdateResource resource = do
  res <- affjax $ defaultRequest { method = PUT, url = ("/resources/"++"1"), content = pure (encode resource), headers = [ContentType applicationJSON] }
  let le = eitherDecode res.response :: Either String Resource
  return le

ajaxFetchResources :: forall eff. Aff (ajax :: AJAX | eff) (Either String (Array Resource))
ajaxFetchResources = do
  res <- affjax $ defaultRequest { method = GET, url = "/resources/", headers = [ContentType applicationJSON] }
  let le = eitherDecode res.response :: Either String (Array Resource)
  return le
