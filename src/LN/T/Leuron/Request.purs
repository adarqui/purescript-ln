module LN.T.Leuron.Request where

import LN.T.Id
import LN.T.DepList
import LN.T.Splits
import LN.T.Substitutions
import LN.T.Leuron

import Prelude
import Data.Array
import Data.Maybe
import Data.JSON



data LeuronRequest = LeuronRequest {
  leuronData          :: LeuronData,
  leuronTitle         :: Maybe String,
  leuronDescription   :: Maybe String,
  leuronSection       :: Maybe String,
  leuronExamples      :: Maybe (Array String),
  leuronStrengths     :: Array String,
  leuronCategories    :: DepList String,
  leuronSplits        :: Maybe (Array Splits),
  leuronSubstitutions :: Maybe (Array Substitutions),
  leuronTags          :: Maybe (Array String),
  leuronStyle         :: Maybe (Array String),
  leuronSpecificTo    :: Maybe String
}



defaultLeuronRequest = LeuronRequest {
  leuronData:          LnEmpty,
  leuronTitle:         Nothing,
  leuronDescription:   Nothing,
  leuronSection:       Nothing,
  leuronExamples:      Nothing,
  leuronStrengths:     [],
  leuronCategories:    [],
  leuronSplits:        Nothing,
  leuronSubstitutions: Nothing,
  leuronTags:          Nothing,
  leuronStyle:         Nothing,
  leuronSpecificTo:    Nothing
}



-- instance leuronRequestEq :: Eq LeuronRequest where
--  eq (LeuronRequest o1) (LeuronRequest o2) = o1.leuronId == o2.leuronId

instance leuronRequestShow :: Show LeuronRequest where
  show (LeuronRequest obj) = "leuron_request"

instance leuronRequestFromJSON :: FromJSON LeuronRequest where
  parseJSON (JObject o) = do
    leuron_data         <- o .: "data"
    leuron_title        <- o .:? "title"
    leuron_description  <- o .:? "desc"
    leuron_section      <- o .:? "section"
    leuron_examples     <- o .:? "examples"
    leuron_strengths    <- o .: "strengths"
    leuron_categories   <- o .: "categories"
    leuron_splits       <- o .:? "splits"
    leuron_subs         <- o .:? "subs"
    leuron_tags         <- o .:? "tags"
    leuron_style        <- o .:? "style"
    leuron_specific     <- o .:? "specific_to"
    return $ LeuronRequest {
      leuronData: leuron_data,
      leuronTitle: leuron_title,
      leuronDescription: leuron_description,
      leuronSection: leuron_section,
      leuronExamples: leuron_examples,
      leuronStrengths: leuron_strengths,
      leuronCategories: leuron_categories,
      leuronSplits: leuron_splits,
      leuronSubstitutions: leuron_subs,
      leuronTags: leuron_tags,
      leuronStyle: leuron_style,
      leuronSpecificTo: leuron_specific
    }
  parseJSON _ = fail "LeuronRequest: Invalid JSON"

instance leuronRequestToJSON :: ToJSON LeuronRequest where
  toJSON (LeuronRequest { leuronData = x3, leuronTitle = x4, leuronDescription = x5, leuronSection = x56, leuronExamples = x6, leuronStrengths = x7, leuronCategories = x8, leuronTags = x9, leuronStyle = x10, leuronSpecificTo = x11, leuronSubstitutions = x12, leuronSplits = x13 })
    = object [ "data" .= x3, "tiitle" .= x4, "desc" .= x5, "section" .= x56, "examples" .= x6, "strengths" .= x7, "categories" .= x8, "tags" .= x9, "style" .= x10, "specific_to" .= x11, "subs" .= x12, "splits" .= x13 ]


unLeuronRequest (LeuronRequest ln) = ln
