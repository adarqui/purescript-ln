module LN.T.Categories.Ajax (
  ajaxFetchCategories
) where

import Prelude
import Data.Either
import Data.JSON
import LN.T.Resource

import Control.Monad.Aff

import Network.HTTP.Affjax
import Network.HTTP.Method
import Network.HTTP.MimeType
import Network.HTTP.MimeType.Common
import Network.HTTP.RequestHeader

ajaxFetchCategories :: forall eff. String -> Aff (ajax :: AJAX | eff) (Either String (Array (Array String)))
ajaxFetchCategories rid = do
  res <- affjax $ defaultRequest { method = GET, url = ("/resources/categories/" ++ rid), headers = [ContentType applicationJSON] }
  let le = eitherDecode res.response :: Either String (Array (Array String))
  return le
