## Module LN.Api.Prelude


### Re-exported from Control.Monad.Aff:

#### `Aff`

``` purescript
data Aff :: # ! -> * -> *
```

An asynchronous computation with effects `e`. The computation either
errors or produces a value of type `a`.

This is moral equivalent of `ErrorT (ContT Unit (Eff e)) a`.

##### Instances
``` purescript
(Semigroup a) => Semigroup (Aff e a)
(Monoid a) => Monoid (Aff e a)
Functor (Aff e)
Apply (Aff e)
Applicative (Aff e)
Bind (Aff e)
Monad (Aff e)
MonadEff e (Aff e)
MonadError Error (Aff e)
Alt (Aff e)
Plus (Aff e)
Alternative (Aff e)
MonadPlus (Aff e)
MonadRec (Aff e)
MonadCont (Aff e)
```

#### `Canceler`

``` purescript
newtype Canceler e
  = Canceler (Error -> Aff e Boolean)
```

A canceler is asynchronous function that can be used to attempt the
cancelation of a computation. Returns a boolean flag indicating whether
or not the cancellation was successful. Many computations may be composite,
in such cases the flag indicates whether any part of the computation was
successfully canceled. The flag should not be used for communication.

##### Instances
``` purescript
Semigroup (Canceler e)
Monoid (Canceler e)
```

#### `PureAff`

``` purescript
type PureAff a = forall e. Aff e a
```

A pure asynchronous computation, having no effects other than
asynchronous computation.

#### `apathize`

``` purescript
apathize :: forall e a. Aff e a -> Aff e Unit
```

Ignores any errors.

#### `attempt`

``` purescript
attempt :: forall e a. Aff e a -> Aff e (Either Error a)
```

Promotes any error to the value level of the asynchronous monad.

#### `cancel`

``` purescript
cancel :: forall e. Canceler e -> Error -> Aff e Boolean
```

Unwraps the canceler function from the newtype that wraps it.

#### `cancelWith`

``` purescript
cancelWith :: forall e a. Aff e a -> Canceler e -> Aff e a
```

This function allows you to attach a custom canceler to an asynchronous
computation. If the computation is canceled, then the custom canceler
will be run along side the computation's own canceler.

#### `finally`

``` purescript
finally :: forall e a b. Aff e a -> Aff e b -> Aff e a
```

Compute `aff1`, followed by `aff2` regardless of whether `aff1` terminated successfully.

#### `forkAff`

``` purescript
forkAff :: forall e a. Aff e a -> Aff e (Canceler e)
```

Forks the specified asynchronous computation so subsequent computations
will not block on the result of the computation.

Returns a canceler that can be used to attempt cancellation of the
forked computation.

#### `forkAll`

``` purescript
forkAll :: forall f e a. Foldable f => f (Aff e a) -> Aff e (Canceler e)
```

Forks many asynchronous computation in a synchronous manner while being
stack-safe up to the selected Foldable instance.

Returns a canceler that can be used to attempt cancellation of all
forked computations.

#### `later`

``` purescript
later :: forall e a. Aff e a -> Aff e a
```

Runs the asynchronous computation off the current execution context.

#### `later'`

``` purescript
later' :: forall e a. Int -> Aff e a -> Aff e a
```

Runs the specified asynchronous computation later, by the specified
number of milliseconds.

#### `launchAff`

``` purescript
launchAff :: forall e a. Aff e a -> Eff (err :: EXCEPTION | e) Unit
```

Converts the asynchronous computation into a synchronous one. All values
are ignored, and if the computation produces an error, it is thrown.

Catching exceptions by using `catchException` with the resulting Eff
computation is not recommended, as exceptions may end up being thrown
asynchronously, in which case they cannot be caught.

If you do need to handle exceptions, you can use `runAff` instead, or
you can handle the exception within the Aff computation, using
`catchError` (or any of the other mechanisms).

#### `liftEff'`

``` purescript
liftEff' :: forall e a. Eff (err :: EXCEPTION | e) a -> Aff e (Either Error a)
```

Lifts a synchronous computation and makes explicit any failure from exceptions.

#### `makeAff`

``` purescript
makeAff :: forall e a. ((Error -> Eff e Unit) -> (a -> Eff e Unit) -> Eff e Unit) -> Aff e a
```

Creates an asynchronous effect from a function that accepts error and
success callbacks. This function can be used for asynchronous computations
that cannot be canceled.

#### `makeAff'`

``` purescript
makeAff' :: forall e a. ((Error -> Eff e Unit) -> (a -> Eff e Unit) -> Eff e (Canceler e)) -> Aff e a
```

Creates an asynchronous effect from a function that accepts error and
success callbacks, and returns a canceler for the computation. This
function can be used for asynchronous computations that can be canceled.

