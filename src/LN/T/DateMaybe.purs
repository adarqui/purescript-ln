module LN.T.DateMaybe where

import Data.String as Str
import Data.Foreign
import Data.Foreign.Class
import Data.Function
import Data.Date as D
import Data.Date.UTC as U
import Data.Time as T
import LN.T.Prelude.Argonaut
import Data.Moment.Simple



newtype DateMaybe = DateMaybe (Maybe D.Date)

instance eqDateMaybe :: Eq DateMaybe where
  eq = eq `on` underlyingDateMaybe

instance ordDateMaybe :: Ord DateMaybe where
  compare = compare `on` underlyingDateMaybe

instance showDateMaybe :: Show DateMaybe where
  show = toISOStringMaybe

underlyingDateMaybe :: DateMaybe -> D.Date
underlyingDateMaybe (DateMaybe (Just d)) = d

nowMaybe :: forall e. Eff (now :: D.Now | e) DateMaybe
nowMaybe = (DateMaybe <<< Just) <$> D.now

dateMaybeFromString :: String -> Maybe DateMaybe
dateMaybeFromString str = (DateMaybe <<< Just) <$> D.fromString str

defaultDateMaybe :: DateMaybe
defaultDateMaybe = DateMaybe $ D.fromString "01-01-2016"

yearMaybe :: DateMaybe -> D.Year
yearMaybe = U.year <<< underlyingDateMaybe

monthMaybe :: DateMaybe -> D.Month
monthMaybe = U.month <<< underlyingDateMaybe

dayOfMonthMaybe :: DateMaybe -> D.DayOfMonth
dayOfMonthMaybe = U.dayOfMonth <<< underlyingDateMaybe

unYearMaybe :: D.Year -> Int
unYearMaybe (D.Year n) = n

unDayOfMonthMaybe :: D.DayOfMonth -> Int
unDayOfMonthMaybe (D.DayOfMonth n) = n

instance isForeignDateMaybe :: IsForeign DateMaybe where
  read = readDateMaybe

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
       "Null" -> Right (DateMaybe Nothing)
       _ -> Right (DateMaybe Nothing)
--          Left (TypeMismatch "readDateMaybe: Expecting date" (tagOf f))

toISOStringMaybe :: DateMaybe -> String
toISOStringMaybe (DateMaybe Nothing)  = "Invalid date."
toISOStringMaybe (DateMaybe (Just d)) = runFn2 jsDateMethodMaybe "toISOString" (D.toJSDate d)

foreign import jsDateMethodMaybe :: forall a. Fn2 String D.JSDate a

yyyy_mm_dd_Maybe :: DateMaybe -> String
yyyy_mm_dd_Maybe (DateMaybe Nothing) = "empty"
yyyy_mm_dd_Maybe (DateMaybe (Just date)) = y ++ "-" ++ m ++ "-" ++ d
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
  decodeJson json = pure defaultDateMaybe

  -- wtf how does this work ^^

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



-- moment :: DateMaybe -> String
moment d = fromDate $ underlyingDateMaybe d

humanMoment d = calendar $ fromDate $ underlyingDateMaybe d
