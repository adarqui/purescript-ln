module LN.T.DateMaybe where

--import LN.T.Prelude

import qualified Data.String as Str
import Data.Foreign
import Data.Foreign.Class
import Data.Function

import qualified Data.Date as D
import qualified Data.Date.UTC as U
import qualified Data.Time as T

import LN.T.Prelude.Argonaut

newtype DateMaybe = DateMaybe (Maybe D.Date)

instance eqDateMaybe :: Eq DateMaybe where
  eq = eq `on` underlyingDate

instance ordDateMaybe :: Ord DateMaybe where
  compare = compare `on` underlyingDate

instance showDateMaybe :: Show DateMaybe where
  show = toISOString

underlyingDate :: DateMaybe -> D.Date
underlyingDate (DateMaybe (Just d)) = d

now :: forall e. Eff (now :: D.Now | e) DateMaybe
now = (DateMaybe <<< Just) <$> D.now

dateFromString :: String -> Maybe DateMaybe
dateFromString str = (DateMaybe <<< Just) <$> D.fromString str

defaultDate :: DateMaybe
defaultDate = DateMaybe $ D.fromString "01-01-2016"

year :: DateMaybe -> D.Year
year = U.year <<< underlyingDate

month :: DateMaybe -> D.Month
month = U.month <<< underlyingDate

dayOfMonth :: DateMaybe -> D.DayOfMonth
dayOfMonth = U.dayOfMonth <<< underlyingDate

unYear :: D.Year -> Int
unYear (D.Year n) = n

unDayOfMonth :: D.DayOfMonth -> Int
unDayOfMonth (D.DayOfMonth n) = n

instance isForeignDateMaybe :: IsForeign DateMaybe where
  read = readDateMaybe

{-
readDate :: Foreign -> F Date
readDate f =
  case tagOf f of
       "Date" ->
         case D.fromJSDate <$> unsafeReadTagged "Date" f of
              Right (Just d) -> Right (Date d)
              Right Nothing -> Left (TypeMismatch "invalid date" "asdf")
              Left a -> Left a
       "String" ->
         case D.fromString <$> unsafeReadTagged "String" f of
              Right (Just d) -> Right (Date d)
              Right Nothing -> Left (TypeMismatch "invalid date" "invalid date")
              Left a -> Left a
       "Number" ->
         case D.fromEpochMilliseconds <<< T.Milliseconds <$> unsafeReadTagged "Number" f of
              Right (Just d) -> (Right (Date d))
              Right Nothing -> Left (TypeMismatch "invalid read" "expecting epoch milliseconds")
              Left a -> Left a
       _ ->
         Left (TypeMismatch "Expecting date" (tagOf f))
         -}
readDateMaybe :: Foreign -> F DateMaybe
readDateMaybe f =
  case tagOf f of
       "Date" ->
         case D.fromJSDate <$> unsafeReadTagged "Date" f of
              Right (Just d) -> Right (DateMaybe (Just d))
              Right Nothing -> Left (TypeMismatch "invalid date" "asdf")
              Left a -> Left a
       "String" ->
         case D.fromString <$> unsafeReadTagged "String" f of
              Right (Just d) -> Right (DateMaybe (Just d))
              Right Nothing -> Left (TypeMismatch "invalid date" "invalid date")
              Left a -> Left a
       "Number" ->
         case D.fromEpochMilliseconds <<< T.Milliseconds <$> unsafeReadTagged "Number" f of
              Right (Just d) -> (Right (DateMaybe (Just d)))
              Right Nothing -> Left (TypeMismatch "invalid read" "expecting epoch milliseconds")
              Left a -> Left a
       _ ->
         Left (TypeMismatch "Expecting date" (tagOf f))

{-
instance isForeignDateMaybe :: IsForeign (Maybe Date) where
  read = readDateMaybe

readDateMaybe :: Foreign -> F (Maybe Date)
readDateMaybe f =
  case tagOf f of
       _ -> pure (readDate f)
       -}

toISOString :: DateMaybe -> String
toISOString (DateMaybe Nothing)  = "Invalid date."
toISOString (DateMaybe (Just d)) = runFn2 jsDateMethod "toISOString" (D.toJSDate d)

foreign import jsDateMethod :: forall a. Fn2 String D.JSDate a

yyyy_mm_dd :: DateMaybe -> String
yyyy_mm_dd (DateMaybe Nothing) = "empty"
yyyy_mm_dd (DateMaybe (Just date)) = y ++ "-" ++ m ++ "-" ++ d
  where
    y = (ypad <<< show) case U.year date of D.Year n -> n
    m = pad (1 + (fromEnum $ U.month date))
    d = pad case U.dayOfMonth date of D.DayOfMonth day -> day
    pad n = let str = show n
             in case Str.length str of
                   1 ->  "0" ++ str
                   _ -> str
    ypad str =
      case Str.length str of
           0 -> "0000"
           1 -> "000" ++ str
           2 -> "00" ++ str
           3 -> "0" ++ str
           _ -> str


instance decodeDateMaybe :: DecodeJson DateMaybe where
  decodeJson json = pure defaultDate

  {-
  decodeJson json = case toString json of
                    Nothing -> pure $ defaultDate
                    Just d  -> pure (fromJust $ dateFromString d)
                    -}
    {-
    obj <- decodeJson json
    d <- obj .? "date"
    pure $ (fromJust $ dateFromString d)
    -}