#### `nonCanceler`

``` purescript
nonCanceler :: forall e. Canceler e
```

A constant canceller that always returns false.

#### `runAff`

``` purescript
runAff :: forall e a. (Error -> Eff e Unit) -> (a -> Eff e Unit) -> Aff e a -> Eff e Unit
```

Runs the asynchronous computation. You must supply an error callback and a
success callback.

### Re-exported from Control.Monad.Aff.Class:

#### `MonadAff`

``` purescript
class MonadAff e m where
  liftAff :: forall a. Aff e a -> m a
```

##### Instances
``` purescript
MonadAff e (Aff e)
(Monad m, MonadAff eff m) => MonadAff eff (ContT r m)
(Monad m, MonadAff eff m) => MonadAff eff (ExceptT e m)
(Monad m, MonadAff eff m) => MonadAff eff (ListT m)
(Monad m, MonadAff eff m) => MonadAff eff (MaybeT m)
(Monad m, MonadAff eff m) => MonadAff eff (ReaderT r m)
(Monad m, Monoid w, MonadAff eff m) => MonadAff eff (RWST r w s m)
(Monad m, MonadAff eff m) => MonadAff eff (StateT s m)
(Monad m, Monoid w, MonadAff eff m) => MonadAff eff (WriterT w m)
```

### Re-exported from Control.Monad.Aff.Console:

#### `log`

``` purescript
log :: forall e. String -> Aff (console :: CONSOLE | e) Unit
```

Logs any string to the console. This basically saves you
from writing `liftEff $ log x` everywhere.

### Re-exported from Control.Monad.Eff.Console:

#### `CONSOLE`

``` purescript
data CONSOLE :: !
```

The `CONSOLE` effect represents those computations which write to the console.

### Re-exported from Data.Foreign.Class:

#### `IsForeign`

``` purescript
class IsForeign a where
  read :: Foreign -> F a
```

A type class instance for this class can be written for a type if it
is possible to attempt to _safely_ coerce a `Foreign` value to that
type.

Instances are provided for standard data structures, and the `F` monad
can be used to construct instances for new data structures.

##### Instances
``` purescript
IsForeign Foreign
IsForeign String
IsForeign Char
IsForeign Boolean
IsForeign Number
IsForeign Int
(IsForeign a) => IsForeign (Array a)
(IsForeign a) => IsForeign (Null a)
(IsForeign a) => IsForeign (Undefined a)
(IsForeign a) => IsForeign (NullOrUndefined a)
(IsForeign a) => IsForeign (Maybe a)
(IsForeign a, IsForeign b) => IsForeign (Tuple a b)
```

#### `readJSON`

``` purescript
readJSON :: forall a. IsForeign a => String -> F a
```

Attempt to read a data structure from a JSON string

#### `readProp`

``` purescript
readProp :: forall a i. (IsForeign a, Index i) => i -> Foreign -> F a
```

Attempt to read a property of a foreign value at the specified index

#### `readWith`

``` purescript
readWith :: forall a e. IsForeign a => (ForeignError -> e) -> Foreign -> Either e a
```

Attempt to read a foreign value, handling errors using the specified function

### Re-exported from Data.Maybe:

#### `Maybe`

``` purescript
data Maybe a
  = Nothing
  | Just a
```

The `Maybe` type is used to represent optional values and can be seen as
something like a type-safe `null`, where `Nothing` is `null` and `Just x`
is the non-null value `x`.

##### Instances
``` purescript
Functor Maybe
Apply Maybe
Applicative Maybe
Alt Maybe
Plus Maybe
Alternative Maybe
Bind Maybe
Monad Maybe
MonadPlus Maybe
Extend Maybe
Invariant Maybe
(Semigroup a) => Semigroup (Maybe a)
(Semigroup a) => Monoid (Maybe a)
(Semiring a) => Semiring (Maybe a)
(ModuloSemiring a) => ModuloSemiring (Maybe a)
(Ring a) => Ring (Maybe a)
(DivisionRing a) => DivisionRing (Maybe a)
(Num a) => Num (Maybe a)
(Eq a) => Eq (Maybe a)
(Ord a) => Ord (Maybe a)
(Bounded a) => Bounded (Maybe a)
(BoundedOrd a) => BoundedOrd (Maybe a)
(BooleanAlgebra a) => BooleanAlgebra (Maybe a)
(Show a) => Show (Maybe a)
```

#### `fromMaybe`

``` purescript
fromMaybe :: forall a. a -> Maybe a -> a
```

Takes a default value, and a `Maybe` value. If the `Maybe` value is
`Nothing` the default value is returned, otherwise the value inside the
`Just` is returned.

