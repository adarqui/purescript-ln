module LN.Halogen.Util where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.Aff (Aff(), runAff)
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Exception (throwException)

import Data.Array
import Data.Either (Either(..))
import Data.Foldable (foldMap)
import Data.Foreign.Class (readProp)
import Data.Functor (($>))
import Data.JSON (eitherDecode, decode, encode)
import Data.Maybe (Maybe(..), maybe, fromMaybe)

import Halogen
import Halogen.Util (appendTo, appendToBody, onLoad)
import qualified Halogen.HTML.Core as H
import qualified Halogen.HTML.Indexed as H
import qualified Halogen.HTML.Events.Indexed as E
import qualified Halogen.HTML.Properties as PX
import qualified Halogen.HTML.Properties.Indexed as P

import Network.HTTP.Affjax (AJAX(), post, affjax, defaultRequest)
import Network.HTTP.Method
import Network.HTTP.MimeType
import Network.HTTP.MimeType.Common
import Network.HTTP.RequestHeader

import qualified DOM.HTML.Location as DOM
import qualified DOM.HTML.Window as DOM
import qualified DOM.HTML as DOM

import Control.Monad.Eff
import Control.Monad.Eff.Class

import Control.Monad.Free (liftFI)

import Control.Monad.Aff.Console (log)
import Control.Monad.Eff.Console (CONSOLE())


buttonClasses = P.classes [H.className "btn", H.className "btn-info"] -- _class "btn", _class "btn-info"]

formGroupClasses = P.classes [H.className "form-group"]

formControlClasses = P.classes [H.className "form-control"]

radioInlineClasses = P.classes [H.className "radio-inline"]

_class = P.class_ <<< H.className

_classes classes = P.classes $ map H.className classes

-- | Create a text field which can be edited or deleted
--
-- deleteAndEdit
--  P.InputText
--  author
--  (E.input (\new -> EditResourceAuthor author new))
--  (E.input_ (RemoveResourceAuthor author))

deleteAndEdit input_type value edit_cb delete_cb =
  H.div
    [P.class_ (H.className "input-group")]
    [
      H.input [formControlClasses, P.value value, E.onValueChange edit_cb, P.inputType input_type],
      H.span
        [P.class_ (H.className "input-group-btn")]
        [
          H.button [
            buttonClasses,
            P.title "Delete",
            E.onClick delete_cb
          ] [H.text "✖"]
        ]
    ]


deleteAndEditLabeled input_type label value edit_cb delete_cb =
  H.div
    [_class "form-group"]
    [
      H.label
        [_classes ["control-label col-sm-2"]]
        [H.text label]

    , H.div [_class "form-group"] [
        H.input [formControlClasses, _class "col-sm-6", P.value value, E.onValueChange edit_cb, P.inputType input_type],
          H.span
            [P.class_ (H.className "input-group-btn")]
            [
              H.button [
                buttonClasses,
                P.title "Delete",
                E.onClick delete_cb
              ] [H.text "✖"]
            ]
      ]
    ]



-- | Creates a "maybe field".. ie, a field which has no value,
-- but has an "Add" button. The add button adds an input field.
-- Then, we can edit & delete it.
--
--
maybeField_EditAndDelete input_type label mvalue set_cb edit_cb delete_cb =
  H.div
    [formGroupClasses, _class "form-group"]
    [
      H.label [_classes ["control-label", "col-sm-2"]] [H. text label],
      case mvalue of
        Nothing ->
          H.button
            [buttonClasses, P.title "Add", E.onClick set_cb]
            [H.text "Add"]
        (Just value) ->
            deleteAndEdit input_type value edit_cb delete_cb
    ]



-- | Creates a radio menu
--
-- radioMenu "Leuron Type" "leuron-type" [NONE, FACT, CARD] SetLeuronType
--
radioMenu :: forall a b c d. (Show c, Eq c) => String -> String -> Array c -> (c -> Unit -> a Unit) -> c -> HTML b a
radioMenu menu_label radio_name radios setter checked_value =
  H.p_ $
      H.label_ [H.text menu_label] `cons`
      concatMap (\radio ->
          [H.label
            [radioInlineClasses]
            [H.text (show radio)]
           ,H.input [P.inputType P.InputRadio, P.name radio_name, P.value "", E.onChecked (E.input_ (setter radio)), P.checked (checked_value == radio)]
          ]
      ) radios
