module LN.T.Leuron where

import LN.T.Id
import LN.T.DepList
import LN.T.Splits
import LN.T.Substitutions

import Prelude
import Data.Array
import Data.Maybe
import Data.JSON

data LeuronData
  = LnAcronym Acronym
  | LnAntonym Antonym
  | LnFact Fact
  | LnFactList FactList
  | LnCard Card
  | LnDCard DCard
  | LnDCardX DCardX
  | LnSynonym Synonym
  | LnEmpty

data Leuron = Leuron {
  leuronId            :: Id,
  leuronResourceId    :: Id,
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



data Acronym = Acronym {
  acronymA :: String,
  acronymB :: String
}

instance acronymEq :: Eq Acronym where
  eq (Acronym o1) (Acronym o2) = o1.acronymA == o2.acronymA && o1.acronymB == o2.acronymB

instance showAcronym :: Show Acronym where
  show (Acronym obj) = show (obj.acronymA ++ " " ++ obj.acronymB)

instance acronymFromJSON :: FromJSON Acronym where
  parseJSON (JObject o) = do
    acronym_a <- o .: "acronymA"
    acronym_b <- o .: "acronymB"
    return $ Acronym { acronymA: acronym_a, acronymB: acronym_b }
  parseJSON _ = fail "Acronym: Invalid JSON"

instance acronymToJSON :: ToJSON Acronym where
  toJSON (Acronym { acronymA = acronym_a, acronymB = acronym_b }) =
    object [ "acronymA" .= acronym_a, "acronymB" .= acronym_b ]

defaultAcronym :: Acronym
defaultAcronym = Acronym { acronymA: "", acronymB: "" }



data Antonym = Antonym {
  antonymA :: String,
  antonymB :: String
}

instance antonymEq :: Eq Antonym where
  eq (Antonym o1) (Antonym o2) = o1.antonymA == o2.antonymA && o1.antonymB == o2.antonymB

instance showAntonym :: Show Antonym where
  show (Antonym obj) = show (obj.antonymA ++ " " ++ obj.antonymB)

instance antonymFromJSON :: FromJSON Antonym where
  parseJSON (JObject o) = do
    antonym_a <- o .: "antonymA"
    antonym_b <- o .: "antonymB"
    return $ Antonym { antonymA: antonym_a, antonymB: antonym_b }
  parseJSON _ = fail "Antonym: Invalid JSON"

instance antonymToJSON :: ToJSON Antonym where
  toJSON (Antonym { antonymA = antonym_a, antonymB = antonym_b }) =
    object [ "antonymA" .= antonym_a, "antonymB" .= antonym_b ]

defaultAntonym :: Antonym
defaultAntonym = Antonym { antonymA: "", antonymB: "" }



data Card = Card {
  cardFront :: String,
  cardBack  :: String
}

instance cardEq :: Eq Card where
  eq (Card o1) (Card o2) = o1.cardFront == o2.cardFront && o1.cardBack == o2.cardBack

instance showCard :: Show Card where
  show (Card obj) = "front: " ++ obj.cardFront ++ ", back: "++  obj.cardBack

instance cardFromJSON :: FromJSON Card where
  parseJSON (JObject o) = do
    cardFront <- o .: "cardFront"
    cardBack <- o  .: "cardBack"
    return $ Card { cardFront: cardFront, cardBack: cardBack }
  parseJSON _ = fail "Card: Invalid JSON"

instance cardToJSON :: ToJSON Card where
  toJSON (Card { cardFront = cardFront, cardBack = cardBack }) = object [ "cardFront" .= cardFront, "cardBack" .= "cardBack" ]

defaultCard :: Card
defaultCard = Card { cardFront: "", cardBack: "" }



data DCard = DCard {
  dcardFront :: String,
  dcardBack  :: String
}

instance dcardEq :: Eq DCard where
  eq (DCard o1) (DCard o2) = o1.dcardFront == o2.dcardFront && o1.dcardBack == o2.dcardBack

instance showDCard :: Show DCard where
  show (DCard obj) = "front: " ++ obj.dcardFront ++ ", back: "++  obj.dcardBack

instance dcardFromJSON :: FromJSON DCard where
  parseJSON (JObject o) = do
    dcardFront <- o .: "dcardFront"
    dcardBack <- o  .: "dcardBack"
    return $ DCard { dcardFront: dcardFront, dcardBack: dcardBack }
  parseJSON _ = fail "DCard: Invalid JSON"

instance dcardToJSON :: ToJSON DCard where
  toJSON (DCard { dcardFront = dcardFront, dcardBack = dcardBack }) = object [ "dcardFront" .= dcardFront, "dcardBack" .= "dcardBack" ]

defaultDCard :: DCard
defaultDCard = DCard { dcardFront: "", dcardBack: "" }



data DCardX = DCardX {
  dcardxFront :: Array String,
  dcardxBack  :: Array String
}

instance dcardxEq :: Eq DCardX where
  eq (DCardX o1) (DCardX o2) = o1.dcardxFront == o2.dcardxFront && o1.dcardxBack == o2.dcardxBack

instance showDCardX :: Show DCardX where
  show (DCardX obj) = "dcardx"

instance dcardxFromJSON :: FromJSON DCardX where
  parseJSON (JObject o) = do
    dcardxFront <- o .: "dcardxFront"
    dcardxBack <- o  .: "dcardxBack"
    return $ DCardX { dcardxFront: dcardxFront, dcardxBack: dcardxBack }
  parseJSON _ = fail "DCardX: Invalid JSON"

instance dcardxToJSON :: ToJSON DCardX where
  toJSON (DCardX { dcardxFront = dcardxFront, dcardxBack = dcardxBack }) = object [ "dcardxFront" .= dcardxFront, "dcardxBack" .= "dcardxBack" ]

defaultDCardX :: DCardX
defaultDCardX = DCardX { dcardxFront: [], dcardxBack: [] }



data Fact = Fact {
  factText :: String
}

instance factEq :: Eq Fact where
  eq (Fact o1) (Fact o2) = o1.factText == o2.factText

instance showFact :: Show Fact where
  show (Fact obj) = show obj.factText

instance factFromJSON :: FromJSON Fact where
  parseJSON (JObject o) = do
    fact <- o .: "factText"
    return $ Fact { factText: fact }
  parseJSON _ = fail "Fact: Invalid JSON"

instance factToJSON :: ToJSON Fact where
  toJSON (Fact { factText = fact }) = object [ "factText" .= fact ]

defaultFact :: Fact
defaultFact = Fact { factText: "" }



data FactList = FactList {
  factListFact :: String,
  factListList :: Array String
}

instance factListEq :: Eq FactList where
  eq (FactList o1) (FactList o2) = o1.factListFact == o2.factListFact

instance showFactList :: Show FactList where
  show (FactList obj) = show obj.factListFact

instance factListFromJSON :: FromJSON FactList where
  parseJSON (JObject o) = do
    fact     <- o .: "factListFact"
    fact_list <- o .: "factListList"
    return $ FactList { factListFact: fact, factListList: fact_list }
  parseJSON _ = fail "FactList: Invalid JSON"

instance factListToJSON :: ToJSON FactList where
  toJSON (FactList { factListFact = fact, factListList = fact_list }) =
    object [ "factListFact" .= fact, "factListList" .= fact_list ]

defaultFactList :: FactList
defaultFactList = FactList { factListFact: "", factListList: [] }



data Synonym = Synonym {
  synonymA :: String,
  synonymB :: String
}

instance synonymEq :: Eq Synonym where
  eq (Synonym o1) (Synonym o2) = o1.synonymA == o2.synonymA && o1.synonymB == o2.synonymB

instance showSynonym :: Show Synonym where
  show (Synonym obj) = show (obj.synonymA ++ " " ++ obj.synonymB)

instance synonymFromJSON :: FromJSON Synonym where
  parseJSON (JObject o) = do
    synonym_a <- o .: "synonymA"
    synonym_b <- o .: "synonymB"
    return $ Synonym { synonymA: synonym_a, synonymB: synonym_b }
  parseJSON _ = fail "Synonym: Invalid JSON"

instance synonymToJSON :: ToJSON Synonym where
  toJSON (Synonym { synonymA = synonym_a, synonymB = synonym_b }) =
    object [ "synonymA" .= synonym_a, "synonymB" .= synonym_b ]

defaultSynonym :: Synonym
defaultSynonym = Synonym { synonymA: "", synonymB: "" }



defaultLeuron = Leuron {
  leuronId:            toId 0,
  leuronResourceId:    toId 0,
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



instance leuronDataShow :: Show LeuronData where
  show _ = "Leuron"

instance leuronDataFromJSON :: FromJSON LeuronData where
  parseJSON (JObject o) = do
    tag <- o .: "tag"
    case tag of
         "LnAcronym"  -> LnAcronym  <$> (o .: "contents")
         "LnAntonym"  -> LnAntonym  <$> (o .: "contents")
         "LnFact"     -> LnFact     <$> (o .: "contents")
         "LnFactList" -> LnFactList <$> (o .: "contents")
         "LnCard"     -> LnCard     <$> (o .: "contents")
         "LnDCard"    -> LnDCard    <$> (o .: "contents")
         "LnDCardX"   -> LnDCardX   <$> (o .: "contents")
         "LnSynonym"  -> LnSynonym  <$> (o .: "contents")
         "LnEmpty"    -> pure LnEmpty
  parseJSON _ = fail "Leuron: Invalid JSON"

instance leuronDataToJSON :: ToJSON LeuronData where
  toJSON (LnAcronym o)  = object [ "tag" .= "LnSynonym", "contents" .= o ]
  toJSON (LnAntonym o)  = object [ "tag" .= "LnAntonym", "contents" .= o ]
  toJSON (LnFact o)     = object [ "tag" .= "LnFact", "contents" .= o ]
  toJSON (LnFactList o) = object [ "tag" .= "LnFactList", "contents" .= o ]
  toJSON (LnCard o)     = object [ "tag" .= "LnCard", "contents" .= o ]
  toJSON (LnDCard o)    = object [ "tag" .= "LnDCard", "contents" .= o ]
  toJSON (LnDCardX o)   = object [ "tag" .= "LnDCardX", "contents" .= o ]
  toJSON (LnSynonym o)  = object [ "tag" .= "LnSynonym", "contents" .= o ]
  toJSON LnEmpty        = object [ "tag" .= "LnEmpty" ]

instance leuronEq :: Eq Leuron where
  eq (Leuron o1) (Leuron o2) = o1.leuronId == o2.leuronId

instance leuronShow :: Show Leuron where
  show (Leuron obj) = "leuron"

instance leuronFromJSON :: FromJSON Leuron where
  parseJSON (JObject o) = do
    leuron_id           <- o .: "leuronId"
    leuron_resource_id  <- o .: "leuronResourceId"
    leuron_data         <- o .: "leuronData"
    leuron_title        <- o .:? "leuronTitle"
    leuron_description  <- o .:? "leuronDescription"
    leuron_section      <- o .:? "leuronSection"
    leuron_examples     <- o .:? "leuronExamples"
    leuron_strengths    <- o .: "leuronStrengths"
    leuron_categories   <- o .: "leuronCategories"
    leuron_splits       <- o .:? "leuronSplits"
    leuron_subs         <- o .:? "leuronSubstitutions"
    leuron_tags         <- o .:? "leuronTags"
    leuron_style        <- o .:? "leuronStyle"
    leuron_specific     <- o .:? "leuronSpecificTo"
    return $ Leuron {
      leuronId: leuron_id,
      leuronResourceId: leuron_resource_id,
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
  parseJSON _ = fail "Leuron: Invalid JSON"

instance leuronToJSON :: ToJSON Leuron where
  toJSON (Leuron { leuronId = x1, leuronResourceId = x2, leuronData = x3, leuronTitle = x4, leuronDescription = x5, leuronExamples = x6, leuronStrengths = x7, leuronCategories = x8, leuronTags = x9, leuronStyle = x10, leuronSpecificTo = x11, leuronSubstitutions = x12, leuronSplits = x13 })
    = object [ "leuronId" .= x1, "leuronResourceId" .= x2, "leuronData" .= x3, "leuronTitle" .= x4, "leuronDescription" .= x5, "leuronExamples" .= x6, "leuronStrengths" .= x7, "leuronCategories" .= x8, "leuronTags" .= x9, "leuronStyle" .= x10, "leuronSpecificTo" .= x11, "leuronSubstitutions" .= x12, "leuronSplits" .= x13 ]


unLeuron (Leuron ln) = ln