``` purescript
fromMaybe x Nothing == x
fromMaybe x (Just y) == y
```

#### `fromMaybe'`

``` purescript
fromMaybe' :: forall a. (Unit -> a) -> Maybe a -> a
```

Similar to `fromMaybe` but for use in cases where the default value may be
expensive to compute. As PureScript is not lazy, the standard `fromMaybe`
has to evaluate the default value before returning the result, whereas here
the value is only computed when the `Maybe` is known to be `Nothing`.

``` purescript
fromMaybe' (\_ -> x) Nothing == x
fromMaybe' (\_ -> x) (Just y) == y
```

#### `isJust`

``` purescript
isJust :: forall a. Maybe a -> Boolean
```

Returns `true` when the `Maybe` value was constructed with `Just`.

#### `isNothing`

``` purescript
isNothing :: forall a. Maybe a -> Boolean
```

Returns `true` when the `Maybe` value is `Nothing`.

#### `maybe`

``` purescript
maybe :: forall a b. b -> (a -> b) -> Maybe a -> b
```

Takes a default value, a function, and a `Maybe` value. If the `Maybe`
value is `Nothing` the default value is returned, otherwise the function
is applied to the value inside the `Just` and the result is returned.

``` purescript
maybe x f Nothing == x
maybe x f (Just y) == f y
```

#### `maybe'`

``` purescript
maybe' :: forall a b. (Unit -> b) -> (a -> b) -> Maybe a -> b
```

Similar to `maybe` but for use in cases where the default value may be
expensive to compute. As PureScript is not lazy, the standard `maybe` has
to evaluate the default value before returning the result, whereas here
the value is only computed when the `Maybe` is known to be `Nothing`.

``` purescript
maybe' (\_ -> x) f Nothing == x
maybe' (\_ -> x) f (Just y) == f y
```

### Re-exported from Network.HTTP.Affjax:

#### `AJAX`

``` purescript
data AJAX :: !
```

The effect type for AJAX requests made with Affjax.

#### `Affjax`

``` purescript
type Affjax e a = Aff (ajax :: AJAX | e) (AffjaxResponse a)
```

The type for Affjax requests.

#### `AffjaxRequest`

``` purescript
type AffjaxRequest a = { method :: Either Method CustomMethod, url :: URL, headers :: Array RequestHeader, content :: Maybe a, username :: Maybe String, password :: Maybe String, withCredentials :: Boolean }
```

#### `AffjaxResponse`

``` purescript
type AffjaxResponse a = { status :: StatusCode, headers :: Array ResponseHeader, response :: a }
```

The type of records that will be received as an Affjax response.

#### `RetryDelayCurve`

``` purescript
type RetryDelayCurve = Int -> Int
```

A sequence of retry delays, in milliseconds.

#### `RetryPolicy`

``` purescript
type RetryPolicy = { timeout :: Maybe Int, delayCurve :: RetryDelayCurve, shouldRetryWithStatusCode :: StatusCode -> Boolean }
```

Expresses a policy for retrying Affjax requests with backoff.

#### `URL`

``` purescript
type URL = String
```

Type alias for URL strings to aid readability of types.

#### `affjax`

``` purescript
affjax :: forall e a b. (Requestable a, Respondable b) => AffjaxRequest a -> Affjax e b
```

Makes an `Affjax` request.

#### `affjax'`

``` purescript
affjax' :: forall e a b. (Requestable a, Respondable b) => AffjaxRequest a -> (Error -> Eff (ajax :: AJAX | e) Unit) -> (AffjaxResponse b -> Eff (ajax :: AJAX | e) Unit) -> Eff (ajax :: AJAX | e) (Canceler (ajax :: AJAX | e))
```

Run a request directly without using `Aff`.

#### `defaultRequest`

``` purescript
defaultRequest :: AffjaxRequest Unit
```

#### `defaultRetryPolicy`

``` purescript
defaultRetryPolicy :: RetryPolicy
```

A sensible default for retries: no timeout, maximum delay of 30s, initial delay of 0.1s, exponential backoff, and no status code triggers a retry.

#### `delete`

``` purescript
delete :: forall e a. Respondable a => URL -> Affjax e a
```

Makes a `DELETE` request to the specified URL.

#### `delete_`

``` purescript
delete_ :: forall e. URL -> Affjax e Unit
```

Makes a `DELETE` request to the specified URL and ignores the response.

#### `get`

``` purescript
get :: forall e a. Respondable a => URL -> Affjax e a
```

Makes a `GET` request to the specified URL.

#### `post`

``` purescript
post :: forall e a b. (Requestable a, Respondable b) => URL -> a -> Affjax e b
```

Makes a `POST` request to the specified URL, sending data.

