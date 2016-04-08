module LN.Helpers.ScrollBottom where



import Prelude (Unit)
import Data.Function (Fn1(),runFn1)
import Control.Monad.Eff (Eff)
import DOM (DOM)


foreign import scrollBottomImpl :: forall e. Fn1 String (Eff (dom :: DOM | e) Unit)
scrollBottom :: forall e. String -> Eff (dom :: DOM | e) Unit
scrollBottom = runFn1 scrollBottomImpl