#### `post'`

``` purescript
post' :: forall e a b. (Requestable a, Respondable b) => URL -> Maybe a -> Affjax e b
```

Makes a `POST` request to the specified URL with the option to send data.

#### `post_`

``` purescript
post_ :: forall e a. Requestable a => URL -> a -> Affjax e Unit
```

Makes a `POST` request to the specified URL, sending data and ignoring the
response.

#### `post_'`

``` purescript
post_' :: forall e a. Requestable a => URL -> Maybe a -> Affjax e Unit
```

Makes a `POST` request to the specified URL with the option to send data,
and ignores the response.

#### `put`

``` purescript
put :: forall e a b. (Requestable a, Respondable b) => URL -> a -> Affjax e b
```

Makes a `PUT` request to the specified URL, sending data.

#### `put'`

``` purescript
put' :: forall e a b. (Requestable a, Respondable b) => URL -> Maybe a -> Affjax e b
```

Makes a `PUT` request to the specified URL with the option to send data.

#### `put_`

``` purescript
put_ :: forall e a. Requestable a => URL -> a -> Affjax e Unit
```

Makes a `PUT` request to the specified URL, sending data and ignoring the
response.

#### `put_'`

``` purescript
put_' :: forall e a. Requestable a => URL -> Maybe a -> Affjax e Unit
```

Makes a `PUT` request to the specified URL with the option to send data,
and ignores the response.

#### `retry`

``` purescript
retry :: forall e a b. Requestable a => RetryPolicy -> (AffjaxRequest a -> Affjax (avar :: AVAR, ref :: REF | e) b) -> (AffjaxRequest a -> Affjax (avar :: AVAR, ref :: REF | e) b)
```

Retry a request using a `RetryPolicy`. After the timeout, the last received response is returned; if it was not possible to communicate with the server due to an error, then this is bubbled up.

### Re-exported from Network.HTTP.Affjax.Request:

#### `RequestContent`

``` purescript
data RequestContent :: *
```

Type representing all content types that be sent via XHR (ArrayBufferView,
Blob, Document, String, FormData).

##### Instances
``` purescript
Requestable RequestContent
```

#### `Requestable`

``` purescript
class Requestable a where
  toRequest :: a -> Tuple (Maybe MediaType) RequestContent
```

A class for types that can be converted to values that can be sent with
XHR requests. An optional mime-type can be specified for a default
`Content-Type` header.

##### Instances
``` purescript
Requestable RequestContent
Requestable (ArrayView Int8)
Requestable (ArrayView Int16)
Requestable (ArrayView Int32)
Requestable (ArrayView Uint8)
Requestable (ArrayView Uint16)
Requestable (ArrayView Uint32)
Requestable (ArrayView Uint8Clamped)
Requestable (ArrayView Float32)
Requestable (ArrayView Float64)
Requestable Blob
Requestable Document
Requestable String
Requestable Json
Requestable FormData
Requestable FormURLEncoded
Requestable Unit
```

### Re-exported from Network.HTTP.Affjax.Response:

#### `ResponseContent`

``` purescript
type ResponseContent = Foreign
```

Type representing content types that be received from an XHR request
(Blob, Document, JSON, String). An optional mime-type can be specified for
a default `Accept` header.

#### `ResponseType`

``` purescript
data ResponseType a
  = ArrayBufferResponse
  | BlobResponse
  | DocumentResponse
  | JSONResponse
  | StringResponse
```

Valid response types for an AJAX request. This is used to determine the
`ResponseContent` type for a request. The `a` type variable is a phantom
type used to associate the `ResponseType` with a particular instance of
`Respondable`.

##### Instances
``` purescript
Eq (ResponseType a)
Show (ResponseType a)
```

#### `Respondable`

``` purescript
class Respondable a where
  responseType :: Tuple (Maybe MediaType) (ResponseType a)
  fromResponse :: ResponseContent -> F a
```

##### Instances
``` purescript
Respondable Blob
Respondable Document
Respondable Foreign
Respondable String
Respondable Unit
Respondable ArrayBuffer
Respondable Json
```

#### `responseTypeToString`

``` purescript
responseTypeToString :: forall a. (ResponseType a) -> String
```

### Re-exported from Network.HTTP.RequestHeader:

#### `RequestHeader`

``` purescript
data RequestHeader
  = Accept MediaType
  | ContentType MediaType
  | RequestHeader String String
```

##### Instances
``` purescript
Eq RequestHeader
Show RequestHeader
```

#### `requestHeaderName`

``` purescript
requestHeaderName :: RequestHeader -> String
```

#### `requestHeaderValue`

``` purescript
requestHeaderValue :: RequestHeader -> String
```

